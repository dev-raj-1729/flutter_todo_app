import 'package:flutter/cupertino.dart';
import 'package:flutter_to_do/models/constants.dart';
import 'package:flutter_to_do/models/todo_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Todos with ChangeNotifier {
  static const _dbName = 'todosDatabase.db';
  static const _todosTableName = "todos";
  late final Database db;
  List<TodoItem> _todos = [];
  List<int> priorityFilter = [];
  Sort _currentSort = Sort.lastChangedAsc;
  StatusFilter _statusFilter = StatusFilter.both;

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE "
      "$_todosTableName("
      "id TEXT PRIMARY KEY,"
      "title TEXT,"
      "description TEXT,"
      "label TEXT,"
      "checkbox INTEGER,"
      "checkboxValue INTEGER,"
      "priority INTEGER,"
      "lastChanged TEXT"
      ")",
    );
  }

  Future<void> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _dbName);
    db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Todos() {
    initDatabase().then((value) => fetchAndUpdate());
  }
  void addTodoItem(TodoItem todoItem) {
    _todos.add(todoItem);
    db.insert(_todosTableName, todoItem.toMap());
    orderBy(_currentSort);
    notifyListeners();
  }

  void removeItemById(String id) {
    _todos.removeWhere((element) => element.id == id);
    db.delete(_todosTableName, where: 'id==?', whereArgs: [id]);
    notifyListeners();
  }

  void fetchAndUpdate() async {
    _todos = (await db.query(_todosTableName))
        .map((e) => TodoItem.fromMap(e))
        .toList();
    _todos.sort((todoItem1, todoItem2) =>
        todoItem1.lastChanged.isAfter(todoItem2.lastChanged) ? -1 : 1);
    notifyListeners();
  }

  List<TodoItem> get todo {
    return _filterByStatus(_filterByPriority([..._todos]));
  }

  List<TodoItem> searchFor(String sub) {
    return sub.isEmpty
        ? []
        : todo
            .where(
              (element) =>
                  element.title.toLowerCase().startsWith(sub.toLowerCase()),
            )
            .toList();
  }

  void updateItemById(TodoItem todoItem) {
    _todos.forEach((element) {
      if (element.id == todoItem.id) {
        element.checkboxValue = todoItem.checkboxValue;
        element.checkbox = todoItem.checkbox;
        element.description = todoItem.description;
        element.label = todoItem.label;
        element.lastChanged = todoItem.lastChanged;
        element.priority = todoItem.priority;
        element.title = todoItem.title;
      }
    });
    db.insert(_todosTableName, todoItem.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    orderBy(_currentSort);
    notifyListeners();
  }

  TodoItem getItemById(String id) {
    return _todos.firstWhere((element) => element.id == id,
        orElse: () => defaultTodo);
  }

  void orderBy(Sort s) {
    _currentSort = s;
    switch (s) {
      case Sort.lastChangedAsc:
        _todos.sort((todoItem1, todoItem2) =>
            todoItem1.lastChanged.isAfter(todoItem2.lastChanged) ? -1 : 1);
        break;
      case Sort.lastChangedDesc:
        _todos.sort((todoItem1, todoItem2) =>
            todoItem1.lastChanged.isBefore(todoItem2.lastChanged) ? -1 : 1);
        break;
      case Sort.priorityAsc:
        _todos.sort((todoItem1, todoItem2) =>
            todoItem1.priority < todoItem2.priority ? -1 : 1);
        break;
      case Sort.priorityDesc:
        _todos.sort((todoItem1, todoItem2) =>
            todoItem1.priority > todoItem2.priority ? -1 : 1);
        break;
      case Sort.none:
        break;
    }
    notifyListeners();
  }

  void setPriorityFilter(
      {bool? priorityHigh, bool? priorityLow, bool? priorityNone}) {
    priorityFilter = [];
    if (priorityHigh == true) {
      priorityFilter.add(Priorities.high);
    }
    if (priorityLow == true) {
      priorityFilter.add(Priorities.low);
    }
    if (priorityNone == true) {
      priorityFilter.add(Priorities.none);
    }
    notifyListeners();
  }

  List<TodoItem> _filterByPriority(List<TodoItem> todos) {
    todos.removeWhere((element) {
      if (priorityFilter.isEmpty || priorityFilter.contains(element.priority))
        return false;
      return true;
    });
    return todos;
  }

  void setStatusFilter(StatusFilter statusFilter) {
    _statusFilter = statusFilter;
    notifyListeners();
  }

  StatusFilter get statusFilter {
    return _statusFilter;
  }

  List<TodoItem> _filterByStatus(List<TodoItem> todo) {
    switch (_statusFilter) {
      case StatusFilter.both:
        break;
      case StatusFilter.complete:
        todo.removeWhere(
          (element) => !(element.checkbox && element.checkboxValue),
        );
        break;
      case StatusFilter.incomplete:
        todo.removeWhere(
          (element) => !(element.checkbox && (!element.checkboxValue)),
        );
    }
    return todo;
  }

  void clearFilters() {
    _statusFilter = StatusFilter.both;
    priorityFilter = [];
    notifyListeners();
  }
}
