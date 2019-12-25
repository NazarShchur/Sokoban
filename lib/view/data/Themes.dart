

import 'package:game/view/data/gameTheme.dart';

abstract class GameThemes{
  static final String route = "assets/images";
  static final GameTheme standartTheme = GameTheme(
    markImgUrl: "$route/x-mark_standart.png",
    readyBoxImgUrl: "$route/ReadyBox.png",
    playerImgUrl: "$route/player_standart.png",
    wallImgUrl: "$route/wall.png",
    boxImgUrl: "$route/Box.png",
    backgroundImgUrl: "$route/standart_back.jpg",
    name: "Standart theme",
    preview: "assets/images/floor.png"
  );
  static final GameTheme marioTheme = GameTheme(
      markImgUrl: "$route/x-mark_mario.png",
      readyBoxImgUrl: "$route/ReadyBox.png",
      playerImgUrl: "$route/player_mario.png",
      wallImgUrl: "$route/wall_mario.png",
      boxImgUrl: "$route/box_mario.png",
      backgroundImgUrl: "$route/standart_back.jpg",
      name: "Mario theme",
      preview: "assets/images/some_coins.png",

  );

  static Map<int, GameTheme> themes = {
    0 : standartTheme,
    1 : marioTheme,
    2 : marioTheme,
  };
}