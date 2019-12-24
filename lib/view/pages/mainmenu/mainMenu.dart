import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/dao/FirebaseDao.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'mainMenuButton.dart';

class MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MainMenuButton("play", "/levels"),
            MainMenuButton("settings", ""),
            MainMenuButton("records", ""),
            MainMenuButton("shop", "/shop"),
            FlatButton(child: Text("tap"),
              onPressed: () {
              FirebaseUserDao().findById(googleSignIn.currentUser.id).then((u){
                print(u);
              });
              },

            )
          ],
        ),
      ),
    );
  }
}

