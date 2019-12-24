import 'package:firebase_database/firebase_database.dart';
import 'package:game/model/entity/results.dart';

import 'Fields.dart';

class FirebaseRecordsDao {
  final DatabaseReference reference = FirebaseDatabase.instance.reference();

  void create(Results results, BigInt userID) {
    print(results.level);
    reference.child(Fields.RECORDS_TABLE).child(userID.toString());
    reference
        .child(Fields.RECORDS_TABLE)
        .child(userID.toString())
        .child(results.level.toString())
        .child(Fields.MOVES)
        .set(results.moves);
    reference
        .child(Fields.RECORDS_TABLE)
        .child(userID.toString())
        .child(results.level.toString())
        .child(Fields.LEVEL)
        .set(results.level);
  }

  Future<Results> findByUserIdAndLevelNum(String userID, int levelNum) async {
    DataSnapshot snapshot = await reference
        .child(Fields.RECORDS_TABLE)
        .child(userID).once();
      try{
         return Results.fromJson(Map<String, dynamic>.from(snapshot.value[levelNum]));
      } catch(e){
        print(e);
        return null;
      }
  }
}
