import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/view/pages/welcomepage/logoText.dart';
import 'package:game/view/pages/welcomepage/signWithGoogleButton.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 2),
          ColorTween(begin: Colors.brown.shade400, end:Colors.brown.shade700 )),
    ]);

    return ControlledAnimation(
        playback: Playback.MIRROR,
        tween: tween,
        duration: tween.duration,
        builder: (context, animation)
    {
      return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: animation["color1"],
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LogoText(),
                  SizedBox(
                      height: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/images/instruction1.jpg"),
                          Image.asset("assets/images/instruction2.jpg")
                        ],
                      )),
                  SignWithGoogleButton()
                ],
              ),
            )
        ),
      );
    }
    );
  }

}