import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/pages/mainmenu/mainMenuButton.dart';
import 'package:game/state/pagesEnum.dart';

class MainMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MainMenuButton("play", "/levels"),
            MainMenuButton("settings", ""),
            MainMenuButton("records", "")
          ],
        ),
      ),
    );
  }

}
