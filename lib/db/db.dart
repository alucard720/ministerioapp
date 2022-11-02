import 'package:path/path.dart';
import 'package:sql_netcore/db/usuario_entity.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'usuarios.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, identificacion TEXT, correo TEXT, password TEXT)");
    }, version: 1);
  }

  static Future<Future<int>> insert(Usuario usuario) async {
    Database database = await _openDB();

    return database.insert("usuarios", usuario.toMap());
  }

  static Future<Future<int>> delete(Usuario usuario) async {
    Database database = await _openDB();

    return database
        .delete("usuarios", where: "id = ?", whereArgs: [usuario.id]);
  }

  static Future<Future<int>> update(Usuario usuario) async {
    Database database = await _openDB();

    return database
        .delete("usuarios", where: "id = ?", whereArgs: [usuario.id]);
  }

  static Future<List<Usuario>> usuarios() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> usuariosMap =
        await database.query("usuarios");
    return List.generate(
        usuariosMap.length,
        (i) => Usuario(
            id: usuariosMap[i]['id'],
            identificacion: usuariosMap[i]['indetificacion'],
            correo: usuariosMap[i]['correo'],
            password: usuariosMap[i]['password']));
  }

  static Future<void> insert2() async {
    Database database = await _openDB();

    var resultado = await database.rawInsert("INSERT INTO usuarios(id, identificacion, correo, password)" "VALUES(${Usuario.})");
  }
}
