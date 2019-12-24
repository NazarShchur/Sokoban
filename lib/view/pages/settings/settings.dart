import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget{//todo make stateless
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }

}
class _SettingsState extends State<Settings>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: FlatButton(
            child: Text("LogOut"),
          ),
        ),
      ),
    )
  }

}