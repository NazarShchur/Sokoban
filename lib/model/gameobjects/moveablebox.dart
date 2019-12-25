import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/data/gameTheme.dart';
import 'package:game/view/state/UserModel.dart';
import 'object.dart';

class GameBox extends GameObject{
  final double size;
  final bool isOnSpot;
  final GameTheme theme = UserModel.theme;
  GameBox(this.size, this.isOnSpot);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Image(
        image: AssetImage(isOnSpot ? theme.readyBoxImgUrl : theme.boxImgUrl),
      ),
    );
  }
}

