import 'package:flutter/material.dart';

class TodoDetail extends StatelessWidget {
  final todoItem;
  TodoDetail(this.todoItem);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
