import 'package:flutter/cupertino.dart';
import 'package:flutter_to_do/models/constants.dart';
import 'package:flutter_to_do/models/todo_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Todos with ChangeNotifier {
  static const _dbName = 'todosDatabase.db';
  static const _tableName = "todos";
  late final Database db;
  List<TodoItem> _todos = [];
  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE "
      "$_tableName("
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

  void initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _dbName);
    db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Todos() {
  //   initDatabase();
  // }
  void addTodoItem(TodoItem todoItem) {
    _todos.add(todoItem);
    // TODO : Implement record insertion to database
    notifyListeners();
  }

  void removeItemById(String id) {
    _todos.removeWhere((element) => element.id == id);
    // TODO : Implement record deletion from database
    notifyListeners();
  }

  void fetchAndUpdate() {
    // TODO : fetch and update todos from database
  }

  List<TodoItem> get todo {
    return [..._todos];
  }

  List<TodoItem> searchFor(String sub) {
    return sub.isEmpty
        ? []
        : _todos
            .where(
              (element) =>
                  element.title.toLowerCase().startsWith(sub.toLowerCase()),
            )
            .toList();
  }

  void updateItemById(String id, TodoItem todoItem) {
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
    notifyListeners();
  }

  TodoItem getItemById(String id) {
    return _todos.firstWhere((element) => element.id == id,
        orElse: () => defaultTodo);
  }
}
