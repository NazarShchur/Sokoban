import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/view/data/Constants.dart';
import 'package:game/view/data/fonts.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';

class BuyCoinsButton extends StatelessWidget{
  final String imgUrl;
  final int amountToBuy;
  final double price;
  final String text;
  BuyCoinsButton({this.amountToBuy, this.imgUrl, this.price, this.text});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserModel>(context);
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Constants.buttonBorderColor, width: 10),
        color: Constants.buttonBackColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: AssetImage(imgUrl)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [Text("$amountToBuy ", style: TextStyle(fontWeight: FontWeight.bold),), Icon(FontAwesomeIcons.bitcoin, color: Colors.yellow,)],
              ),
              Text(text, style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          FlatButton(
            onPressed: () {
              model.addBalance(amountToBuy);
              UserService().addUserMoney(amountToBuy);
            },
            child: Row(children: [Text(price.toString()), Icon(MyFonts.ukraine_hryvna, size: 15)],),
          )
        ],
      ),
    );
  }

}