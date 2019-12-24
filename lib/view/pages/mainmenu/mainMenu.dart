import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mainMenuButton.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainMenuButton("play", "/levels"),
              MainMenuButton("settings", "/settings"),
              MainMenuButton("records", ""),
              MainMenuButton("shop", "/shop"),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
    );
  }
}
