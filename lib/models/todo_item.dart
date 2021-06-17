import 'package:flutter_to_do/models/constants.dart';

class TodoItem {
  String id;
  String title;
  String description;
  String label;
  bool checkbox;
  int priority;
  DateTime lastChanged;
  TodoItem({
    required this.id,
    required this.title,
    this.description = "",
    this.label = "none",
    this.checkbox = false,
    this.priority = Priorities.none,
    required this.lastChanged,
  });
}
