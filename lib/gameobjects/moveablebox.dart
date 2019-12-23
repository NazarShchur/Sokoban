import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/object.dart';

class GameBox extends GameObject{
  final double size;
  final bool isOnSpot;
  GameBox(this.size, this.isOnSpot);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Image(
        image: AssetImage(isOnSpot ? "assets/images/ReadyBox.png" : "assets/images/Box.png"),
      ),
    );
  }
}

