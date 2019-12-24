import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/dao/FireBaseUserDao.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
          child:  FlatButton(
            onPressed: () {
              signInWithGoogle().whenComplete(() {//todo handle error
                UserService().auth();
                Navigator.of(context).popAndPushNamed("/menu");
                Provider.of<UserModel>(context).changeUser();
              });
            },
            child: Text("SIGN IN"),
          ),
      ),
    );
  }

}