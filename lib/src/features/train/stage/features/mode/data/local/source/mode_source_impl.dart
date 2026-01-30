import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/train/stage/features/mode/data/local/service/mode_db_helper.dart';
import 'package:pa_sreens/src/features/train/stage/features/mode/data/local/source/mode_source.dart';

@Injectable(as: ModeSource)
class ModelSourceImpl implements ModeSource {
  @override
  Future<void> updateModeinStage(String userId, Map<String, dynamic> mode) {
    return ModeDbHelper().updateModeinStage(userId, mode);
  }
}
