import 'package:flutter_to_do/models/constants.dart';

class TodoItem {
  String id;
  String title;
  String description;
  String label;
  bool checkbox;
  bool checkboxValue;
  int priority;
  DateTime lastChanged;
  TodoItem({
    required this.id,
    required this.title,
    this.description = "",
    this.label = "none",
    this.checkbox = false,
    this.checkboxValue = false,
    this.priority = Priorities.none,
    required this.lastChanged,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "label": label,
      "checkbox": checkbox ? 1 : 0,
      "checkboxValue": checkboxValue ? 1 : 0,
      "priority": priority,
      "lastChanged": lastChanged.toIso8601String(),
    };
  }

  TodoItem copyWith(
      {String? id,
      String? title,
      String? description,
      String? label,
      bool? checkbox,
      bool? checkboxValue,
      int? priority,
      DateTime? lastChanged}) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      lastChanged: lastChanged ?? this.lastChanged,
      checkbox: checkbox ?? this.checkbox,
      checkboxValue: checkboxValue ?? this.checkboxValue,
      description: description ?? this.description,
      label: label ?? this.label,
      priority: priority ?? this.priority,
    );
  }

  // TodoItem.fromMap(Map<String,dynamic> map) {
  //   this.checkbox = map['checkbox']
  // }
}
