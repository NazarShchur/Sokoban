import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/RecordsService.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/results.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/state/NavigationModel.dart';
import 'package:provider/provider.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Results results = ModalRoute.of(context).settings.arguments;
    final model = Provider.of<NavigationModel>(context);
    BigInt currentUserId = UserService().getCurrentUserId();
    return Scaffold(
      backgroundColor: Colors.brown,
      body: FutureBuilder<Results>(
        future: RecordsService().getRecordsForUserLevel(currentUserId, results.level),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: <Widget>[
                    Text("You Won!", style: style(50)),
                    Text("Level  ${results.level}", style: style(14),),
                  ],
                ),
                snapshot.data.level == -1 ? Text("Reward ${Constants.ADD_MONEY_FOR_LEVEL}",style: style(20)) : Container() ,
                Text("Your moves: ${results.moves}", style: style(20)),
                Text("Your best moves: ${snapshot.data.level != -1 ? snapshot.data.moves : results.moves}", style: style(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.buttonBorderColor, width: 10),
                          color: Constants.buttonBackColor
                      ),
                      child: FlatButton(
                        onPressed: (){_onPressedMenu(context);},
                        child: Text("menu", style: style(20)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.buttonBorderColor, width: 10),
                          color: Constants.buttonBackColor
                      ),
                      child: FlatButton(
                        onPressed: (){_onPressedNext(context, model);},
                        child: Text("next", style: style(20)),
                      ),
                    ),
                  ],
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

void _onPressedNext(context, model) {
  if (model.nextLevel()) {
    Navigator.popAndPushNamed(context, "/level");
  } else {
    Navigator.popAndPushNamed(context, "/levels");
  }
}

void _onPressedMenu(context) {
  Navigator.popUntil(context, ModalRoute.withName("/levels"));
  Navigator.pop(context);
  Navigator.pushNamed(context, "/levels");
}
TextStyle style(double fontSize){
  return TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: fontSize);
}
