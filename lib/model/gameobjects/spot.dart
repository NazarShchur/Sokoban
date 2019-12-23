import 'package:flutter/cupertino.dart';

class Spot extends StatelessWidget {
  final double tileSize;

  Spot(this.tileSize);

  @override
  Widget build(BuildContext context) {
    return Container(width: tileSize, height: tileSize, child: Center(child: Text("СЮДА")));
  }
}
