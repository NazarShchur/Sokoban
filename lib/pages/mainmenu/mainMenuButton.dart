import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/state/NavigationModel.dart';
import 'package:game/state/pagesEnum.dart';
import 'package:provider/provider.dart';

class MainMenuButton extends StatelessWidget{
  final String text;
  final Pages toGo;
  MainMenuButton(this.text, this.toGo);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    return GestureDetector(
      onTap: (){
        model.setCurrentPage(toGo);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(text),
        ),
      ),
    );
  }

}