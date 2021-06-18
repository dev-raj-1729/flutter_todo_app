import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/todo_item.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:provider/provider.dart';

class TodoTile extends StatelessWidget {
  final TodoItem todoItem;

  TodoTile(this.todoItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) => Provider.of<Todos>(context, listen: false)
          .removeItemById(todoItem.id),
      key: Key(todoItem.id),
      child: Card(
        elevation: 5,
        borderOnForeground: true,
        child: ListTile(
          title: Text(todoItem.title),
          subtitle: Text(todoItem.description),
        ),
      ),
    );
  }
}
