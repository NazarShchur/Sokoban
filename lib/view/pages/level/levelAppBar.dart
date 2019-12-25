import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game/model/entity/results.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/data/fonts.dart';
import 'package:game/view/pages/level/levelAppBarButton.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';

class LevelAppBar extends StatelessWidget implements PreferredSizeWidget {
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
      leading: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Constants.buttonBorderColor, width: 5),
            color: Constants.buttonBackColor),
        child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _onTapLeading(context);
          },
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 30),
      textTheme: TextTheme(title: TextStyle(color: Colors.white)),
      backgroundColor: Constants.buttonBackColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(children:[Icon(MyFonts.footprints), Text("  ${results.moves}"),]),
          Row(children:[Icon(FontAwesomeIcons.bitcoin), Text("  ${model.userBalance}")],),
        ],
      ),
      actions: [
        LevelAppBarButton(
          icon: Icons.arrow_back,
          onTap: _onTapBack,
          iconColor: model.userBalance >= Constants.COST_OF_TURN_BACK
              ? Colors.white
              : Constants.buttonBackColor,
        ),
        SizedBox(
          width: 10,
        ),
        LevelAppBarButton(
            icon: Icons.refresh,
            onTap: restartLevel,
            iconColor: Colors.white),
      ],
    );
  }

  void _onTapLeading(context) {
    Navigator.pop(context);
  }

  void _onTapBack(context) {
    final model = Provider.of<UserModel>(context);
    if (model.userBalance >= Constants.COST_OF_TURN_BACK) {
      moveBack(model);
    }
  }
}
