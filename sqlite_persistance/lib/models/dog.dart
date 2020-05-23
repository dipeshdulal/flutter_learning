import 'package:sqflite/sqflite.dart';

import '../database.dart';

class Dog {
  int id;
  String name;
  int age;

  Dog({this.id, this.name, this.age});

  Future<void> delete() async {
    final db = await DogDatabase.getDatabase();
    await db.delete('dogs', where: 'id = ?', whereArgs: [this.id]);
  }

  Future<void> insert() async {
    final Database db = await DogDatabase.getDatabase();
    this.id = await this._getNextId();
    await db.insert("dogs", this.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> save() async {
    final db = await DogDatabase.getDatabase();
    await db
        .update('dogs', this.toMap(), where: 'id = ?', whereArgs: [this.id]);
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "age": age};
  }

  static Future<List<Dog>> getAll() async {
    final db = await DogDatabase.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(
        maps.length,
        (i) =>
            Dog(id: maps[i]['id'], name: maps[i]['name'], age: maps[i]['age']));
  }

  @override
  String toString() {
    return "Dog: {name: ${this.name}, age: ${this.age}, id: ${this.id}}";
  }

  Future<int> _getNextId() async{
    final db = await DogDatabase.getDatabase();
    List<Map<String, dynamic>> data = await db.rawQuery("SELECT COALESCE(MAX(id), 0) + 1 as next_id FROM dogs");
    var ind = data[0];
    return int.parse(ind['next_id'].toString());
  }
}
