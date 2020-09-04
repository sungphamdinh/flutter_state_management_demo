import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_demo/provider_demo/providers/todo_list.dart';
import 'package:todo_provider_demo/provider_demo/screens/add_todo_screen.dart';
import 'package:todo_provider_demo/provider_demo/screens/todo_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _getAllTodo;

  @override
  void initState() {
    super.initState();
    _getAllTodo = Provider.of<TodoList>(context, listen: false).getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: FutureBuilder(
        future: _getAllTodo,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<TodoList>(
              builder: (ctx, todoList, child) {
                return Container(
                  margin: EdgeInsets.all(20),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      final todo = todoList.todoEntities[index];
                      return TodoItem(
                        id: todo.id,
                        title: todo.title,
                        content: todo.content,
                      );
                    },
                    itemCount: todoList.todoEntities.length,
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddTodoScreen.routeName);
        },
      ),
    );
  }
}
