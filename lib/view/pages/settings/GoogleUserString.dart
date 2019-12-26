import 'package:flutter/cupertino.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:game/view/data/Constants.dart';

class GoogleUserString extends StatelessWidget{
  final TextStyle style = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Constants.buttonBorderColor, width: 10),
          color: Constants.buttonBackColor
      ),
      height: 80,
      width:  MediaQuery.of(context).size.width - 100,
      child: Row(
        children:[
          Container(
              child: Image.network(googleSignIn.currentUser.photoUrl)
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(googleSignIn.currentUser.displayName, style: style,),
                  Text(googleSignIn.currentUser.email, style: style,)
                ],
              ),
            ),
          )
        ],
      ),
    );

  }

}