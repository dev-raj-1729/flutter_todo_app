import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/todo_item.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:provider/provider.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({Key? key}) : super(key: key);

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  void _saveForm() {
    if (_formKey.currentState!.validate() == false) return;
    _formKey.currentState!.save();
    Provider.of<Todos>(context, listen: false).addTodoItem(
      TodoItem(
        id: DateTime.now().toIso8601String(),
        title: _title,
        lastChanged: DateTime.now(),
        description: _description,
      ),
    );
    Navigator.of(context).pop();
  }

  String _title = '';
  String _description = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Title'),
              validator: (value) => value == null || value.isEmpty
                  ? 'Please provide a title'
                  : null,
              onSaved: (value) {
                _title = value!;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              onSaved: (value) {
                _description = value ?? '';
              },
              decoration: InputDecoration(hintText: 'Description (Optional)'),
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
