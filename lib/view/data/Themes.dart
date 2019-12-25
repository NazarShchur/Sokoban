

import 'package:game/view/data/gameTheme.dart';

abstract class GameThemes{
  static final String route = "assets/images";
  static final GameTheme standartTheme = GameTheme(
    markImgUrl: "$route/x-mark_standart.png",
    readyBoxImgUrl: "$route/ReadyBox.png",
    playerImgUrl: "$route/player_standart.png",
    wallImgUrl: "$route/wall.png",
    boxImgUrl: "$route/Box.png",
    backgroundImgUrl: "$route/standart_back.jpg"
  );
  static final GameTheme memeTheme = GameTheme(
      markImgUrl: "$route/x-mark_standart.png",
      readyBoxImgUrl: "$route/ReadyBox.png",
      playerImgUrl: "$route/player.png",
      wallImgUrl: "$route/wall.png",
      boxImgUrl: "$route/Box.png",
      backgroundImgUrl: "$route/standart_back.jpg"
  );
}