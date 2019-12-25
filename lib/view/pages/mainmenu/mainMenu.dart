import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/view/pages/mainmenu/bottomBarMenu.dart';
import 'package:game/view/pages/welcomepage/logoText.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'mainMenuButton.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 2),
          ColorTween(begin: Colors.brown.shade400, end:Colors.brown.shade700 )),
    ]);

    return WillPopScope(
      child: Scaffold(
        body: ControlledAnimation(
            playback: Playback.MIRROR,
            tween: tween,
            duration: tween.duration,
            builder: (context, animation) {
              return Container(
                decoration: BoxDecoration(
                    color: animation["color1"],
                ),
                child: Stack(
                  children:[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LogoText(),
                          MainMenuButton(
                            route: "/levels",
                            size: 120,
                            icon: Icons.play_arrow,
                          ),
                        ],
                      ),
                    ),
                    Align(child: BottomMenuBar(), alignment: Alignment.bottomCenter,),
                  ],
                ),
              );
            }),
        //bottomNavigationBar:
      ),
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
    );
  }
}
