import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/pages/level/results.dart';
import 'package:game/view/state/NavigationModel.dart';
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
            model.nextLevel();
            Navigator.pop(context);
            Navigator.popAndPushNamed(context, "/level");
          },
          child: Text("next level"),

        ),
        FlatButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/levels");
          },
          child: Text("back"),

        )
      ],
    );
  }

}