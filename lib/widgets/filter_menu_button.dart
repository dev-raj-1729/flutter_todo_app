import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/constants.dart';
import '../models/todos.dart';
import 'filters.dart';

class FilterMenuButton extends StatelessWidget {
  const FilterMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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
        PopupMenuItem(
          child: ListTile(
            title: Text('Filters'),
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (context) => Filters());
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            title: Text('Clear Filters'),
            onTap: () {
              Provider.of<Todos>(context, listen: false).clearFilters();
            },
          ),
        )
      ],
    );
  }
}
