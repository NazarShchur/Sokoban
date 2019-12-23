import 'package:flutter/material.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/object.dart';

class Wall extends GameObject{
  final double size;
  Wall(this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Image(
        image: AssetImage("assets/images/wall.png"),
      ),
    );
  }

}

