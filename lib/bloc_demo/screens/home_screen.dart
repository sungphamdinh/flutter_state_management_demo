import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_provider_demo/bloc_demo/blocs/todos_bloc.dart';
import 'package:todo_provider_demo/bloc_demo/blocs/todos_events.dart';
import 'package:todo_provider_demo/bloc_demo/blocs/todos_states.dart';
import 'package:todo_provider_demo/bloc_demo/screens/todo_item.dart';
import 'package:todo_provider_demo/provider_demo/screens/add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodosBloc>(context).add(LoadTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: BlocBuilder<TodosBloc, TodosState>(builder: (ctx, state) {
        if (state is TodosLoadSuccess) {
          final todoList = state.todos;
          return Container(
            margin: EdgeInsets.all(20),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                final todo = todoList[index];
                return TodoItem(
                  id: todo.id,
                  title: todo.title,
                  content: todo.content,
                );
              },
              itemCount: todoList.length,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddTodoScreen.routeName);
        },
      ),
    );
  }
}
