import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/dao/FirebaseDao.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:game/view/pages/mainmenu/mainMenu.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child:  FlatButton(
          onPressed: () {
            signInWithGoogle().whenComplete(() {
              FirebaseUserDao().create(googleSignIn.currentUser.id);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MainMenu();
                  },
                ),
              );
            });
          },
          child: Text("SIGN IN"),
        ),
      ),
    );
  }

}