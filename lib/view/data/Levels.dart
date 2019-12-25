abstract class LevelsProvider{
  static Map<int, List<String>> _map = {
    1 : [
      "wwwwww",
      "w xwww",
      "w bwww",//todo transfer levels to firebase
      "wnp  w",
      "w    w",
      "w  www",
      "wwwwww",
    ],
    2 : [
      "wwwwww",
      " w   w",
      "wwxw w",
      "w    w",
      "w  b w",
      "wpwnww",
      "w   ww",
      "wwwwww",
    ],
    3 : [
      "wwww  ",
      "w xw  ",
      "w bwww",
      "wnp  w",
      "w    w",
      "w  www",
      "wwww  ",
    ],
    4 : [
      "wwww  ",
      "w xw  ",
      "w bwww",
      "wnp  w",
      "w    w",
      "w  www",
      "wwww  ",
    ],
    5 : [
      "wwww  ",
      "w xw  ",
      "w bwww",
      "wnp  w",
      "w    w",
      "w  www",
      "wwww  ",
    ],
    7 : [
      "wwww  ",
      "w xw  ",
      "w bwww",
      "wnp  w",
      "w    w",
      "w  www",
      "wwww  ",
    ],
    8 : [
      "wwww  ",
      "w xw  ",
      "w bwww",
      "wnp  w",
      "w    w",
      "w  www",
      "wwww  ",
    ],
    9 : [
      "wwww  ",
      "w xw  ",
      "w bwww",
      "wnp  w",
      "w    w",
      "w  www",
      "wwww  ",
    ],
    10 : [
      "wwww  ",
      "w xw  ",
      "w bwww",
      "wnp  w",
      "w    w",
      "w  www",
      "wwww  ",
    ],
    11 : [
      "wwww  ",
      "w xw  ",
      "w bwww",
      "wnp  w",
      "w    w",
      "w  www",
      "wwww  ",
    ],
  };

  static List<String> getLevel(int i){
    return _map[i];
  }
  static get countOfLevels => _map.length;
}