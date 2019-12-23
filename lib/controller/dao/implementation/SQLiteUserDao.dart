import 'package:game/controller/dao/Fields.dart';
import 'package:game/controller/dao/interface/UserDao.dart';
import 'package:game/model/entity/User.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteUserDao implements UserDao{
  Future<Database> _db;

  SQLiteUserDao(this._db);
  @override
  Future<void> delete(User entity) async {
    // TODO: implement delete
    return null;
  }

  @override
  Future<List<User>> getAll()async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db.query(Fields.USER_TABLE);
    return maps.map((j)=>User.fromJson(j)).toList();
  }

  @override
  Future<void> save(User entity) async{
    final db = await _db;
    db.insert(Fields.USER_TABLE, entity.toJson());
    return null;
  }

  @override
  Future<void> update(User entity) async{
    // TODO: implement update
    return null;
  }

}