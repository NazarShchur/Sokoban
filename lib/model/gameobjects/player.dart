import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/data/gameTheme.dart';
import 'package:game/view/state/UserModel.dart';

import 'object.dart';

class PlayerObj extends GameObject {
  final double tileSize;
  final GameTheme theme = UserModel.theme;
  PlayerObj(this.tileSize);
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
            image: AssetImage(theme.playerImgUrl),
          ),

      ],
    );
  }
}
