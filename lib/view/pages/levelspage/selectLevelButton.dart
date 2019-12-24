import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:provider/provider.dart';

class SelectLevelButton extends StatelessWidget{
  final int levelNum;
  final bool isLevelAvailable;
  SelectLevelButton(this.levelNum, this.isLevelAvailable);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    return GestureDetector(
      onTap: (){
        if(isLevelAvailable){
          model.setCurrentLevel(levelNum);
          Navigator.pushNamed(context, "/level");
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width/5, //todo transfer to constants
        height: MediaQuery.of(context).size.width/5,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: isLevelAvailable ? Colors.white : Colors.red,
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