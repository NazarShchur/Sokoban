import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/pages/level/results.dart';
import 'package:game/state/NavigationModel.dart';
import 'package:game/state/pagesEnum.dart';
import 'package:provider/provider.dart';

class ResultsAlert extends StatelessWidget{
  final Results results;
  ResultsAlert(this.results);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("moves: ${results.moves}"),
          Text("pushes: ${results.pushes}")
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            model.nextLevel();
            Navigator.pushNamed(context, "/level");
          },
          child: Text("next level"),

        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/levels");
          },
          child: Text("back"),

        )
      ],
    );
  }

}