import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:game/view/pages/levelspage/floatingActionNavigatorPop.dart';

class Settings extends StatefulWidget {
  //todo make stateless
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: FlatButton(
            child: Text("LogOut"),
            onPressed: () {
              signOutGoogle();
              Navigator.of(context).popUntil(ModalRoute.withName("/"));
              //todo change theme, add about dialog
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionNavigatorPop(),
    );
  }
}
