

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
    preview: "$route/standart_preview.png",
    floor: "$route/floor.png",
  );
  static final GameTheme marioTheme = GameTheme(
      markImgUrl: "$route/x-mark_mario.png",
      readyBoxImgUrl: "$route/readybox_mario.png",
      playerImgUrl: "$route/player_mario.png",
      wallImgUrl: "$route/wall_mario.png",
      boxImgUrl: "$route/box_mario.png",
      backgroundImgUrl: "$route/back_mario.png",
      name: "Mario theme",
      preview: "$route/mario_preview.png",
      floor: "$route/floor.png",

  );
  static final GameTheme batmanTheme = GameTheme(
    markImgUrl: "$route/x-mark_batman.png",
    readyBoxImgUrl: "$route/readybox_batman.png",
    playerImgUrl: "$route/player_batman.png",
    wallImgUrl: "$route/wall_batman.jpg",
    boxImgUrl: "$route/box_batman.png",
    backgroundImgUrl: "$route/back_batman.png",
    name: "Batman theme",
    preview: "$route/batman_preview.png",
    floor: "$route/floor_batman.jpg",

  );
  static final GameTheme newYearTheme = GameTheme(
    markImgUrl: "$route/x-mark_ny.png",
    readyBoxImgUrl: "$route/readybox_ny.png",
    playerImgUrl: "$route/player_ny.png",
    wallImgUrl: "$route/wall_ny.jpg",
    boxImgUrl: "$route/box_ny.png",
    backgroundImgUrl: "$route/back_ny.jpg",
    name: "New Year theme",
    preview: "$route/ny_preview.png",
    floor: "$route/floor.png",

  );

  static Map<int, GameTheme> themes = {
    0 : standartTheme,
    1 : marioTheme,
    2 : batmanTheme,
    3 : newYearTheme
  };
}