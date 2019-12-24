

import 'package:game/controller/dao/Fields.dart';

class Results{
  int _level;
  int _moves = 0;

  Results(this._level);


  void incMoves(){
    _moves++;
  }
  get moves => _moves;
  get level => _level;

  Results.withMoves(this._level, this._moves);
  factory Results.fromJson(Map<String, dynamic> json){
    return Results.withMoves(
      json[Fields.LEVEL],
      json[Fields.MOVES]
    );
  }

}