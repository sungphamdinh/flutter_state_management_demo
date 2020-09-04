import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_demo/models/todo_entity.dart';
import 'package:todo_provider_demo/provider_demo/providers/todo_list.dart';

class AddTodoScreen extends StatefulWidget {
  static const routeName = '/add-todo';
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  String _title = "";
  String _content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Todo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  _title = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Content'),
                onChanged: (value) {
                  _content = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                child: Text("Save"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  if (_title.isNotEmpty && _content.isNotEmpty) {
                    Provider.of<TodoList>(context, listen: false).addTodo(
                        TodoEntity(
                            id: DateTime.now().toIso8601String(),
                            title: _title,
                            content: _content));
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
