import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/pages/level/results.dart';
class LevelAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Results results;
  final Function function;
  LevelAppBar(this.results, this.function);
  @override
  Size get preferredSize => Size.fromHeight(57);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.black
        )
      ),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("moves : ${results.moves}"),
          Text("pushes : ${results.pushes}"),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.arrow_back
          ),
          onPressed: function
        )
      ],
    );
  }

}