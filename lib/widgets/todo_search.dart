import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/todos.dart';
import 'filter_menu_button.dart';
import 'todo_tile.dart';

class TodoSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      FilterMenuButton(),
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    final resultList = Provider.of<Todos>(context).searchFor(query);
    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) => TodoTile(
        resultList[index],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = Provider.of<Todos>(context).searchFor(query);
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestionList[index].title),
        onTap: () {
          query = suggestionList[index].title;
        },
      ),
    );
  }
}
