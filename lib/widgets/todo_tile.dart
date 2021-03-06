import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/todo_item.dart';
import '../models/todos.dart';
import '../screens/todos_detail_screen.dart';
import 'alerts.dart';

class TodoTile extends StatefulWidget {
  final TodoItem todoItem;

  TodoTile(this.todoItem);

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) => Provider.of<Todos>(context, listen: false)
          .removeItemById(widget.todoItem.id),
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
      key: Key(widget.todoItem.id),
      child: Card(
        elevation: 5,
        borderOnForeground: true,
        child: ListTile(
          leading: widget.todoItem.checkbox
              ? Checkbox(
                  value: widget.todoItem.checkboxValue,
                  onChanged: (value) {
                    Provider.of<Todos>(context, listen: false).updateItemById(
                      widget.todoItem.copyWith(checkboxValue: value),
                    );
                    setState(() {
                      widget.todoItem.checkboxValue =
                          value ?? widget.todoItem.checkboxValue;
                    });
                  },
                )
              : null,
          title: Text(
            widget.todoItem.title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            widget.todoItem.description,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(TodosDetailScreen.routeName,
                    arguments: widget.todoItem.id)
                .then((_) => setState(() {}));
          },
        ),
      ),
    );
  }
}
