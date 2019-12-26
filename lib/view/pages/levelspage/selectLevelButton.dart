import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/data/Constants.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Constants.buttonBorderColor, width: 10),
                color: Constants.buttonBackColor,
              ),
              child: Center(
                child: Text(
                  "$levelNum",
                  style: TextStyle(
                      color: Constants.buttonTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 26
                  ),
                ),
              ),
            ),
            isLevelAvailable
                ? Container()
                : Container(
              color: Color.fromRGBO(156, 156, 156, 0.8),
              child: Center(child: Icon(Icons.lock, color: Color.fromRGBO(255, 255, 255, 0.7), size: 30,),),
            ),
          ],
        )
      ),
    );
  }

}