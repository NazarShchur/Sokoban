import 'package:flutter/cupertino.dart';
import 'package:game/data/Levels.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/direction.dart';
import 'package:game/gameobjects/moveablebox.dart';
import 'package:game/gameobjects/object.dart';
import 'package:game/gameobjects/wall.dart';

class LevelData{
  Coordinate playerCoordinate;
  LevelData(double width, int levelNum){
    map.addAll(LevelsProvider.getLevel(levelNum));
    tileSize = width / map[0].length;
    mapOfObjects = {};
    for(int i = 0; i < map.length; i++){
      for(int j = 0; j < map[0].length; j++){
        if(map[i][j] == "b"){
          mapOfObjects[Coordinate(j, i)] = GameBox(tileSize, false);
        } else if(map[i][j] == "w") {
          mapOfObjects[Coordinate(j, i)] = Wall(tileSize);
        } else if(map[i][j] == "p"){
          playerCoordinate = Coordinate(j, i);
        } else if(map[i][j] == "n"){
          mapOfObjects[Coordinate(j, i)] = GameBox(tileSize, true);
          spots.add(Coordinate(j,i));
        } else if(map[i][j] == "x"){
          spots.add(Coordinate(j,i));
        }
      }
    }
  }
  double tileSize;

  List<String> map = [];
  Map<Coordinate, GameObject> mapOfObjects;
  List<Coordinate> spots = [];


  bool movePlayer(Direction direction){
    switch(direction){
      case Direction.RIGHT:
        {
          if(mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] is GameBox){
            if(mapOfObjects[Coordinate(playerCoordinate.x + 2, playerCoordinate.y)] is GameBox
                || mapOfObjects[Coordinate(playerCoordinate.x + 2, playerCoordinate.y)] is Wall){

            } else{
              mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x + 2, playerCoordinate.y)] = GameBox(tileSize, isBoxOnSpot(Coordinate(playerCoordinate.x + 2, playerCoordinate.y)));
              playerCoordinate.x++;
            }
          } else if(mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] is Wall){

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

            } else{
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 1)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 2)] = GameBox(tileSize, isBoxOnSpot(Coordinate(playerCoordinate.x, playerCoordinate.y - 2)));
              playerCoordinate.y--;
            }
          } else if(mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 1)] is Wall){

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

            } else{
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 1)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 2)] = GameBox(tileSize, isBoxOnSpot(Coordinate(playerCoordinate.x, playerCoordinate.y + 2)));
              playerCoordinate.y++;
            }
          } else if(mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 1)] is Wall){

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

            } else{
              mapOfObjects[Coordinate(playerCoordinate.x - 1, playerCoordinate.y)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x - 2, playerCoordinate.y)] = GameBox(tileSize, isBoxOnSpot(Coordinate(playerCoordinate.x - 2, playerCoordinate.y)));
              playerCoordinate.x--;
            }
          } else if(mapOfObjects[Coordinate(playerCoordinate.x - 1, playerCoordinate.y)] is Wall){

          } else {
            playerCoordinate.x--;
          }
        }
        break;
    }
    return isLevelPassed();
  }
  
  bool isBoxOnSpot(Coordinate boxCoordinate) => spots.contains(boxCoordinate);
  bool isLevelPassed(){
    bool flag = true;
    for(Coordinate c in spots){
      if(!(mapOfObjects[c] is GameBox)){
        flag = false;
      }
    }
    return flag;
  }
}