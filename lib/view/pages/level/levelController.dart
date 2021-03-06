import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/RecordsService.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/gameobjects/coordinate.dart';
import 'package:game/model/gameobjects/direction.dart';
import 'package:game/model/gameobjects/spot.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';
import 'levelAppBar.dart';
import 'leveldata.dart';

class LevelController extends StatefulWidget {
  final int levelNum;

  LevelController(this.levelNum);

  @override
  State<StatefulWidget> createState() {
    return LevelControllerState();
  }
}

class LevelControllerState extends State<LevelController> {
  LevelData data;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    final size = MediaQuery.of(context).size.width;
    data = data == null ? LevelData(size, widget.levelNum) : data;
    final boxSize = size / data.map[0].length;
    return Scaffold(
      appBar: LevelAppBar(data.results, _moveBack, _restartLevel),
      body: SwipeDetector(
        swipeConfiguration: SwipeConfiguration(
          verticalSwipeMinVelocity: 1,
          verticalSwipeMinDisplacement: 1,
          verticalSwipeMaxWidthThreshold: 100,
          horizontalSwipeMinDisplacement: 1,
          horizontalSwipeMinVelocity: 1,
          horizontalSwipeMaxHeightThreshold: 100,
        ),
        onSwipeDown: () {
          _move(Direction.DOWN, context);
        },
        onSwipeUp: () {
          _move(Direction.UP, context);
        },
        onSwipeLeft: () {
          _move(Direction.LEFT, context);
        },
        onSwipeRight: () {
          _move(Direction.RIGHT, context);
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(UserModel.theme.backgroundImgUrl),
                  repeat: ImageRepeat.repeat)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(data.map.length, (i) {
                return Row(
                  children: List.generate(data.map[0].length, (j) {
                    return data.mapOfObjects[Coordinate(j, i)] != null
                        ? data.mapOfObjects[Coordinate(j, i)]
                        : data.spots.contains(Coordinate(j, i))
                            ? Spot(boxSize)
                            : Container(
                                width: boxSize,
                                height: boxSize,
                                child: Image.asset(UserModel.theme.floor),
                              );
                  }),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  void _moveBack(model) {
    setState(() {
      if (data.moveBack()) {
        UserService().addUserMoney(-Constants.COST_OF_TURN_BACK);
        model.addBalance(-Constants.COST_OF_TURN_BACK);
      }
    });
  }

  void _endLevelSaveResultsAndGoToResultsPage(context) {
    UserService userService = UserService();
    userService.incrementUserLastLevelAfter(widget.levelNum);
    RecordsService recordsService = RecordsService();
    recordsService.saveRecordIfBestForThisPlayer(data.results, userService.getCurrentUserId());
    _addUserMoneyIfFirstTimeWonLevel(context);
    Navigator.pop(context);
    Navigator.pushNamed(context, "/results", arguments: data.results);
  }

  void _move(Direction direction, context) {
    setState(() {
      if (data.movePlayer(direction)) {
        _endLevelSaveResultsAndGoToResultsPage(context);
      }
    });
  }

  void _addUserMoneyIfFirstTimeWonLevel(context) async {
    UserService userService = UserService();
    if ((await userService.getCurrentUser()).lastLevel == widget.levelNum) {
      userService.addUserMoney(Constants.ADD_MONEY_FOR_LEVEL);
      Provider.of<UserModel>(context).addBalance(Constants.ADD_MONEY_FOR_LEVEL);
    }
  }

  void _restartLevel(context) {
    setState(() {
      data = null;
    });
  }
}
