import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/dao/FirebaseDao.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/controller/service/sign_in.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child:  FlatButton(
          onPressed: () {
            signInWithGoogle().whenComplete(() {//todo handle error
              UserService().registerNewUser();
              Navigator.of(context).popAndPushNamed("/menu");
            });
          },
          child: Text("SIGN IN"),
        ),
      ),
    );
  }

}