import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:flutter_to_do/screens/homescreen.dart';
import 'package:provider/provider.dart';

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
        },
      ),
    );
  }
}
