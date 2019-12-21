import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/object.dart';

class GameBox extends GameObject{
  final double size;
  GameBox(this.size);
  @override
  State<StatefulWidget> createState() {
      return GameBoxState();
  }
}

class GameBoxState extends State<GameBox>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
    );
  }

}