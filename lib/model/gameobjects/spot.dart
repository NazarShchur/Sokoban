import 'package:flutter/cupertino.dart';
import 'package:game/view/data/gameTheme.dart';
import 'package:game/view/state/UserModel.dart';

class Spot extends StatelessWidget {
  final double tileSize;
  final GameTheme theme = UserModel.theme;
  Spot(this.tileSize);

  @override
  Widget build(BuildContext context) {
    return Container(width: tileSize, height: tileSize, child: Image(image: AssetImage(theme.markImgUrl),));
  }
}
