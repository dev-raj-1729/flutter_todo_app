import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:flutter_to_do/screens/add_todoscreen.dart';
import 'package:flutter_to_do/widgets/todo_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<Todos>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('To-do list'),
      ),
      body: ListView.builder(
        itemCount: todosProvider.todo.length,
        itemBuilder: (context, index) => TodoTile(todosProvider.todo[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddTodoScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
