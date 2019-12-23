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
    // TODO: implement getAll
    return null;
  }

  @override
  Future<void> save(User entity) async{

    return null;
  }

  @override
  Future<void> update(User entity) async{
    // TODO: implement update
    return null;
  }

}