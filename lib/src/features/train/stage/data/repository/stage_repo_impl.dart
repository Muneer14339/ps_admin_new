import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/train/stage/data/local/source/stage_source.dart';
import '../../domain/repository/stage_repository.dart';
import '../model/stage_entity.dart';

@Injectable(as: StageRepository)
class StageRepositoryImpl implements StageRepository {
  StageRepositoryImpl(this._stageSource);
  final StageSource _stageSource;

  @override
  Future<StageEntity?> getStageForUser(String userId) {
    return _stageSource.getStageForUser(userId);
  }
}
