import 'dart:io' as io;

import 'package:game/controller/dao/Fields.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class DatabaseProvider{
  static Database _db;

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await initDB();
    return _db;
  }
  initDB()async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, Fields.DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
  Future<void>_onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE ${Fields.USER_TABLE} (${Fields.USER_ID} INTEGER PRIMARY KEY)");
  }
}