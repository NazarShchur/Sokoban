import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/pages/mainmenu/mainMenuButton.dart';

class BottomMenuBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MainMenuButton(route: "/shop", size: 50, icon: Icons.shopping_cart,),
          MainMenuButton(route: "/settings", size: 50, icon: Icons.settings,)
        ],
      ),
    );
  }

}