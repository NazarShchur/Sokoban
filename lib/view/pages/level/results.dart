

class Results{
  int level = 0;
  int _moves = 0;
  int _pushes = 0;
  Results(this.level);
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