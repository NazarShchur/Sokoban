import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/state/NavigationModel.dart';
import 'package:game/state/pagesEnum.dart';
import 'package:provider/provider.dart';

class MainMenuButton extends StatelessWidget{
  final String text;
  final String route;
  MainMenuButton(this.text, this.route);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(text),
        ),
      ),
    );
  }

}