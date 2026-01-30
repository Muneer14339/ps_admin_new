import 'package:dartz/dartz.dart';

import '../../data/model/drills_entity.dart';

abstract class DrillRepository {
  Future<Either<DrillsModel?, String>> addNewDrill(
      String userId, DrillsEntity newDrill);
  //---------
  Future<void> updateDrillinStage(String userId, Map<String, dynamic> newDrill);
  //---------
  Future<Either<List<Map<String, dynamic>>, String>> getDrillsForUser(
      String userId);
  //---------
  Future<void> removeDrill(int drillId, String userId);
  //---------
}
