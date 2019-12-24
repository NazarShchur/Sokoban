import 'package:firebase_database/firebase_database.dart';
import 'package:game/model/entity/User.dart';

import 'Fields.dart';

class FirebaseUserDao{
  
  final DatabaseReference reference = FirebaseDatabase.instance.reference();
  
  void create(String id){
    reference.child(Fields.USER_TABLE).child(id).child(Fields.ID).set(id);
    reference.child(Fields.USER_TABLE).child(id).child(Fields.BALANCE).set(100);
    reference.child(Fields.USER_TABLE).child(id).child(Fields.LAST_LEVEL).set(1);
  }
  Future<User> findById(String id) async {
    DataSnapshot snapshot = await reference.child(Fields.USER_TABLE).orderByChild(Fields.ID).equalTo(id).once();
    return snapshot.value != null ? User.fromJson(Map<String, dynamic>.from(snapshot.value[id])) : null;
  }

  void updateBalanceById(BigInt userID, int toSet){
    reference.child(Fields.USER_TABLE).child(userID.toString()).child(Fields.BALANCE).set(toSet);
  }

  void updateLastLevelById(BigInt userID, int toSet){
    reference.child(Fields.USER_TABLE).child(userID.toString()).child(Fields.LAST_LEVEL).set(toSet);
  }
}