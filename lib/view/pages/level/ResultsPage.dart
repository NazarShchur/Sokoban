import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/RecordsService.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/results.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Results results = ModalRoute.of(context).settings.arguments;
    final model = Provider.of<NavigationModel>(context);
    BigInt currentUserId = UserService().getCurrentUserId();
    return Scaffold(
      body: FutureBuilder<Results>(
        future: RecordsService()
            .getRecordsForUserLevel(currentUserId, results.level),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("your moves: ${results.moves}"),
                Text(
                    "your best moves: ${snapshot.data.level != -1 ? snapshot.data.moves : results.moves}"),
                FlatButton(
                  onPressed: () {
                    if (model.nextLevel()) {
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
                    Navigator.popUntil(context, ModalRoute.withName("/levels"));
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/levels");
                  },
                  child: Text("menu"),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
//      actions: [
//        FlatButton(
//          onPressed: () {
//            if(model.nextLevel()){
//              Navigator.pop(context);
//              Navigator.popAndPushNamed(context, "/level");
//            } else {
//              Navigator.popAndPushNamed(context, "/levels");
//            }
//
//          },
//          child: Text("next"),
//
//        ),
//        FlatButton(
//          onPressed: () {
//            Navigator.popUntil(context, ModalRoute.withName("/levels"));
//            Navigator.pop(context);
//            Navigator.pushNamed(context, "/levels");
//          },
//          child: Text("menu"),
//
//        )
//      ],
    );
  }
}
