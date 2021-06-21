import 'package:flutter/material.dart';

import '../models/todo_item.dart';
import '../widgets/todo_form.dart';
import 'todos_detail_screen.dart';

class EditTodoScreen extends StatelessWidget {
  static const routeName = '/edit-todo';
  @override
  Widget build(BuildContext context) {
    var todoItem = ModalRoute.of(context)?.settings.arguments as TodoItem;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
                TodosDetailScreen.routeName,
                arguments: todoItem.id);
          },
        ),
        title: Text(
          'Edit Todo',
        ),
      ),
      body: Center(
        child: TodoForm(todoItem),
      ),
    );
  }
}
