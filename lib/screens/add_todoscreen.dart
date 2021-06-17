import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  static const routeName = '/add-todo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a todo'),
      ),
      body: Center(
        child: Text('TodoScreen'),
      ),
    );
  }
}
