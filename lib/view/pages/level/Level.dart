import 'package:flutter/cupertino.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:provider/provider.dart';

import 'levelController.dart';

class Level extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LevelState();
  }

}

class LevelState extends State<Level>{
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);//todo refactor
    LevelController level = LevelController(model.currentLevel);
    return level;
  }

}