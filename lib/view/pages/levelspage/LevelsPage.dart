import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/User.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/data/Levels.dart';
import 'package:game/view/pages/levelspage/floatingActionNavigatorPop.dart';
import 'package:game/view/pages/levelspage/selectLevelButton.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class LevelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, "/menu");
          return true;
        },
        child: Scaffold(
            floatingActionButton: FloatingActionNavigatorPop(),
            backgroundColor: Colors.brown,
            body: FutureBuilder<User>(
              future: UserService().getCurrentUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  initUserModelBalance(context, snapshot.data.balance);
                  return GridView.count(
                    crossAxisCount: 4,
                    children:
                        List.generate(LevelsProvider.countOfLevels, (levelNum) {
                      return SelectLevelButton(
                          levelNum + 1,
                          _isLevelAvailable(
                              levelNum + 1, snapshot.data.lastLevel));
                    }),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )));
  }

  bool _isLevelAvailable(int levelNum, int userLastLevel) {
    return userLastLevel >= levelNum;
  }

  void initUserModelBalance(context, balance) {
    Provider.of<UserModel>(context).userBalance =
        Provider.of<UserModel>(context).userBalance ?? balance;
  }
}
