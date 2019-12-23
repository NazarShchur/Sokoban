import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:provider/provider.dart';

class SelectLevelButton extends StatelessWidget{
  final int levelNum;
  SelectLevelButton(this.levelNum);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    return GestureDetector(
      onTap: (){
        model.setCurrentLevel(levelNum);
        Navigator.pushNamed(context, "/level");
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            "$levelNum"
          ),
        ),
      ),
    );
  }

}