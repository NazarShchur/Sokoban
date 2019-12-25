import 'package:game/controller/dao/FireBaseUserDao.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:game/model/entity/User.dart';
import 'package:game/view/data/Constants.dart';

class UserService{
  Future<User> getCurrentUser(){
    return FirebaseUserDao().findById(googleSignIn.currentUser.id);
  }
  BigInt getCurrentUserId(){
    return BigInt.parse(googleSignIn.currentUser.id);
  }

  Future<void> auth() async{
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

  Future<void> addTheme(int theme) async{
    FirebaseUserDao dao = FirebaseUserDao();
    User user = await getCurrentUser();
    if(!user.themes.contains(theme)){
      addUserMoney(-Constants.PRICE_OF_THEME);
      dao.createUserTheme(theme, user.id);
    }
  }
}