import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/todo_item.dart';

class TodosDetailScreen extends StatelessWidget {
  static const routeName = '/todos-detail';

  TodosDetailScreen();

  @override
  Widget build(BuildContext context) {
    final todoItem = ModalRoute.of(context)?.settings.arguments as TodoItem;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
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
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                todoItem.title,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              endIndent: 12,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              todoItem.description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
