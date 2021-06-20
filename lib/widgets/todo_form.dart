import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/constants.dart';
import 'package:flutter_to_do/models/todo_item.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:flutter_to_do/screens/todos_detail_screen.dart';
import 'package:provider/provider.dart';

class TodoForm extends StatefulWidget {
  final TodoItem? todoItem;

  TodoForm([this.todoItem]);

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  void _saveForm() {
    if (_formKey.currentState!.validate() == false) return;
    _formKey.currentState!.save();
    if (widget.todoItem == null) {
      Provider.of<Todos>(context, listen: false).addTodoItem(
        TodoItem(
          id: DateTime.now().toIso8601String(),
          title: _title,
          lastChanged: DateTime.now(),
          description: _description,
        ),
      );
    } else {
      Provider.of<Todos>(context, listen: false).updateItemById(
        widget.todoItem!.copyWith(
          title: _title,
          description: _description,
        ),
      );
    }
    Navigator.of(context).pushReplacementNamed(
      TodosDetailScreen.routeName,
      arguments: widget.todoItem!.id,
    );
  }

  String _title = '';
  String _description = '';
  int _priority = Priorities.none;
  @override
  Widget build(BuildContext context) {
    if (widget.todoItem != null) _priority = widget.todoItem!.priority;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.todoItem?.title,
              decoration: InputDecoration(hintText: 'Title'),
              validator: (value) => value == null || value.isEmpty
                  ? 'Please provide a title'
                  : null,
              onSaved: (value) {
                _title = value!;
              },
            ),
            TextFormField(
              initialValue: widget.todoItem?.description,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              onSaved: (value) {
                _description = value ?? '';
              },
              decoration: InputDecoration(hintText: 'Description (Optional)'),
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: Row(
                children: [
                  Text(
                    'Priority',
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 125,
                    child: DropdownButtonFormField<String>(
                      value: Priorities.getString(_priority),
                      onChanged: (value) {},
                      items: [
                        DropdownMenuItem<String>(
                          child: Text(
                            Priorities.getString(Priorities.high),
                          ),
                          value: Priorities.getString(Priorities.high),
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            Priorities.getString(Priorities.low),
                          ),
                          value: Priorities.getString(Priorities.low),
                        ),
                        DropdownMenuItem<String>(
                          child: Text(
                            Priorities.getString(Priorities.none),
                          ),
                          value: Priorities.getString(Priorities.none),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10),
              child: ElevatedButton(
                onPressed: _saveForm,
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
