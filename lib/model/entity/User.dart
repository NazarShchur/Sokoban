import 'package:game/controller/dao/Fields.dart';

class User {
  final BigInt _id;
  int _lastLevel;
  int _balance;

  User(this._id, this._lastLevel, this._balance);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        BigInt.parse(json[Fields.ID]), json["lastlevel"], json["balance"]);
  }

  Map<String, dynamic> toJson() {
    return {Fields.ID: _id};
  }

  @override
  String toString() {
    return 'User{_id: $_id, _lastLevel: $_lastLevel, _balance: $_balance}';
  }

  int get balance => _balance;

  set balance(int value) {
    _balance = value;
  }

  int get lastLevel => _lastLevel;

  set lastLevel(int value) {
    _lastLevel = value;
  }

  BigInt get id => _id;

}
