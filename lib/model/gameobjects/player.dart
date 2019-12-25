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
    return Container(
      width: tileSize,
      height: tileSize,
      child: Image(
        image: AssetImage(theme.playerImgUrl),
      ),
    );
  }
}
