import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/data/Themes.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';

class SelectThemeButton extends StatelessWidget{
  final int themeId;
  final bool isBought;
  SelectThemeButton({this.isBought, this.themeId});
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserModel>(context);
    return GestureDetector(
      onTap: (){_onTap(model, context);},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: themeId == model.selectedTheme ? Colors.blue : Colors.transparent, width: 20)
            ),
            width: MediaQuery.of(context).size.width - 100,
            height: MediaQuery.of(context).size.width - 100,
            child: Image.asset(GameThemes.themes[themeId].preview),
          ),
          isBought
              ? Container()
              :  Container(
            color: Color.fromRGBO(156, 156, 156, 0.8),
            width: MediaQuery.of(context).size.width - 100,
            height: MediaQuery.of(context).size.width - 100,
            child: Center(child: Icon(Icons.lock, color:  Color.fromRGBO(255, 255, 255, 0.7), size: 100,),),
          ),
        ],
      ),
    );
  }
  void _onTap(UserModel model, context) async{
    if(isBought){
      model.setTheme(themeId);
    } else {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Do you want buy this theme for ${Constants.PRICE_OF_THEME}?"),
          actions: [
            FlatButton(
              onPressed: () {
                if(model.userBalance < Constants.PRICE_OF_THEME){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("You don`t have enough money"),
                      actions: [FlatButton(
                        child: Text("Ok"),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          },)],
                    );
                  });
                } else {
                  model.addTheme(themeId);
                  UserService().addTheme(themeId);
                  Navigator.pop(context);
                }
              },
              child: Text("Yes"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
          ],
        );
      });
    }
  }
}