import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/view/data/Themes.dart';
import 'package:game/view/pages/shoppage/selectThemeButton.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';


class ThemeTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserModel>(context);
    return ListView(
      children: <Widget>[
        Column(
          children: List.generate(GameThemes.themes.length, (int){
              return SelectThemeButton(
                themeId: int,
                isBought: model.themes.contains(int),
              );
            })

        ),
      ],
    );
  }

}