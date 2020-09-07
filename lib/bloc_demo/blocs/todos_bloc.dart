import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_provider_demo/bloc_demo/blocs/todos_events.dart';
import 'package:todo_provider_demo/bloc_demo/blocs/todos_states.dart';
import 'package:todo_provider_demo/models/todo_entity.dart';
import 'package:todo_provider_demo/repositories/todo_repository.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final ITodoRepository repository;

  TodosBloc({this.repository}) : super(TodosLoadInProgress());

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is LoadTodos) {
      yield* _mapLoadTodosSuccessToState();
    } else if (event is AddTodo) {
      yield* _mapAddTodoToState(event);
    } else if (event is RemoveTodo) {
      yield* _mapRemoveTodoToState(event);
    }
  }

  Stream<TodosState> _mapLoadTodosSuccessToState() async* {
    final todos = await this.repository.getAllTodos();
    yield TodosLoadSuccess(todos);
  }

  Stream<TodosState> _mapAddTodoToState(AddTodo event) async* {
    if (state is TodosLoadSuccess) {
      await this.repository.addTodo(event.todo);
      final List<TodoEntity> updatedTodos =
          List.from((state as TodosLoadSuccess).todos)..add(event.todo);
      yield TodosLoadSuccess(updatedTodos);
    }
  }

  Stream<TodosState> _mapRemoveTodoToState(RemoveTodo event) async* {
    if (state is TodosLoadSuccess) {
      await this.repository.removeTodoWithId(event.id);
      final List<TodoEntity> updatedTodos =
          List.from((state as TodosLoadSuccess).todos)
            ..removeWhere((element) => element.id == event.id);
      yield TodosLoadSuccess(updatedTodos);
    }
  }
}
