import 'package:todo_provider_demo/models/todo_entity.dart';
import 'package:todo_provider_demo/repositories/todo_repository.dart';

class TodoAPI extends ITodoRepository {
  List<TodoEntity> todoEntities = [];

  @override
  Future<void> addTodo(TodoEntity entity) async {
    await Future.delayed(Duration(milliseconds: 100), () {});
    todoEntities.add(entity);
  }

  @override
  Future<void> removeTodoWithId(String id) async {
    await Future.delayed(Duration(milliseconds: 100), () {});
    todoEntities.removeWhere((element) => element.id == id);
  }

  @override
  Future<List<TodoEntity>> getAllTodos() async {
    await Future.delayed(Duration(seconds: 2), () {});
    return todoEntities;
  }

  @override
  Future<void> updateTodo(TodoEntity entity) async {
    await Future.delayed(Duration(seconds: 2), () {});
  }
}
