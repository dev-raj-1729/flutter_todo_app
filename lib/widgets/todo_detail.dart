import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/constants.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:provider/provider.dart';

class TodoDetail extends StatefulWidget {
  final todoItem;
  TodoDetail(this.todoItem);

  @override
  _TodoDetailState createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
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
              widget.todoItem.title,
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
            widget.todoItem.description == ''
                ? 'No Description'
                : widget.todoItem.description,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                'Priority : ${Priorities.getString(widget.todoItem.priority)}',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              if (widget.todoItem.checkbox)
                Text(
                  'Completed',
                  style: TextStyle(fontSize: 19),
                ),
              if (widget.todoItem.checkbox)
                Checkbox(
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
            ],
          ),
        ],
      ),
    );
  }
}
