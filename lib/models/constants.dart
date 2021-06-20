import 'package:flutter_to_do/models/todo_item.dart';

class Priorities {
  static const high = 0;
  static const low = 1;
  static const none = 2;
}

final defaultTodo =
    TodoItem(id: '0', title: 'Title', lastChanged: DateTime.now());
