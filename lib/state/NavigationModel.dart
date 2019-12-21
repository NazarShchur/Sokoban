import 'package:flutter/cupertino.dart';
import 'package:game/state/pagesEnum.dart';

class NavigationModel extends ChangeNotifier{
  Pages currentPage = Pages.MENU;

  void setCurrentPage(Pages toGo){
    currentPage = toGo;
    notifyListeners();
  }
  int currentLevel = 1;
  void startLevel(int levelNum){
    currentPage = Pages.LEVEL;
    currentLevel = 1;
    notifyListeners();
  }


}