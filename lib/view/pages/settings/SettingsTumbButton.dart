import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game/view/data/Constants.dart';

class SettingsTumbButton extends StatefulWidget{
  final IconData onIcon;
  final IconData offIcon;
  SettingsTumbButton({@required this.offIcon, @required this.onIcon});
  @override
  State<StatefulWidget> createState() {
    return _SettingsTumbButtonState();
  }

}
class _SettingsTumbButtonState extends State<SettingsTumbButton>{
  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Constants.buttonBorderColor, width: 10),
        color: Constants.buttonBackColor
      ),
      child: IconButton(
        icon: Icon(isOn ? widget.onIcon : widget.offIcon),
        onPressed: (){
          setState(() {
            isOn = !isOn;
          });
        },
      ),
    );
  }

}