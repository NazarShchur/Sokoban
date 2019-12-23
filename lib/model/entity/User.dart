
import 'package:game/controller/dao/Fields.dart';

class User{
  final int _id;

  User(this._id);

  factory User.fromJson(Map<String, dynamic> json){
    return User(json[Fields.USER_ID] as int);
  }

  Map<String, dynamic> toJson(){
    return {
      Fields.USER_ID : _id
    };
  }

  @override
  String toString() {
    return 'User{_id: $_id}';
  }


}