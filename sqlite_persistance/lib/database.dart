
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getMyDatabase() async {
  String databasePath = await getDatabasesPath();
  return openDatabase(
    join(databasePath, 'doggie_database.db'),
    onCreate: (db, version){
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)"
      );
    },
    version: 1
  );
}

class DogDatabase {
  static Database _database;
  static Future<Database> getDatabase() async {
    if(_database == null){
      _database = await getMyDatabase();
    }
    return _database;
  }
}