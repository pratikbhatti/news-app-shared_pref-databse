import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  Database? database;

  /// check databse
  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await createDB();
    }
  }

  /// create database
  Future<Database> createDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'news.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String news =
            "CREATE TABLE news (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,publish TEXT,content TEXT,image TEXT,author TEXT)";
        db.execute(news);
      },
    );
  }
  /// insert data
  void insertData({
    required String title,
    required String description,
    required String publish,
    required String content,
    required String image,
    required String author


  }) async {
    database = await checkDB();
    database!.insert("news", {
      "title": title,
      "description": description,
      "publish": publish,
      "content": content,
      "image": image,
      "author":author

    });
  }
  ///  read data
  Future<List<Map>> readData() async {
    database = await checkDB();
    String query = "SELECT * FROM news";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  /// delete data
  Future<void> deleteData({required int id}) async {
    database = await checkDB();
    database!.delete("news", where: "id =? ", whereArgs: [id]);
  }
}
