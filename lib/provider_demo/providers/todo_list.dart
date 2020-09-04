import 'package:flutter/foundation.dart';
import 'package:todo_provider_demo/models/todo_entity.dart';
import 'package:todo_provider_demo/repositories/todo_repository.dart';

class TodoList with ChangeNotifier {
  final TodoRepository todoRepository;
  TodoList({this.todoRepository});

  List<TodoEntity> _todoEntities = [];
  List<TodoEntity> get todoEntities => [..._todoEntities];

  Future<void> getAllTodos() async {
    await this.todoRepository.getAllTodos();
    notifyListeners();
  }

  Future<void> addTodo(TodoEntity todoEntity) async {
    await this.todoRepository.addTodo(todoEntity);
    _todoEntities.add(todoEntity);
    notifyListeners();
  }

  Future<void> deleteTodoId(String id) async {
    Future.delayed(Duration(milliseconds: 200), () {});
    _todoEntities.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
