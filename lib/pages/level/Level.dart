import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/direction.dart';
import 'package:game/gameobjects/leveldata.dart';
import 'package:game/gameobjects/player.dart';
import 'package:game/gameobjects/spot.dart';
import 'package:game/state/NavigationModel.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';

class Level extends StatefulWidget {
  final int levelNum;
  Level(this.levelNum);
  @override
  State<StatefulWidget> createState() {
    return LevelState();
  }
}

class LevelState extends State<Level> {
  LevelData data;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    final size = MediaQuery.of(context).size.width;
    data = data == null ? LevelData(size, widget.levelNum) : data.isLevelPassed() ? LevelData(size, widget.levelNum) : data;
    final boxSize = size/data.map[0].length;
    return SwipeDetector(
      swipeConfiguration: SwipeConfiguration(
          verticalSwipeMinVelocity: 1000.0,
          verticalSwipeMinDisplacement: 1.0,
          horizontalSwipeMinDisplacement:1.0,
          horizontalSwipeMinVelocity: 1000.0
      ),
      onSwipeDown: () {
        setState(() {
          if(data.movePlayer(Direction.DOWN)){
            model.nextLevel();
          }
        });
      },
      onSwipeUp: () {
        setState(() {
          if(data.movePlayer(Direction.UP)){
            model.nextLevel();
          }
        });
      },
      onSwipeLeft: () {
        setState(() {
          if(data.movePlayer(Direction.LEFT)){
            model.nextLevel();
          }
        });
      },
      onSwipeRight: () {
        setState(() {
          if(data.movePlayer(Direction.RIGHT)){
            model.nextLevel();
          }
        });
      },

      child: Container(
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(data.map.length, (i) {
            return Row(
              children: List.generate(data.map[0].length, (j) {
                return data.playerCoordinate == Coordinate(j,i) ? PlayerObj(boxSize)
                : data.mapOfObjects[Coordinate(j, i)] != null ? data.mapOfObjects[Coordinate(j, i)]
                : data.spots.contains(Coordinate(j, i)) ? Spot(boxSize)
                : Container(width: boxSize, height: boxSize);
              }),
            );
          }),
        ),
      ),
    );
  }
}
