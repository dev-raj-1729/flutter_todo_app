import 'package:flutter/material.dart';
import 'package:flutter_to_do/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, Widget Function(BuildContext)>{
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
