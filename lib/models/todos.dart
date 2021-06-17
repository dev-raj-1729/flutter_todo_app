import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Todos {
  static const _dbName = 'todosDatabase.db';
  late final Database db;
  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE"
      " todos("
      "id TEXT PRIMARY KEY,"
      "title TEXT,"
      "description TEXT,"
      "label TEXT,"
      "checkbox INTEGER,"
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

  Todos() {
    initDatabase();
  }
}
