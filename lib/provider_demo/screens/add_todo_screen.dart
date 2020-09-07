import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_demo/models/todo_entity.dart';
import 'package:todo_provider_demo/provider_demo/providers/todo_list.dart';

import '../providers/todo_list.dart';

class AddTodoScreen extends StatefulWidget {
  static const routeName = '/add-todo';
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  String _title = "";
  String _content = "";
  String _id = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _id = ModalRoute.of(context).settings.arguments;
    if (_id != null) {
      final todo =
          Provider.of<TodoList>(context, listen: false).todoWithId(_id);
      _title = todo.title;
      _content = todo.content;
    }
  }

  bool isEditMode() {
    return _id != null && _id.isNotEmpty;
  }

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
                controller: TextEditingController()..text = _title,
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  _title = value;
                },
              ),
              TextField(
                controller: TextEditingController()..text = _content,
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
                    final todo = TodoEntity(
                        id: _id == null
                            ? DateTime.now().toIso8601String()
                            : _id,
                        title: _title,
                        content: _content);

                    if (isEditMode()) {
                      Provider.of<TodoList>(context, listen: false)
                          .updateTodo(todo);
                    } else {
                      Provider.of<TodoList>(context, listen: false)
                          .addTodo(todo);
                    }
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
