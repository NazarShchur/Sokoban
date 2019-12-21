import 'package:flutter/cupertino.dart';
import 'package:game/data/Levels.dart';
import 'package:game/pages/levelspage/selectLevelButton.dart';
import 'package:game/state/NavigationModel.dart';
import 'package:game/state/pagesEnum.dart';
import 'package:provider/provider.dart';

class LevelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      children: List.generate(LevelsProvider.countOfLevels, (i) {
        return SelectLevelButton(i + 1);
      }),
    );
  }
}
