import 'package:flutter/cupertino.dart';

class LogoText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Sokoban", style: TextStyle(fontSize: 40, color: Color(0xFFB4B8B7), fontWeight: FontWeight.bold),),
        Text("the game", style: TextStyle(fontSize: 20, color: Color(0xFFB4B8B7) ),),
      ],
    );
  }

}