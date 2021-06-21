import 'package:flutter_to_do/models/todo_item.dart';

class Priorities {
  static const high = 0;
  static const low = 1;
  static const none = 2;

  static int fromString(String str) {
    switch (str.toLowerCase()) {
      case 'high':
        return Priorities.high;
      case 'low':
        return Priorities.low;
      case 'none':
        return Priorities.none;
      default:
        return 0;
    }
  }

  static String getString(int priority) {
    switch (priority) {
      case Priorities.high:
        return "High";
      case Priorities.low:
        return "Low";
      case Priorities.none:
        return "None";
      default:
        return "None";
    }
  }
}

enum Sort {
  lastChangedAsc,
  lastChangedDesc,
  priorityAsc,
  priorityDesc,
  none,
}
final defaultTodo =
    TodoItem(id: '0', title: 'Title', lastChanged: DateTime.now());
