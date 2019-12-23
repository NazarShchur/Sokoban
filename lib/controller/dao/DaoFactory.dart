import 'package:game/controller/dao/interface/UserDao.dart';

import 'implementation/SQLiteDaoFactory.dart';

abstract class DaoFactory{
  static DaoFactory _daoFactory;

  UserDao createUserDao();
  static DaoFactory getInstance(){
    if(_daoFactory == null){
      _daoFactory = SQLiteDaoFactory();
    }
    return _daoFactory;
  }
}