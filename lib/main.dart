import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/todos.dart';
import 'screens/add_todoscreen.dart';
import 'screens/edit_todo_screen.dart';
import 'screens/homescreen.dart';
import 'screens/todos_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Todos(),
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, Widget Function(BuildContext)>{
          HomeScreen.routeName: (context) => HomeScreen(),
          AddTodoScreen.routeName: (context) => AddTodoScreen(),
          TodosDetailScreen.routeName: (context) => TodosDetailScreen(),
          EditTodoScreen.routeName: (context) => EditTodoScreen(),
        },
      ),
    );
  }
}
