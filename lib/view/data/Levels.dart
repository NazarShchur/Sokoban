abstract class LevelsProvider{
  static Map<int, List<String>> _map = {
    1 : [
      "wwww  ",
      "w xw  ",
      "w bwww",
      "wnp  w",
      "w    w",
      "w  www",
      "wwww  ",
    ],
    2 : [
      " wwwww",
      " w   w",
      "wwxw w",
      "w    w",
      "w  b w",
      "wpwnww",
      "w   w ",
      "wwwww ",
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
  };

  static List<String> getLevel(int i){
    return _map[i];
  }
  static get countOfLevels => _map.length;
}