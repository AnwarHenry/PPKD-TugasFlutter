// // import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'package:ppkdb3/tugas11/model/user.dart';
// import 'package:sqflite/sqflite.dart';

// class DbHelper {
//   static Future<Database> databaseHelper() async {
//     final dbPath = await getDatabasesPath();
//     return openDatabase(
//       join(dbPath, 'login.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, password TEXT, name TEXT)',
//         );
//       },
//       version: 1,
//     );
//   }

//   static Future<void> registerUser(User user) async {
//     final db = await databaseHelper();
//     await db.insert(
//       'users',
//       user.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   static Future<User?> loginUser(String email, String password) async {
//     final db = await databaseHelper();
//     final List<Map<String, dynamic>> results = await db.query(
//       'users',
//       where: 'email = ? AND password = ?',
//       whereArgs: [email, password],
//     );

//     if (results.isNotEmpty) {
//       return User.fromMap(results.first);
//     }
//     return null;
//   }

//   static Future<List<User>> getAllUsers() async {
//     final db = await databaseHelper();
//     final List<Map<String, dynamic>> results = await db.query('users');
//     return results.map((e) => User.fromMap(e)).toList();
//   }
// }

// lib/tugas11/sqflite/db_helper.dart
// lib/tugas11/sqflite/db_helper.dart
// lib/tugas11/sqflite/db_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class DBHelper {
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'peserta_event.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE peserta (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        nama_event TEXT NOT NULL,
        asal_kota TEXT NOT NULL
      )
    ''');
  }

  // CREATE
  Future<int> insertUser(User user) async {
    Database db = await instance.database;
    return await db.insert('peserta', user.toMap());
  }

  // READ - urut berdasarkan abjad nama
  Future<List<User>> getAllUsers() async {
    Database db = await instance.database;
    var users = await db.query('peserta', orderBy: 'name ASC');
    return users.isNotEmpty ? users.map((c) => User.fromMap(c)).toList() : [];
  }

  // UPDATE
  Future<int> updateUser(User user) async {
    Database db = await instance.database;
    return await db.update(
      'peserta',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // DELETE
  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete('peserta', where: 'id = ?', whereArgs: [id]);
  }
}
