import 'package:flutter/cupertino.dart';

class Results{
  int _moves = 0;
  int _pushes = 0;

  void incPushes(){
    _moves++;
    _pushes++;
  }
  void incMoves(){
    _moves++;
  }
  get moves => _moves;
  get pushes => _pushes;
}