import 'dart:async';
import 'package:dhammapath/data/model/bookmark_item.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, 'dhammapath.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE bookmarks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fileName TEXT NOT NULL UNIQUE,
        title TEXT NOT NULL
      )
    ''');
  }

  Future<void> addBookmark(BookmarkItem item) async {
    final db = await database;
    await db.insert(
      'bookmarks',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeBookmark(String fileName) async {
    final db = await database;
    await db.delete(
      'bookmarks',
      where: 'fileName = ?',
      whereArgs: [fileName],
    );
  }

  Future<List<BookmarkItem>> getBookmarks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('bookmarks');
    return maps.map((map) => BookmarkItem.fromMap(map)).toList();
  }

  Future<bool> isBookmarked(String fileName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'bookmarks',
      where: 'fileName = ?',
      whereArgs: [fileName],
    );
    return maps.isNotEmpty;
  }
}
