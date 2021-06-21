import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/todos.dart';
import '../widgets/filter_menu_button.dart';
import '../widgets/todo_search.dart';
import '../widgets/todo_tile.dart';
import 'add_todoscreen.dart';

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
        centerTitle: true,
        title: Text(
          'To-do list',
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: TodoSearch());
            },
            icon: Icon(Icons.search),
          ),
          FilterMenuButton(),
        ],
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
