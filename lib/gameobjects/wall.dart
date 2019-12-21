import 'package:flutter/material.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/object.dart';

class Wall extends GameObject{
  final double size;
  Wall(this.size);
  @override
  State<StatefulWidget> createState() {
    return WallState();
  }

}

class WallState extends State<Wall>{
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.size,
        width: widget.size,
    );
  }
}