import 'package:flutter/cupertino.dart';
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
    notifyListeners();
  }

  void removeItemById(String id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  List<TodoItem> get todo {
    return [..._todos];
  }
}
