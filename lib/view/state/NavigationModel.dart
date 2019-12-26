import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/data/Levels.dart';
import 'package:game/view/pages/level/ResultsPage.dart';
import 'package:game/model/entity/results.dart';
import 'package:game/view/state/pagesEnum.dart';

class NavigationModel extends ChangeNotifier {

  int _currentLevel = 1;

  void setCurrentLevel(int i){
    _currentLevel = i;
  }
  void startLevel(int levelNum) {
    _currentLevel = levelNum;
    notifyListeners();
  }

  bool nextLevel() {
    if(currentLevel < LevelsProvider.countOfLevels){
      _currentLevel++;
      return true;
    }
    return false;

  }

  get currentLevel => _currentLevel;
}
