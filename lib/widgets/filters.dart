import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/constants.dart';
import 'package:flutter_to_do/models/todos.dart';
import 'package:provider/provider.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _priorityHigh = false;
  bool _priorityLow = false;
  bool _priorityNone = false;
  StatusFilter _statusFilter = StatusFilter.both;
  @override
  void initState() {
    super.initState();
    final pList = Provider.of<Todos>(context, listen: false).priorityFilter;
    _priorityHigh = pList.contains(Priorities.high);
    _priorityLow = pList.contains(Priorities.low);
    _priorityNone = pList.contains(Priorities.none);
    _statusFilter = Provider.of<Todos>(context, listen: false).statusFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filters',
            style: TextStyle(fontSize: 25),
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                'Priority',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Checkbox(
                  value: _priorityHigh,
                  onChanged: (value) {
                    setState(() {
                      _priorityHigh = value ?? _priorityHigh;
                    });
                  }),
              Text(
                'High',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                width: 10,
              ),
              Checkbox(
                  value: _priorityLow,
                  onChanged: (value) {
                    setState(() {
                      _priorityLow = value ?? _priorityLow;
                    });
                  }),
              Text(
                'Low',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                width: 10,
              ),
              Checkbox(
                  value: _priorityNone,
                  onChanged: (value) {
                    setState(() {
                      _priorityNone = value ?? _priorityNone;
                    });
                  }),
              Text(
                'None',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Text(
                  'Status  ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                DropdownButton<StatusFilter>(
                  value: _statusFilter,
                  onChanged: (value) {
                    setState(() {
                      _statusFilter = value ?? _statusFilter;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: StatusFilter.both,
                      child: Text('Both'),
                    ),
                    DropdownMenuItem(
                      value: StatusFilter.complete,
                      child: Text('Complete'),
                    ),
                    DropdownMenuItem(
                      value: StatusFilter.incomplete,
                      child: Text('Incomplete'),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                (Provider.of<Todos>(context, listen: false)
                      ..setPriorityFilter(
                        priorityHigh: _priorityHigh,
                        priorityLow: _priorityLow,
                        priorityNone: _priorityNone,
                      ))
                    .setStatusFilter(_statusFilter);
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ),
        ],
      ),
    );
  }
}
