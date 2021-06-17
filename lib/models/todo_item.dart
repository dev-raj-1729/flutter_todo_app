class TodoItem {
  String id;
  String title;
  String? description;
  String? label;
  bool checkbox;
  int priority;
  late final DateTime creationTime;
  TodoItem({
    required this.id,
    required this.title,
    this.description,
    required this.label,
    this.checkbox = false,
    required this.priority,
  }) {
    creationTime = DateTime.now();
  }
}
