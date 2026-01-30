import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/local/source/drill_source.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/domain/repository/drill_repository.dart';
import '../model/drills_entity.dart';

@Injectable(as: DrillRepository)
class DrillRepositoryImpl implements DrillRepository {
  DrillRepositoryImpl(this._drillSource);
  final DrillSource _drillSource;

  @override
  Future<Either<DrillsModel?, String>> addNewDrill(
      String userId, DrillsEntity newDrill) async {
    try {
      final result = await _drillSource.addNewDrill(userId, newDrill);
      return left(result);
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<Either<List<Map<String, dynamic>>, String>> getDrillsForUser(
      String userId) async {
    try {
      final result = await _drillSource.getDrillsForUser(userId);
      return left(result);
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<void> removeDrill(int drillId, String userId) {
    return _drillSource.removeDrill(drillId, userId);
  }

  @override
  Future<void> updateDrillinStage(
      String userId, Map<String, dynamic> newDrill) {
    return _drillSource.updateDrillinStage(userId, newDrill);
  }
}
