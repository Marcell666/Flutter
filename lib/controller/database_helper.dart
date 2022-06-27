import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "settingsDB.db";
  static const _databaseVersion = 1;
  static const table = 'settings';
  static const columnLoggedId = 'logged_id';
  static const columnLanguage = 'language';
  static const columnLogged = 'logged_status';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    //columnLogged -> 1 (true) 0 (false)
    await db.execute('''
          CREATE TABLE $table (
            $columnLoggedId INTEGER,
            $columnLanguage TEXT,
            $columnLogged INTEGER
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnLoggedId];
    var response = await query(id);
    if (!response.isEmpty) {
      return await db.update(table, row);
    } else {
      return await db.insert(table, row);
    }
  }

  Future<List<Map<String, dynamic>>> query(int id) async {
    Database db = await instance.database;
    return await db.query(table, where: '$columnLoggedId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryLogged() async {
    Database db = await instance.database;
    return await db.query(table,
        where: '$columnLogged = ?', whereArgs: [1], limit: 1);
  }

  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnLoggedId];
    return await db
        .update(table, row, where: '$columnLoggedId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db
        .delete(table, where: '$columnLoggedId = ?', whereArgs: [id]);
  }
}
