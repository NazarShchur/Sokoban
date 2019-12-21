import 'package:flutter/cupertino.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/direction.dart';
import 'package:game/gameobjects/moveablebox.dart';
import 'package:game/gameobjects/object.dart';
import 'package:game/gameobjects/wall.dart';

class LevelData{
  Coordinate playerCoordinate;
  LevelData(double tileSize){
    mapOfObjects = {};
    for(int i = 0; i < map.length; i++){
      for(int j = 0; j < map[0].length; j++){
        if(map[i][j] == "b"){
          mapOfObjects[Coordinate(j, i)] = GameBox();
        } else if(map[i][j] == "w") {
          mapOfObjects[Coordinate(j, i)] = Wall();
        } else if(map[i][j] == "p"){
          playerCoordinate = Coordinate(j, i);
        }
      }
    }
  }
  double tileSize;
  List<String> map = [
    "wwww  ",
    "w xw  ",
    "w  www",
    "wb   w",
    "w pb w",
    "w  www",
    "wwww  ",
  ];
  Map<Coordinate, GameObject> mapOfObjects;


  void movePlayer(Direction direction){
    switch(direction){
      case Direction.RIGHT:
        {
          if(mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] is GameBox){
            if(mapOfObjects[Coordinate(playerCoordinate.x + 2, playerCoordinate.y)] is GameBox
                || mapOfObjects[Coordinate(playerCoordinate.x + 2, playerCoordinate.y)] is Wall){
              return;
            } else{
              mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x + 2, playerCoordinate.y)] = GameBox();
              playerCoordinate.x++;
            }
          } else if(mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] is Wall){
            return;
          } else {
            playerCoordinate.x++;
          }
        }
      break;
      case Direction.UP:
        {
          if(mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 1)] is GameBox){
            if(mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 2)] is GameBox
                || mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 2)] is Wall){
              return;
            } else{
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 1)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 2)] = GameBox();
              playerCoordinate.y--;
            }
          } else if(mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 1)] is Wall){
            return;
          } else {
            playerCoordinate.y--;
          }
        }
        break;
      case Direction.DOWN:
        {
          if(mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 1)] is GameBox){
            if(mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 2)] is GameBox
                || mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 2)] is Wall){
              return;
            } else{
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 1)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 2)] = GameBox();
              playerCoordinate.y++;
            }
          } else if(mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 1)] is Wall){
            return;
          } else {
            playerCoordinate.y++;
          }
        }
        break;
      case Direction.LEFT:
        {
          if(mapOfObjects[Coordinate(playerCoordinate.x - 1, playerCoordinate.y)] is GameBox){
            if(mapOfObjects[Coordinate(playerCoordinate.x - 2, playerCoordinate.y)] is GameBox
                || mapOfObjects[Coordinate(playerCoordinate.x - 2, playerCoordinate.y)] is Wall){
              return;
            } else{
              mapOfObjects[Coordinate(playerCoordinate.x - 1, playerCoordinate.y)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x - 2, playerCoordinate.y)] = GameBox();
              playerCoordinate.x--;
            }
          } else if(mapOfObjects[Coordinate(playerCoordinate.x - 1, playerCoordinate.y)] is Wall){
            return;
          } else {
            playerCoordinate.x--;
          }
        }
        break;
    }
  }
}