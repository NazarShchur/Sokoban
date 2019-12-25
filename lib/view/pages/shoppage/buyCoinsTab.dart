import 'package:flutter/cupertino.dart';
import 'package:game/view/pages/shoppage/buyCoinsButton.dart';

class BuyCoinsTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BuyCoinsButton(
          price: 9.99,
          imgUrl: "assets/images/few_coins.png",//todo transfer to constants
          text: "Few coins",
          amountToBuy: 100,
        ),
        BuyCoinsButton(
          price: 19.99,
          imgUrl: "assets/images/some_coins.png",
          text: "Some coins",
          amountToBuy: 500,
        ),
        BuyCoinsButton(
          price: 49.99,
          imgUrl: "assets/images/lots_coins.png",
          text: "A lot of coins",
          amountToBuy: 2000,
        )
      ],
    );
  }

}