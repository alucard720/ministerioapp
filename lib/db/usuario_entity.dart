import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Usuario {
  final int? id;
  final int? indentificacion;
  final String correo;
  final String password;

  Usuario(
      {this.id,
      this.indentificacion,
      required this.correo,
      required this.password});

  factory Usuario.fromMap(Map<String, dynamic> json) => new Usuario(
      id: json['id'],
      indentificacion: json['identifiacion'],
      correo: json['correo'],
      password: json['password']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'identificacion': indentificacion,
      'correo': correo,
      'password': password,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, 'usuario.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
}
