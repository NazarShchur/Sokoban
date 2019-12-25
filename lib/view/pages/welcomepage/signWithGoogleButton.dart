import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:game/view/state/UserModel.dart';
import 'package:provider/provider.dart';

class SignWithGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFFB4B8B7),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: FlatButton.icon(
          onPressed: () {
            _sign(context);
          },
          icon: Container(
            width: 50,
              height: 35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/google.png")
                  )
              )
          ),
          label: Container(
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 1, color: Colors.brown )
                )
              ),
              child: Text("Sign with Google", style: TextStyle(color: Colors.brown, fontSize: 16),)
          )
      ),
    );
  }

  void _sign(context) {
    signInWithGoogle().whenComplete(() {
      if(googleSignIn.currentUser!=null){
        UserService().auth();
        Navigator.of(context).popAndPushNamed("/menu");
        Provider.of<UserModel>(context).changeUser();
      }
    });
  }
}
