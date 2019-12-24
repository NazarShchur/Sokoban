import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/User.dart';
import 'package:game/view/data/Levels.dart';
import 'package:game/view/pages/levelspage/selectLevelButton.dart';


class LevelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User>(
        future: UserService().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return GridView.count(
              crossAxisCount: 5,
              children: List.generate(LevelsProvider.countOfLevels, (levelNum) {
                return SelectLevelButton(levelNum + 1, isLevelAvailable(levelNum + 1, snapshot.data.lastLevel));
              }),
            );
          } else{
            return CircularProgressIndicator();
          }
        },
      )
    );
  }

  bool isLevelAvailable(int levelNum, int userLastLevel){
    return userLastLevel >= levelNum;
  }
}
