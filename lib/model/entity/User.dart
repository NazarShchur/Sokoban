import 'package:game/controller/dao/Fields.dart';

class User {
  final BigInt _id;
  int _lastLevel;
  int _balance;
  List<int> _themes;

  User(this._id, this._lastLevel, this._balance, this._themes);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        BigInt.parse(json[Fields.ID]), json[Fields.LAST_LEVEL], json[Fields.BALANCE], json[Fields.THEMES] == null ? [] : [...json[Fields.THEMES]]);
  }
  Map<String, dynamic> toJson() {
    return {Fields.ID: _id};
  }


  @override
  String toString() {
    return 'User{_id: $_id, _lastLevel: $_lastLevel, _balance: $_balance, _themes: $_themes}';
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

  List<int> get themes => _themes;

}
