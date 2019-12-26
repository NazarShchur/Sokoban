import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/controller/service/sign_in.dart';
import 'package:game/view/pages/levelspage/floatingActionNavigatorPop.dart';
import 'package:game/view/pages/settings/GoogleUserString.dart';
import 'package:game/view/pages/settings/SettingsTumbButton.dart';
import 'package:game/view/pages/settings/logoutbutton.dart';

class Settings extends StatefulWidget {
  //todo make stateless
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GoogleUserString(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            SettingsTumbButton(onIcon: Icons.volume_up, offIcon: Icons.volume_off),
            SettingsTumbButton(onIcon: Icons.notifications, offIcon: Icons.notifications_off)
          ],),
          LogoutButton(),
        ],
      ),
      floatingActionButton: FloatingActionNavigatorPop(),
    );
  }
}

