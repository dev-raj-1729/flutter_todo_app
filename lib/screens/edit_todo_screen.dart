import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/todo_item.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:flutter_to_do/screens/todos_detail_screen.dart';
import 'package:provider/provider.dart';

class EditTodoScreen extends StatelessWidget {
  static const routeName = '/edit-todo';
  @override
  Widget build(BuildContext context) {
    var todoItem = ModalRoute.of(context)?.settings.arguments as TodoItem;
    Provider.of<Todos>(context, listen: false).updateItemById(
      todoItem.id,
      todoItem.copyWith(title: 'Kilroy was here'),
    );
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
        child: Text(todoItem.title),
      ),
    );
  }
}
