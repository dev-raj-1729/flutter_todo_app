import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/constants.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:flutter_to_do/screens/add_todoscreen.dart';
import 'package:flutter_to_do/widgets/todo_search.dart';
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
          PopupMenuButton(
            tooltip: "Sort and Filter",
            child: Icon(Icons.filter_list_rounded),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: PopupMenuButton<Sort>(
                  child: Text('Sort by'),
                  onSelected: (s) =>
                      Provider.of<Todos>(context, listen: false).orderBy(s),
                  itemBuilder: (context) => [
                    PopupMenuItem<Sort>(
                      value: Sort.lastChangedAsc,
                      child: Text('Last Modified : Newest First'),
                    ),
                    PopupMenuItem<Sort>(
                      value: Sort.lastChangedDesc,
                      child: Text('Last Modified : Oldest First'),
                    ),
                    PopupMenuItem<Sort>(
                      value: Sort.priorityAsc,
                      child: Text('Priority : Highest First'),
                    ),
                    PopupMenuItem<Sort>(
                      value: Sort.priorityDesc,
                      child: Text('Priority : Lowest First'),
                    ),
                  ],
                ),
              ),
            ],
          )
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
