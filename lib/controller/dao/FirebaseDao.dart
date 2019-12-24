import 'package:firebase_database/firebase_database.dart';
import 'package:game/model/entity/User.dart';

class FirebaseUserDao{
  final DatabaseReference reference = FirebaseDatabase.instance.reference();
  void create(String id){
    reference.child("user").child(id);
    reference.child("user").child(id).child("id").set(id);
    reference.child("user").child(id).child("balance").set(100);
    reference.child("user").child(id).child("lastlevel").set(1);//todo transfer fields to Fields.dart
  }
  Future<User> findById(String id) async {
    DataSnapshot snapshot = await reference.child("user").orderByChild("id").equalTo(id).once();
    return snapshot.value != null ? User.fromJson(Map<String, dynamic>.from(snapshot.value[id])) : null;
  }

  void updateBalanceById(BigInt userID, int toSet){
    reference.child("user").child(userID.toString()).child("balance").set(toSet);
  }

  void updateLastLevelById(BigInt userID, int toSet){
    reference.child("user").child(userID.toString()).child("lastlevel").set(toSet);
  }
}