import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/data/Levels.dart';
import 'package:game/view/pages/levelspage/selectLevelButton.dart';


class LevelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 5,
        children: List.generate(LevelsProvider.countOfLevels, (i) {
          return SelectLevelButton(i + 1);
        }),
      ),
    );
  }
}
