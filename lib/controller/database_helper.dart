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

  // torna esta classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // tem somente uma referência ao banco de dados
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  // abre o banco de dados e o cria se ele não existir
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    //columnLogged -> 1 (true) 0 (false)
    await db.execute('''
          CREATE TABLE $table (
            $columnLoggedId INTEGER PRIMARY KEY,
            $columnLanguage TEXT,
            $columnLogged INTEGER
          )
          ''');
  }

  // métodos Helper
  //----------------------------------------------------
  // Insere uma linha no banco de dados onde cada chave
  // no Map é um nome de coluna e o valor é o valor da coluna.
  // O valor de retorno é o id da linha inserida.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnLoggedId];
    var response = await query(id);
    if (response != null) {
      return await db.update(table, row);
    } else {
      return await db.insert(table, row);
    }
  }

  // Todas as linhas são retornadas como uma lista de mapas, onde cada mapa é
  // uma lista de valores-chave de colunas.
  Future<List<Map<String, dynamic>>> query(int id) async {
    Database db = await instance.database;
    return await db.query(table, where: '$columnLoggedId = ?', whereArgs: [id]);
  }

  // Todos os métodos : inserir, consultar, atualizar e excluir,
  // também podem ser feitos usando  comandos SQL brutos.
  // Esse método usa uma consulta bruta para fornecer a contagem de linhas.
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // Assumimos aqui que a coluna id no mapa está definida. Os outros
  // valores das colunas serão usados para atualizar a linha.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnLoggedId];
    return await db
        .update(table, row, where: '$columnLoggedId = ?', whereArgs: [id]);
  }

  // Exclui a linha especificada pelo id. O número de linhas afetadas é
  // retornada. Isso deve ser igual a 1, contanto que a linha exista.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db
        .delete(table, where: '$columnLoggedId = ?', whereArgs: [id]);
  }
}
