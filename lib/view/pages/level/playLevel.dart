import 'package:flutter/cupertino.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:provider/provider.dart';

import 'Level.dart';

class PlayLevel extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PlayLevelState();
  }

}

class PlayLevelState extends State<PlayLevel>{
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    Level level = Level(model.currentLevel);
    return level;
  }

}