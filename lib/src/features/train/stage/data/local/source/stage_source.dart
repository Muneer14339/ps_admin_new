import '../../model/stage_entity.dart';

abstract class StageSource {
  //---------
  Future<StageEntity?> getStageForUser(String userId);
}
