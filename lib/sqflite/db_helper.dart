import 'package:fittness/models/train.dart';
import 'package:fittness/models/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> databaseHelper() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'login.db'),
      onCreate: (db, version) async {
        // Tabel users
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)',
        );

        // Tabel train
        await db.execute(
          'CREATE TABLE trains(id INTEGER PRIMARY KEY AUTOINCREMENT, schedule TEXT, categories TEXT, stage TEXT)',
        );
      },
      version: 1,
    );
  }

  //----------Users----------
  static Future<void> registerUser(User user) async {
    final db = await databaseHelper();
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<User?> loginUser(String username, String password) async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (results.isNotEmpty) {
      return User.fromMap(results.first);
    }
    return null;
  }

  static Future<List<User>> getAllUsers() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('users');
    return results.map((e) => User.fromMap(e)).toList();
  }

  static Future<void> updateUser(User user) async {
    final db = await databaseHelper();
    await db.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteUser(int id) async {
    final db = await databaseHelper();
    await db.delete('users', where: "id = ?", whereArgs: [id]);
  }

  //----------Train----------
  static Future<void> registerTrain(Train train) async {
    final db = await databaseHelper();
    await db.insert(
      'trains',
      train.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Train>> getAllTrain() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('trains');
    return results.map((e) => Train.fromMap(e)).toList();
  }

  static Future<void> updateTrain(Train train) async {
    final db = await databaseHelper();
    await db.update(
      'trains',
      train.toMap(),
      where: "id = ?",
      whereArgs: [train.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteTrain(int id) async {
    final db = await databaseHelper();
    await db.delete('trains', where: "id = ?", whereArgs: [id]);
  }
}
