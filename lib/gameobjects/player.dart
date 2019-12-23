import 'package:flutter/cupertino.dart';
import 'package:game/gameobjects/object.dart';

class PlayerObj extends GameObject {
  final double tileSize;
  PlayerObj(this.tileSize);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileSize,
      height: tileSize,
      child: Image(
        image: AssetImage("assets/images/player.png"),
      ),
    );
  }
}
