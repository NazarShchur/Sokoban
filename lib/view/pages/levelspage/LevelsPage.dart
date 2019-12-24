import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/User.dart';
import 'package:game/view/data/Levels.dart';
import 'package:game/view/pages/levelspage/selectLevelButton.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';

class LevelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, "/menu");
        return true;
      },
      child: Scaffold(
          body: FutureBuilder<User>(
        future: UserService().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
           initUserModelBalance(context, snapshot.data.balance);
            return GridView.count(
              crossAxisCount: 5,
              children: List.generate(LevelsProvider.countOfLevels, (levelNum) {
                return SelectLevelButton(levelNum + 1,
                    _isLevelAvailable(levelNum + 1, snapshot.data.lastLevel));
              }),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }

  bool _isLevelAvailable(int levelNum, int userLastLevel) {
    return userLastLevel >= levelNum;
  }

  void initUserModelBalance(context, balance){
    Provider.of<UserModel>(context).userBalance = Provider.of<UserModel>(context).userBalance??balance;
  }
}
