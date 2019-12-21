import 'package:flutter/cupertino.dart';
import 'package:game/pages/mainmenu/mainMenuButton.dart';
import 'package:game/state/pagesEnum.dart';

class MainMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MainMenuButton("play", Pages.LEVELS),
        MainMenuButton("settings", Pages.SETTINGS),
        MainMenuButton("records", Pages.RECORDS)
      ],
    );
  }

}
