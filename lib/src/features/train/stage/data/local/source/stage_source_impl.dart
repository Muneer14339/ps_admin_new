import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/train/stage/data/local/service/stage_db_helper.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';

import 'stage_source.dart';

@Injectable(as: StageSource)
class DistanceSourceImpl implements StageSource {
  @override
  Future<StageEntity?> getStageForUser(String userId) {
    return StageDbHelper().getStageForUser(userId);
  }
}
