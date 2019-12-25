
import 'package:game/model/gameobjects/coordinate.dart';
import 'package:game/model/gameobjects/direction.dart';
import 'package:game/model/gameobjects/moveablebox.dart';
import 'package:game/model/gameobjects/object.dart';
import 'package:game/model/gameobjects/player.dart';
import 'package:game/model/gameobjects/wall.dart';
import 'package:game/view/data/Levels.dart';
import 'package:game/model/entity/results.dart';

class LevelData {
  double tileSize;
  List<String> map = [];
  List<Coordinate> spots = [];
  Results results;
  LevelData memento;
  Map<Coordinate, GameObject> mapOfObjects;


  LevelData(double width, int levelNum) {
    print(LevelsProvider.getLevel(levelNum));
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
    results = Results(levelNum);
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
              movePlayerIcon(direction);
            }
          } else if (mapOfObjects[Coordinate(playerCoordinate.x + 1, playerCoordinate.y)] is Wall) {

          } else {
            movePlayerIcon(direction);
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
              movePlayerIcon(direction);
            }
          } else if (mapOfObjects[
              Coordinate(playerCoordinate.x, playerCoordinate.y - 1)] is Wall) {
          } else {
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
              movePlayerIcon(direction);
            }
          } else if (mapOfObjects[
              Coordinate(playerCoordinate.x, playerCoordinate.y + 1)] is Wall) {
          } else {
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
              movePlayerIcon(direction);
            }
          } else if (mapOfObjects[
              Coordinate(playerCoordinate.x - 1, playerCoordinate.y)] is Wall) {
          } else {
            movePlayerIcon(direction);
          }
        }
        break;
    }
    return isLevelPassed();
  }

  bool moveBack(){
    if(memento.getPlayerCoordinate() == getPlayerCoordinate()) {
      return false;
    }
    mapOfObjects = {};
    mapOfObjects.addAll(memento.mapOfObjects);
    return true;
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
    results.incMoves();
  }

  Coordinate getPlayerCoordinate() =>  mapOfObjects.entries.firstWhere((a)=>a.value is PlayerObj).key;

  LevelData remember(){
    return LevelData.copy(this);
  }
}
