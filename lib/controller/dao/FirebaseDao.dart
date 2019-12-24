import 'package:firebase_database/firebase_database.dart';
import 'package:game/model/entity/User.dart';

class FirebaseUserDao{
  final DatabaseReference reference = FirebaseDatabase.instance.reference();
  void create(String id){
    reference.child("user").child(id);
    reference.child("user").child(id).child("id").set(id);
    reference.child("user").child(id).child("balance").set(101);
    reference.child("user").child(id).child("lastlevel").set(1);
  }
  Future<User> findById(String id) async {
    DataSnapshot snapshot = await reference.child("user").orderByChild("id").equalTo(id).once();
    return User.fromJson(Map<String, dynamic>.from(snapshot.value[id]));
  }

  void updateBalanceById(BigInt userID, int toSet){
    reference.child("user").child(userID.toString()).child("balance").set(toSet);
  }
}