import 'package:flutter/cupertino.dart';
import 'package:game/view/data/gameTheme.dart';
import 'package:game/view/state/UserModel.dart';

class Spot extends StatelessWidget {
  final double tileSize;
  final GameTheme theme = UserModel.theme;
  Spot(this.tileSize);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          width: tileSize,
          height: tileSize,
          image: AssetImage(theme.floor),
        ),
        Image(
          width: tileSize,
          height: tileSize,
          image: AssetImage(theme.markImgUrl),
        ),

      ],
    );
  }
}
