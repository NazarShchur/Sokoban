import 'package:flutter/material.dart';
import 'package:game/view/data/gameTheme.dart';
import 'package:game/view/state/UserModel.dart';

import 'object.dart';

class Wall extends GameObject{
  final GameTheme theme = UserModel.theme;
  final double size;
  Wall(this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Image(
        image: AssetImage(theme.wallImgUrl),
      ),
    );
  }

}

