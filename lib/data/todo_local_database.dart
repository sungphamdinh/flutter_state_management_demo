import 'package:todo_provider_demo/models/todo_entity.dart';

import '../models/todo_entity.dart';
import '../repositories/todo_repository.dart';

class TodoLocalDatabase extends TodoRepository {
  @override
  Future<void> addTodo(TodoEntity entity) {}

  @override
  Future<List<TodoEntity>> getAllTodos() async {
    final todos = List<TodoEntity>();
    return todos;
  }

  @override
  Future<void> removeTodoWithId(String id) {}

  @override
  Future<void> updateTodo(TodoEntity entity) {}
}
