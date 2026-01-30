import 'package:injectable/injectable.dart';
import '../repository/stage_repository.dart';

@injectable
class Stagecase {
  Stagecase(this._repository);

  final StageRepository _repository;

  Future<void> getStageForUser(String userId) {
    return _repository.getStageForUser(userId);
  }
}
