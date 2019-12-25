import 'package:firebase_database/firebase_database.dart';
import 'package:game/model/entity/User.dart';

import 'Fields.dart';

class FirebaseUserDao{
  
  final DatabaseReference reference = FirebaseDatabase.instance.reference();
  
  void create(String id){
    reference.child(Fields.USER_TABLE).child(id).child(Fields.ID).set(id);
    reference.child(Fields.USER_TABLE).child(id).child(Fields.BALANCE).set(100);
    reference.child(Fields.USER_TABLE).child(id).child(Fields.LAST_LEVEL).set(1);
    reference.child(Fields.USER_TABLE).child(id).child(Fields.THEMES).child(0.toString()).set(0);
  }
  Future<User> findById(String id) async {
    DataSnapshot snapshot = await reference.child(Fields.USER_TABLE).orderByChild(Fields.ID).equalTo(id).once();
    User user = snapshot.value != null ? User.fromJson(Map<String, dynamic>.from(snapshot.value[id])) : null;
    return user;
  }

  void updateBalanceById(BigInt userID, int toSet){
    reference.child(Fields.USER_TABLE).child(userID.toString()).child(Fields.BALANCE).set(toSet);
  }

  void updateLastLevelById(BigInt userID, int toSet){
    reference.child(Fields.USER_TABLE).child(userID.toString()).child(Fields.LAST_LEVEL).set(toSet);
  }

  void createUserTheme(int theme, BigInt userId){
    reference.child(Fields.USER_TABLE).child(userId.toString()).child(Fields.THEMES).child(theme.toString()).set(theme);
  }

}