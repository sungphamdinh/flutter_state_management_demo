import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_demo/bloc_demo/blocs/todos_bloc.dart';
import 'package:todo_provider_demo/bloc_demo/screens/add_todo_screen.dart';
import 'package:todo_provider_demo/bloc_demo/screens/home_screen.dart';
import 'package:todo_provider_demo/data/todo_api.dart';
import 'package:todo_provider_demo/provider_demo/providers/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider
    // return ChangeNotifierProvider(
    //   create: (ctx) => TodoList(todoRepository: TodoAPI()),
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: HomeScreen(),
    //     routes: {AddTodoScreen.routeName: (ctx) => AddTodoScreen()},
    //   ),
    // );

    // Bloc
    return BlocProvider<TodosBloc>(
      create: (ctx) => TodosBloc(repository: TodoAPI()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {AddTodoScreen.routeName: (ctx) => AddTodoScreen()},
      ),
    );
  }
}
