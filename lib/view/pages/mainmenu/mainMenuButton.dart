import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/data/Constants.dart';

class MainMenuButton extends StatelessWidget {
  final IconData icon;
  final String route;
  final double size;

  MainMenuButton(
      {@required this.icon, @required this.route, @required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Constants.buttonBorderColor, width: size/10)
      ),
      child: Material(
        color: Constants.buttonBackColor,
          child: IconButton(
            icon: Icon(icon, color: Constants.buttonTextColor,),
            iconSize: size,
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            highlightColor: Constants.buttonBackColor,
            splashColor: Constants.buttonBackColor,
          ),
      ),
    );
  }
}
