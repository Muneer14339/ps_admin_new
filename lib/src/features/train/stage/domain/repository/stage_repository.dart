import '../../data/model/stage_entity.dart';

abstract class StageRepository {
  Future<StageEntity?> getStageForUser(String userId);
}
