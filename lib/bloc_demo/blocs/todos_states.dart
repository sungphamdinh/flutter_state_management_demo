import 'package:equatable/equatable.dart';
import 'package:todo_provider_demo/models/todo_entity.dart';

abstract class TodosState extends Equatable {
  const TodosState();
  @override
  List<Object> get props => [];
}

class TodosLoadInProgress extends TodosState {}

class TodosLoadSuccess extends TodosState {
  final List<TodoEntity> todos;
  const TodosLoadSuccess([this.todos = const []]);

  @override
  List<Object> get props => [todos];
}

class TodosLoadFailure extends TodosState {}
