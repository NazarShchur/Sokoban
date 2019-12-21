import 'package:flutter/cupertino.dart';
import 'package:game/pages/level/Level.dart';
import 'package:game/state/pagesEnum.dart';

class NavigationModel extends ChangeNotifier{
  Pages currentPage = Pages.MENU;

  void setCurrentPage(Pages toGo){
    currentPage = toGo;
    notifyListeners();
  }

  int _currentLevel = 1;
  void startLevel(int levelNum){
    currentPage = Pages.LEVEL;
    _currentLevel = levelNum;
    notifyListeners();
  }

  void nextLevel(){
    _currentLevel++;
    notifyListeners();
  }

  get currentLevel => _currentLevel;


}