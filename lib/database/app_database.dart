
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'naruto.db';
  final String tableName = 'favorite_characters';

  Database? _db;

  Future<Database> openDb() async {
    _db ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) {
        db.execute("create table $tableName (id text primary key, name text)");
      },
      version: version,
    );
    return _db as Database;
  }
}
