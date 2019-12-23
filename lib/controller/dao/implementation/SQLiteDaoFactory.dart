
import 'package:game/controller/dao/interface/UserDao.dart';
import 'package:sqflite/sqlite_api.dart';

import '../DaoFactory.dart';
import 'DatabaseProvider.dart';
import 'SQLiteUserDao.dart';

class SQLiteDaoFactory extends DaoFactory {
  DatabaseProvider _provider = DatabaseProvider();

  @override
  UserDao createUserDao() {
    return SQLiteUserDao(getDatabase());
  }

  Future<Database> getDatabase() {
    try {
      return _provider.db;
    } catch (e) {
      print(e);
    }
  }

}
