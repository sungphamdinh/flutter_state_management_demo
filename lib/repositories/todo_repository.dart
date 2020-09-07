import 'package:todo_provider_demo/models/todo_entity.dart';

import '../models/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getAllTodos();
  Future<void> addTodo(TodoEntity entity);
  Future<void> removeTodoWithId(String id);
  Future<void> updateTodo(TodoEntity entity);
}
