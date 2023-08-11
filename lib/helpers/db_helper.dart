import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';

class DbHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(
      join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
    );

    return db;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await database();
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await database();
    return db.query(table);
  }
}
