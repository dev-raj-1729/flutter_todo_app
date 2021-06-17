import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-do list'),
      ),
      body: ListView.builder(
        itemCount: 9,
        itemBuilder: (_, __) => Text(
          DateTime.now().toString(),
        ),
      ),
    );
  }
}
