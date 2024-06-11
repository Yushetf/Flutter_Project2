// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final path = await getDatabasesPath();
    return await openDatabase(
      join(path, 'app_database.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE coordinates(
            id INTEGER PRIMARY KEY,
            latitude REAL,
            longitude REAL,
            timestamp INTEGER
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> insertCoordinate(double latitude, double longitude) async {
    final db = await database;
    await db.insert(
      'coordinates',
      {'latitude': latitude, 'longitude': longitude, 'timestamp': DateTime.now().millisecondsSinceEpoch},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getCoordinates() async {
    final db = await database;
    return await db.query('coordinates');
  }
}
