import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier{
  int userBalance;
  bool isUserChanged = false;

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