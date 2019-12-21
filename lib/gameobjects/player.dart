import 'package:flutter/cupertino.dart';

class PlayerObj extends StatelessWidget {
  final double tileSize;

  PlayerObj(this.tileSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileSize,
      height: tileSize,
      child: Image(
        image: AssetImage("assets/images/player.png"),
      ),
    );
  }
}
