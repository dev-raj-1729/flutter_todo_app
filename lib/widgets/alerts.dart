import 'package:flutter/material.dart';

class Alerts {
  static Future<bool?> confirmDelete(BuildContext context) {
    return showDialog<bool?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete todo?'),
        content: Text('Are you sure you want to delete this todo?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }
}
