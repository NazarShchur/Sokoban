class Coordinate{
  int y;
  int x;
  Coordinate(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Coordinate &&
              runtimeType == other.runtimeType &&
              y == other.y &&
              x == other.x;

  @override
  int get hashCode =>
      y.hashCode ^
      x.hashCode;

  @override
  String toString() {
    return 'Coordinate{x: $x, y: $y}';
  }


  Coordinate clone(){
    return Coordinate(this.x, this.y);
  }


}