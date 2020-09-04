import 'package:equatable/equatable.dart';
import 'package:todo_provider_demo/models/todo_entity.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {}

class AddTodo extends TodosEvent {
  final TodoEntity todo;
  const AddTodo(this.todo);
  @override
  List<Object> get props => [todo];
}

class RemoveTodo extends TodosEvent {
  final String id;
  const RemoveTodo(this.id);
  @override
  List<Object> get props => [id];
}
