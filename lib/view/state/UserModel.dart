import 'package:flutter/cupertino.dart';
import 'package:game/view/data/Themes.dart';
import 'package:game/view/data/gameTheme.dart';

class UserModel extends ChangeNotifier{
  int userBalance;
  bool isUserChanged = false;
  static GameTheme theme = GameThemes.standartTheme;

  void addBalance(int toAdd){
    userBalance += toAdd;
    notifyListeners();
  }

  void initBalance(balance){
    if(userBalance == null || isUserChanged){
      userBalance = balance;
      isUserChanged = false;
    }
  }
  void changeUser(){
    isUserChanged = true;
  }
}