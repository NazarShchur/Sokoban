import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/direction.dart';
import 'package:game/gameobjects/player.dart';
import 'package:swipedetector/swipedetector.dart';

class Level extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LevelState();
  }

}
class LevelState extends State<Level>{

  LevelData data = LevelData();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width/data.map[0].length;
    return SwipeDetector(
      onSwipeDown: (){
        setState(() {
          data.movePlayer(Direction.DOWN);
        });
      },
      onSwipeUp: (){
        setState(() {
          data.movePlayer(Direction.UP);
        });
      },
      onSwipeLeft: (){
        setState(() {
          data.movePlayer(Direction.LEFT);
        });
      },
      onSwipeRight: (){
        setState(() {
          data.movePlayer(Direction.RIGHT);
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(data.map.length, (i){
              return Row(
                children: List.generate(data.map[0].length, (j){
                  return
                    ),
                  );
                }),
              );
            }),
      ),
    );
  }
}