import 'package:game/data/Levels.dart';
import 'package:game/gameobjects/coordinate.dart';
import 'package:game/gameobjects/direction.dart';
import 'package:game/gameobjects/moveablebox.dart';
import 'package:game/gameobjects/object.dart';
import 'package:game/gameobjects/player.dart';
import 'package:game/gameobjects/wall.dart';
import 'package:game/pages/level/results.dart';

class LevelData {
  double tileSize;
  List<String> map = [];
  List<Coordinate> spots = [];
  Results results = Results();
  LevelData memento;
  Map<Coordinate, GameObject> mapOfObjects;


  LevelData(double width, int levelNum) {
    map.addAll(LevelsProvider.getLevel(levelNum));
    tileSize = width / map[0].length;
    mapOfObjects = {};
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < map[0].length; j++) {
        if (map[i][j] == "b") {
          mapOfObjects[Coordinate(j, i)] = GameBox(tileSize, false);
        } else if (map[i][j] == "w") {
          mapOfObjects[Coordinate(j, i)] = Wall(tileSize);
        } else if (map[i][j] == "p") {
          mapOfObjects[Coordinate(j, i)] = PlayerObj(tileSize);
        } else if (map[i][j] == "n") {
          mapOfObjects[Coordinate(j, i)] = GameBox(tileSize, true);
          spots.add(Coordinate(j, i));
        } else if (map[i][j] == "x") {
          spots.add(Coordinate(j, i));
        }
      }
    }
    memento = LevelData.copy(this);
  }
  LevelData.copy(LevelData data){
    tileSize = data.tileSize;
    results = data.results;
    spots = data.spots;
    memento = data.memento;
    mapOfObjects = {};
    data.mapOfObjects.forEach((k, v)=>mapOfObjects[k] = v);
   }

  bool movePlayer(Direction direction) {
    Coordinate playerCoordinate = getPlayerCoordinate();
    memento = remember();
    switch (direction) {
      case Direction.RIGHT:
        {
          if (mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] is GameBox) {
            if (mapOfObjects[Coordinate(playerCoordinate.x + 2, playerCoordinate.y)]is GameBox || mapOfObjects[Coordinate(playerCoordinate.x + 2, playerCoordinate.y)]is Wall) {

            } else {
              mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x + 2, playerCoordinate.y)] = GameBox(tileSize, isBoxOnSpot(Coordinate(playerCoordinate.x + 2, playerCoordinate.y)));
              results.incPushes();
              movePlayerIcon(direction);
            }
          } else if (mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] is Wall) {

          } else {
            movePlayerIcon(direction);

            results.incMoves();
          }
        }
        break;
      case Direction.UP:
        {
          if (mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 1)]is GameBox) {
            if (mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 2)] is GameBox || mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 2)] is Wall) {

            } else {
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 1)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y - 2)] = GameBox(tileSize, isBoxOnSpot(Coordinate(playerCoordinate.x, playerCoordinate.y - 2)));
              results.incPushes();
              movePlayerIcon(direction);
            }
          } else if (mapOfObjects[
              Coordinate(playerCoordinate.x, playerCoordinate.y - 1)] is Wall) {
          } else {
            results.incMoves();
            movePlayerIcon(direction);
          }
        }
        break;
      case Direction.DOWN:
        {
          if (mapOfObjects[
                  Coordinate(playerCoordinate.x, playerCoordinate.y + 1)]
              is GameBox) {
            if (mapOfObjects[
                        Coordinate(playerCoordinate.x, playerCoordinate.y + 2)]
                    is GameBox ||
                mapOfObjects[
                        Coordinate(playerCoordinate.x, playerCoordinate.y + 2)]
                    is Wall) {
            } else {
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 1)] = null;
              mapOfObjects[Coordinate(playerCoordinate.x, playerCoordinate.y + 2)] = GameBox(tileSize, isBoxOnSpot(Coordinate(playerCoordinate.x, playerCoordinate.y + 2)));
              results.incPushes();
              movePlayerIcon(direction);
            }
          } else if (mapOfObjects[
              Coordinate(playerCoordinate.x, playerCoordinate.y + 1)] is Wall) {
          } else {
            results.incMoves();
            movePlayerIcon(direction);
          }
        }
        break;
      case Direction.LEFT:
        {
          if (mapOfObjects[
                  Coordinate(playerCoordinate.x - 1, playerCoordinate.y)]
              is GameBox) {
            if (mapOfObjects[
                        Coordinate(playerCoordinate.x - 2, playerCoordinate.y)]
                    is GameBox ||
                mapOfObjects[
                        Coordinate(playerCoordinate.x - 2, playerCoordinate.y)]
                    is Wall) {
            } else {
              mapOfObjects[
                      Coordinate(playerCoordinate.x - 1, playerCoordinate.y)] =
                  null;
              mapOfObjects[
                  Coordinate(
                      playerCoordinate.x - 2, playerCoordinate.y)] = GameBox(
                  tileSize,
                  isBoxOnSpot(
                      Coordinate(playerCoordinate.x - 2, playerCoordinate.y)));
              results.incPushes();
              movePlayerIcon(direction);
            }
          } else if (mapOfObjects[
              Coordinate(playerCoordinate.x - 1, playerCoordinate.y)] is Wall) {
          } else {
            results.incMoves();
            movePlayerIcon(direction);
          }
        }
        break;
    }
    return isLevelPassed();
  }

  void moveBack(){
    mapOfObjects = {};
    mapOfObjects.addAll(memento.mapOfObjects);
  }

  bool isBoxOnSpot(Coordinate boxCoordinate) => spots.contains(boxCoordinate);

  bool isLevelPassed() {
    bool flag = true;
    for (Coordinate c in spots) {
      if (!(mapOfObjects[c] is GameBox)) {
        flag = false;
      }
    }
    return flag;
  }
  void movePlayerIcon(Direction direction) {
    Coordinate playerCoordinate = getPlayerCoordinate().clone();
    mapOfObjects[playerCoordinate] = null;
    switch (direction) {
      case Direction.UP:
        {
          playerCoordinate.y--;
        }
        break;
      case Direction.DOWN:
        {
          playerCoordinate.y++;
        }
        break;
      case Direction.LEFT:
        {
          playerCoordinate.x--;
        }
        break;
      case Direction.RIGHT:
        {
          playerCoordinate.x++;
        }
        break;
    }
    mapOfObjects[playerCoordinate] = PlayerObj(tileSize);
  }

  Coordinate getPlayerCoordinate() =>  mapOfObjects.entries.firstWhere((a)=>a.value is PlayerObj).key;

  LevelData remember(){
    return LevelData.copy(this);
  }
}
