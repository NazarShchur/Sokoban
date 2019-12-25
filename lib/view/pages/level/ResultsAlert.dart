import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/RecordsService.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/results.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:provider/provider.dart';

class ResultsAlert extends StatelessWidget{
  final Results results;
  ResultsAlert(this.results);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NavigationModel>(context);
    BigInt currentUserId = UserService().getCurrentUserId();
    return AlertDialog(
      content: FutureBuilder<Results>(
        future: RecordsService().getRecordsForUserLevel(currentUserId, results.level),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("your moves: ${results.moves}"),
                Text("your best moves: ${snapshot.data.level != -1 ? snapshot.data.moves : results.moves}")
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      actions: [
        FlatButton(
          onPressed: () {
            if(model.nextLevel()){
              Navigator.pop(context);
              Navigator.popAndPushNamed(context, "/level");
            } else {
              Navigator.popAndPushNamed(context, "/levels");
            }

          },
          child: Text("next"),

        ),
        FlatButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/levels");//todo handle routing back to level
          },
          child: Text("menu"),

        )
      ],
    );
  }

}