import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: Text('Ok'),
            ),
          ),
        ],
      ),
    );
  }
}
