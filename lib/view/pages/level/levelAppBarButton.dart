import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/data/Constants.dart';

class LevelAppBarButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final Color iconColor;

  LevelAppBarButton(
      {@required this.icon, @required this.onTap, @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Constants.buttonBorderColor, width: 5),
          color: Constants.buttonBackColor),
      child: IconButton(
        color: iconColor,
        icon: Icon(icon),
        onPressed: () {
          onTap(context);
        },
      ),
    );
  }
}
