import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/dao/FirebaseDao.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/gameobjects/coordinate.dart';
import 'package:game/model/gameobjects/direction.dart';
import 'package:game/model/gameobjects/spot.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';
import 'levelAppBar.dart';
import 'leveldata.dart';

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
    data = data == null ? LevelData(size, widget.levelNum)
        : data.isLevelPassed() ? LevelData(size, widget.levelNum)
        : data;
    final boxSize = size/data.map[0].length;
    return Scaffold(
      body: SwipeDetector(
        swipeConfiguration: SwipeConfiguration(
            verticalSwipeMinVelocity: 1000.0,
            verticalSwipeMinDisplacement: 1.0,
            horizontalSwipeMinDisplacement:1.0,
            horizontalSwipeMinVelocity: 1000.0
        ),
        onSwipeDown: () {
          move(Direction.DOWN, model);
        },
        onSwipeUp: () {
          move(Direction.UP, model);
        },
        onSwipeLeft: () {
          move(Direction.LEFT, model);
        },
        onSwipeRight: () {
          move(Direction.RIGHT, model);
        },

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Constants.CANDIES_BACKGROUND),
              repeat: ImageRepeat.repeat
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(data.map.length, (i) {
              return Row(
                children: List.generate(data.map[0].length, (j) {
                  return data.mapOfObjects[Coordinate(j, i)] != null ? data.mapOfObjects[Coordinate(j, i)]
                  : data.spots.contains(Coordinate(j, i)) ? Spot(boxSize)
                  : Container(width: boxSize, height: boxSize);
                }),
              );
            }),
          ),
        ),
      ),
      appBar: LevelAppBar(data.results, moveBack),
    );
  }
  void moveBack(){
    setState(() {
      data.moveBack();
    });
  }
  void endLevel(model){
    model.showResults(context, data.results);
    UserService().incrementUserLastLevelAfter(widget.levelNum);
  }
  void move(Direction direction, model){
    setState(() {
      if(data.movePlayer(direction)){
        endLevel(model);
      }
    });
  }
}
