import 'package:flutter/material.dart';
import 'package:game/view/pages/level/Level.dart';
import 'package:game/view/pages/level/ResultsPage.dart';
import 'package:game/view/pages/levelspage/LevelsPage.dart';
import 'package:game/view/pages/mainmenu/mainMenu.dart';
import 'package:game/view/pages/settings/settings.dart';
import 'package:game/view/pages/shoppage/shopPage.dart';
import 'package:game/view/pages/welcomepage/WelcomePage.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:game/view/state/pagesEnum.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<UserModel>(
      create: (context) => UserModel(),
      child: ChangeNotifierProvider<NavigationModel>(
          create: (context) => NavigationModel(),
          child: Sokoban()
      ),
  ));
  }

class Sokoban extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SokobanState();
  }
}

class SokobanState extends State<Sokoban> {
  Map<Pages, Widget> pages = {
    Pages.MENU: MainMenu(),
    Pages.RECORDS: Container(),
    Pages.SETTINGS: Container(),
    Pages.LEVELS: LevelsPage(),
    Pages.LEVEL: Level(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      routes: {
        '/levels': (context) => LevelsPage(),
        "/level": (context) => Level(),
        "/menu": (context) => MainMenu(),
        "/shop": (context) => ShopPage(),
        "/settings": (context) => Settings(),
        "/results" : (context) => ResultsPage(),
      },
    );
  }

}
