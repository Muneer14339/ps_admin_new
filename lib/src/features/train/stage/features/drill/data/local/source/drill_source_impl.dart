import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/local/service/drill_db_helper.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/local/source/drill_source.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';

@Injectable(as: DrillSource)
class DrillSourceImpl implements DrillSource {
  final DrillDbHelper _drillLocalServie = DrillDbHelper();

  @override
  Future<DrillsModel?> addNewDrill(String userId, DrillsEntity newDrill) {
    return _drillLocalServie.addNewDrill(userId, newDrill);
  }

  @override
  Future<List<Map<String, dynamic>>> getDrillsForUser(String userId) {
    return _drillLocalServie.getDrillsForUser(userId);
  }

  @override
  Future<void> removeDrill(int drillId, String userId) {
    return _drillLocalServie.removeDrill(drillId, userId);
  }

  @override
  Future<void> updateDrillinStage(
      String userId, Map<String, dynamic> newDrill) {
    return _drillLocalServie.updateDrillinStage(userId, newDrill);
  }
}
