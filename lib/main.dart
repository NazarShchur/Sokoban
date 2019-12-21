import 'package:flutter/material.dart';
import 'package:game/pages/level/Level.dart';
import 'package:game/pages/level/playLevel.dart';
import 'package:game/pages/levelspage/LevelsPage.dart';
import 'package:game/pages/mainmenu/mainMenu.dart';
import 'package:game/state/NavigationModel.dart';
import 'package:game/state/pagesEnum.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider<NavigationModel>(
      builder: (context)=>NavigationModel(),
      child:Sokoban()
  )
  );
}

class Sokoban extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SokobanState();
  }
}

class SokobanState extends State<Sokoban>{
  Map<Pages, Widget> pages = {
    Pages.MENU : MainMenu(),
    Pages.RECORDS : Container(),
    Pages.SETTINGS : Container(),
    Pages.LEVELS : LevelsPage(),
    Pages.LEVEL : PlayLevel(),
  };
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
   return MaterialApp(
     home: Scaffold(
       body: pages[model.currentPage],
     )
   );
  }

}
