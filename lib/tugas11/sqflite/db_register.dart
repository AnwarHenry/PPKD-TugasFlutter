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
        nama TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  /// REGISTER
  Future<void> registerUser(String nama, String email, String password) async {
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

    await db.insert('users', {
      'nama': nama,
      'email': email,
      'password': password,
    });
  }

  /// LOGIN
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
