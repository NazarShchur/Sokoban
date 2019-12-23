import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/pages/level/ResultsAlert.dart';
import 'package:game/view/pages/level/results.dart';
import 'package:game/view/state/pagesEnum.dart';

class NavigationModel extends ChangeNotifier {
  Pages currentPage = Pages.MENU;

  void setCurrentPage(Pages toGo) {
    currentPage = toGo;
    notifyListeners();
  }

  int _currentLevel = 1;

  void setCurrentLevel(int i){
    _currentLevel = i;
  }
  void startLevel(int levelNum) {
    currentPage = Pages.LEVEL;
    _currentLevel = levelNum;
    notifyListeners();
  }

  void nextLevel() {
    _currentLevel++;
  }

  get currentLevel => _currentLevel;

  void showResults(BuildContext context, Results results) {
    showDialog(
        context: context,
        builder: (context) {
          return ResultsAlert(results);
        });
  }
}
