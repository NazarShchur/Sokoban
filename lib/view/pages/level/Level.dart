import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/RecordsService.dart';
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
    data = data == null ? LevelData(size, widget.levelNum) : data;
    final boxSize = size / data.map[0].length;
    return Scaffold(
      body: SwipeDetector(
        swipeConfiguration: SwipeConfiguration(
            verticalSwipeMinVelocity: 1000.0,
            verticalSwipeMinDisplacement: 1.0,
            horizontalSwipeMinDisplacement: 1.0,
            horizontalSwipeMinVelocity: 1000.0
        ),
        onSwipeDown: () {
          _move(Direction.DOWN, model, context);
        },
        onSwipeUp: () {
          _move(Direction.UP, model, context);
        },
        onSwipeLeft: () {
          _move(Direction.LEFT, model, context);
        },
        onSwipeRight: () {
          _move(Direction.RIGHT, model, context);
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
                  return data.mapOfObjects[Coordinate(j, i)] != null ? data
                      .mapOfObjects[Coordinate(j, i)]
                      : data.spots.contains(Coordinate(j, i)) ? Spot(boxSize)
                      : Container(width: boxSize, height: boxSize);
                }),
              );
            }),
          ),
        ),
      ),
      appBar: LevelAppBar(data.results, _moveBack, _restartLevel),
    );
  }

  void _moveBack(model) {
    setState(() {
      if(data.moveBack()){
        UserService().addUserMoney(-Constants.COST_OF_TURN_BACK);
        model.addBalance(-Constants.COST_OF_TURN_BACK);
      }
    });
  }

  void _endLevel(model, context) {
    UserService userService = UserService();
    userService.incrementUserLastLevelAfter(widget.levelNum);
    RecordsService recordsService = RecordsService();
    recordsService.saveRecordIfBestForThisPlayer(data.results, userService.getCurrentUserId());
    _addUserMoneyIfFirstTimeWonLevel();
    model.showResults(context, data.results);
  }

  void _move(Direction direction, model, context) {
    setState(() {
      if (data.movePlayer(direction)) {
        _endLevel(model, context);
      }
    });
  }

  void _addUserMoneyIfFirstTimeWonLevel() async {
    UserService userService = UserService();
    if ((await userService.getCurrentUser()).lastLevel == widget.levelNum) {
      userService.addUserMoney(100);
    }
  }

  void _restartLevel(){
    setState(() {
      data = null;
    });
  }
}
