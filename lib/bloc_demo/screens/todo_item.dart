import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_demo/bloc_demo/blocs/todos_bloc.dart';
import 'package:todo_provider_demo/bloc_demo/blocs/todos_events.dart';
import 'package:todo_provider_demo/provider_demo/providers/todo_list.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final String content;
  final String id;

  TodoItem({this.id, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(
                  content,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                BlocProvider.of<TodosBloc>(context).add(RemoveTodo(id));
              },
            )
          ],
        ));
  }
}
