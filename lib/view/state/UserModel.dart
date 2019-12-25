import 'package:flutter/cupertino.dart';
import 'package:game/model/entity/User.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/data/Themes.dart';
import 'package:game/view/data/gameTheme.dart';

class UserModel extends ChangeNotifier{
  int userBalance;
  bool isUserChanged = false;
  int selectedTheme = 0;
  List<int> themes;
  static GameTheme theme = GameThemes.themes[0];

  void addBalance(int toAdd){
    userBalance += toAdd;
    notifyListeners();
  }

  void setTheme(int themeId){
    selectedTheme = themeId;
    theme = GameThemes.themes[themeId];
    notifyListeners();
  }
  void initUserModel(User user){
    if(userBalance == null || isUserChanged){
      userBalance = user.balance;
      isUserChanged = false;
    }
    if(themes == null || isUserChanged){
      themes = [...user.themes];
      isUserChanged = false;
    }
  }
  void changeUser(){
    isUserChanged = true;
  }
  void addTheme(int themeId){
    userBalance = userBalance - Constants.PRICE_OF_THEME;
    themes.add(themeId);
    notifyListeners();
  }
}