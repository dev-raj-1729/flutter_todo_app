import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/todos.dart';
import '../widgets/alerts.dart';
import '../widgets/todo_detail.dart';
import 'edit_todo_screen.dart';

class TodosDetailScreen extends StatelessWidget {
  static const routeName = '/todos-detail';

  TodosDetailScreen();

  @override
  Widget build(BuildContext context) {
    final todoItemId = ModalRoute.of(context)?.settings.arguments as String;
    final todoProvider = Provider.of<Todos>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                EditTodoScreen.routeName,
                arguments: todoProvider.getItemById(todoItemId),
              );
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Alerts.confirmDelete(context).then(
                (value) {
                  if (value == true) {
                    todoProvider.removeItemById(todoItemId);
                    Navigator.of(context).pop();
                  }
                },
              );
            },
            icon: Icon(Icons.delete),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: TodoDetail(
        todoProvider.getItemById(todoItemId),
      ),
    );
  }
}
