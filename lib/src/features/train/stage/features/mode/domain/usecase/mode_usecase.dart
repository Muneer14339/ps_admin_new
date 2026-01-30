import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/train/stage/features/mode/domain/repository/mode_repository.dart';

@injectable
class ModeUsecase {
  ModeUsecase(this._modeRepository);

  final ModeRepository _modeRepository;

  Future<void> updateModeinStage(String userId, Map<String, dynamic> mode) {
    return _modeRepository.updateModeinStage(userId, mode);
  }
}
