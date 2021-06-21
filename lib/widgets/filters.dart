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

  @override
  void initState() {
    super.initState();
    final pList = Provider.of<Todos>(context, listen: false).priorityFilter;
    _priorityHigh = pList.contains(Priorities.high);
    _priorityLow = pList.contains(Priorities.low);
    _priorityNone = pList.contains(Priorities.none);
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
          Container(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Provider.of<Todos>(context, listen: false).setPriorityFilter(
                  priorityHigh: _priorityHigh,
                  priorityLow: _priorityLow,
                  priorityNone: _priorityNone,
                );
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
