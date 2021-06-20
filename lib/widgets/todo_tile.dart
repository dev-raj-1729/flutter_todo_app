import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/todo_item.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:flutter_to_do/screens/todos_detail_screen.dart';
import 'package:flutter_to_do/widgets/alerts.dart';
import 'package:provider/provider.dart';

class TodoTile extends StatelessWidget {
  final TodoItem todoItem;

  TodoTile(this.todoItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) => Provider.of<Todos>(context, listen: false)
          .removeItemById(todoItem.id),
      confirmDismiss: (_) => Alerts.confirmDelete(context),
      background: Container(
        color: Theme.of(context).errorColor,
        padding: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 35,
        ),
      ),
      key: Key(todoItem.id),
      child: Card(
        elevation: 5,
        borderOnForeground: true,
        child: ListTile(
          title: Text(
            todoItem.title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            todoItem.description,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(TodosDetailScreen.routeName, arguments: todoItem);
          },
        ),
      ),
    );
  }
}
