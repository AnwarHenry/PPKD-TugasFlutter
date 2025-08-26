// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DBRegister {
//   DBRegister._privateConstructor();
//   static final DBRegister instance = DBRegister._privateConstructor();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }

//   Future<Database> _initDB() async {
//     String path = join(await getDatabasesPath(), 'db_register.db');
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         email TEXT UNIQUE,
//         password TEXT
//       )
//     ''');
//   }

//   Future<void> registerUser(String email, String password) async {
//     final db = await database;

//     // Cek apakah email sudah ada
//     var res = await db.query('users', where: 'email = ?', whereArgs: [email]);
//     if (res.isNotEmpty) {
//       throw Exception("Email sudah terdaftar");
//     }

//     await db.insert('users', {'email': email, 'password': password});
//   }

//   Future<bool> loginUser(String email, String password) async {
//     final db = await database;

//     var res = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );

//     return res.isNotEmpty;
//   }
// }

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBRegister {
  static final DBRegister instance = DBRegister._init();
  static Database? _database;

  DBRegister._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('register.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<void> registerUser(String email, String password) async {
    final db = await instance.database;

    // Cek apakah email sudah ada
    final existing = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (existing.isNotEmpty) {
      throw Exception('Email sudah terdaftar');
    }

    await db.insert('users', {'email': email, 'password': password});
  }

  Future<bool> loginUser(String email, String password) async {
    final db = await instance.database;
    final res = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return res.isNotEmpty;
  }
}
