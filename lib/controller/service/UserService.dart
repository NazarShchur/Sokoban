import 'package:game/controller/dao/FirebaseDao.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:game/model/entity/User.dart';

class UserService{
  Future<User> getCurrentUser(){
    return FirebaseUserDao().findById(googleSignIn.currentUser.id);
  }

  Future<void> registerNewUser() async{
    if(await getCurrentUser() == null){
     FirebaseUserDao().create(googleSignIn.currentUser.id);
    }
  }

  Future<void> addUserMoney(int toAdd) async{
    User currentUser = await getCurrentUser();
    int toSet = currentUser.balance + toAdd;
    FirebaseUserDao().updateBalanceById(currentUser.id, toSet);
  }

  Future<void> incrementUserLastLevelAfter(int afterLevel) async {
    User currentUser = await getCurrentUser();
    if(afterLevel == currentUser.lastLevel){
      FirebaseUserDao().updateLastLevelById(currentUser.id, currentUser.lastLevel + 1);
    }
  }

}