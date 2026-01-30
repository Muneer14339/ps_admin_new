import '../../model/drills_entity.dart';

abstract class DrillSource {
  Future<DrillsModel?> addNewDrill(String userId, DrillsEntity newDrill);
  //---------
  Future<void> updateDrillinStage(String userId, Map<String, dynamic> newDrill);
  //---------
  Future<List<Map<String, dynamic>>> getDrillsForUser(String userId);
  //---------
  Future<void> removeDrill(int drillId, String userId);
  //---------
}
