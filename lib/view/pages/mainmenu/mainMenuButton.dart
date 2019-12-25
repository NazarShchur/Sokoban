import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        border: Border.all(color: Color(0xFF989c9b), width: size/10)
      ),
      child: Material(
        color: Color(0xFFB4B8B7),
          child: IconButton(
            icon: Icon(icon, color: Colors.brown,),
            iconSize: size,
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            highlightColor: Color(0xFF989c9b),
            splashColor: Color(0xFF989c9b),//todo transfer to constants
          ),
      ),
    );
  }
}
