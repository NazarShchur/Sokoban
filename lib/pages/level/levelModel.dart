import 'package:flutter/cupertino.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/object.dart';

class LevelModel extends ChangeNotifier{
  Map<Coordinate, GameObject> mapOfObjects = {};
  void addToMap(Coordinate c, GameObject g){
    mapOfObjects[c] = g;
  }
}