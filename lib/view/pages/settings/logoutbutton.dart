import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:game/view/data/Constants.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Constants.buttonBorderColor, width: 10),
          color: Constants.buttonBackColor
      ),
      child: FlatButton.icon(
          onPressed: () {
            signOutGoogle();
            Navigator.of(context).popUntil(ModalRoute.withName("/"));//todo refactor
            Navigator.pushNamed(context, "/");
          },
          icon: Icon(Icons.exit_to_app, size: 30,),
          label: Text("  Sign out", style: TextStyle(
            fontSize: 30,
          ),)
      ),
    );
  }

}