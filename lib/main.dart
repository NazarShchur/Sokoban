import 'package:flutter/material.dart';

void main() {
  runApp(Sokoban());
}

class Sokoban extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SokobanState();
  }
}

class SokobanState extends State<Sokoban>{
  List<Widget> pages = [
    Container(),
    Container(),
    Container()
  ]
  @override
  Widget build(BuildContext context) {
    final model = Provider
   return MaterialApp(
     home: pages[currentPage]
   )
  }

}
