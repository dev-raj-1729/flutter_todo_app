import 'package:flutter/material.dart';

import '../widgets/todo_form.dart';

class AddTodoScreen extends StatelessWidget {
  static const routeName = '/add-todo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a todo'),
      ),
      body: TodoForm(),
    );
  }
}
