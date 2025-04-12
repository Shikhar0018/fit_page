import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'locations.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE locations(id INTEGER PRIMARY KEY AUTOINCREMENT, latitude REAL, longitude REAL, timestamp DATETIME DEFAULT CURRENT_TIMESTAMP)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertLocation(double lat, double lng) async {
    final db = await database;
    await db.insert(
      'locations',
      {'latitude': lat, 'longitude': lng},
    );
  }

  Future<List<Map<String, dynamic>>> getLocations() async {
    final db = await database;
    return db.query('locations', orderBy: 'timestamp DESC');
  }
}
