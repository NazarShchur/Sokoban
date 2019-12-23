import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainMenuButton.dart';

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
