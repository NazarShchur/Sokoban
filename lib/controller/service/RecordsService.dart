import 'package:game/controller/dao/FirebaseRecordsDao.dart';
import 'package:game/controller/service/UserService.dart';
import 'package:game/model/entity/User.dart';
import 'package:game/model/entity/results.dart';

class RecordsService{
  Future<void> saveRecordIfBestForThisPlayer(Results results, BigInt userId)async{
    FirebaseRecordsDao dao = FirebaseRecordsDao();
    Results res = await dao.findByUserIdAndLevelNum(userId.toString(), results.level);
    if(res == null || res.moves > results.moves){
     dao.create(results, userId);
    }
  }
  Future<Results> getRecordsForUserLevel(BigInt userId, int levelNum) async{
    return (await FirebaseRecordsDao().findByUserIdAndLevelNum(userId.toString(), levelNum))??Results(-1);
  }
}