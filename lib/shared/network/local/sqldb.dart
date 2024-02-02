import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqflite {
  static Database? _db;

  Future<Database?> get dB async {
    _db ??= await initialDB();
    return _db;
  }

  initialDB() async {
    String databasePath = await getDatabasesPath();
    String databaseName = "favarticle.db";
    String path = join(databasePath, databaseName);
    Database Dbarticle = await openDatabase(path,
        onCreate: _onCreate, version:3, onUpgrade: _onUpgrade);
    return Dbarticle;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print("onUpgrade =====================================");
  }

  final myTable = "article";
  final author = "author";
  final title = "title";
  final description = "description";
  final urlToImage = "urlToImage";
  final publishedAt = "publishedAt";
  final content = "content";
  final isColored = "isColored";

  // "$id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "$myTable"(
      "$author" TEXT,
      "$title" TEXT NOT NULL,
      "$description" TEXT,
      "$urlToImage" TEXT,
      "$publishedAt" TEXT,
      "$content" TEXT,
      "$isColored" INTEGER DEFAULT 0 NOT NULL
      )
    ''');
    print("Create=======================");
  }

  myInsert(String table, Map<String, Object?> values) async {
    Database? myDb = await dB;
    int response = await myDb!.insert(table, values);
    return response;
  }

  // Read
  myRead(String table) async {
    Database? myDb = await dB;
    List<Map> response = await myDb!.query(table);
    return response;
  }

  // Update
  myUpdate(String table, Map<String, Object?> values, String myWhere) async {
    Database? myDb = await dB;
    int response = await myDb!.update(table, values, where: myWhere);
    return response;
  }

  // Delete
  myDelete(String table, String myWhere) async {
    Database? myDb = await dB;
    int response = await myDb!.delete(table, where: myWhere);
    return response;

  }

}