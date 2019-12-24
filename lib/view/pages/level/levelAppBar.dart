import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/model/entity/results.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';
class LevelAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Results results;
  final Function moveBack;
  final Function restartLevel;
  LevelAppBar(this.results, this.moveBack, this.restartLevel);
  @override
  Size get preferredSize => Size.fromHeight(57);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserModel>(context);
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.black
        )
      ),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("moves : ${results.moves}"),
          Text("money : ${model.userBalance}")
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: model.userBalance >= Constants.COST_OF_TURN_BACK ? Colors.black : Colors.grey,
          ),
          onPressed: (){
            if(model.userBalance >= Constants.COST_OF_TURN_BACK){
              moveBack(model);
            }
          }
        ),
        IconButton(
            icon: Icon(
                Icons.refresh
            ),
            onPressed: restartLevel
        )
      ],
    );
  }

}