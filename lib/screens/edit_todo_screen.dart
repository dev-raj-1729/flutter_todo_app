import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/todo_item.dart';

import 'package:flutter_to_do/screens/todos_detail_screen.dart';
import 'package:flutter_to_do/widgets/todo_form.dart';

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
