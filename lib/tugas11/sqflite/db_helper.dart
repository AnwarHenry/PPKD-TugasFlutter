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

import 'package:path/path.dart';
import 'package:ppkdb3/tugas11/model/user.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('event.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
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

  Future<int> insertUser(User user) async {
    final db = await instance.database;
    return await db.insert('peserta', user.toMap());
  }

  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query('peserta');
    return result.map((map) => User.fromMap(map)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
