import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/data/Constants.dart';

class FloatingActionNavigatorPop extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Constants.buttonBackColor,
      child: Icon(Icons.arrow_back, color: Colors.brown,),
      onPressed: () {
        Navigator.pop(context);
      }
    );
  }

}