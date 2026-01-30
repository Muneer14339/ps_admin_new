import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/train/stage/features/mode/data/local/source/mode_source.dart';

import '../../domain/repository/mode_repository.dart';

@Injectable(as: ModeRepository)
class ModeRepositoryImpl implements ModeRepository {
  ModeRepositoryImpl(this._modeSource);
  final ModeSource _modeSource;

  @override
  Future<void> updateModeinStage(String userId, Map<String, dynamic> mode) {
    return _modeSource.updateModeinStage(userId, mode);
  }
}
