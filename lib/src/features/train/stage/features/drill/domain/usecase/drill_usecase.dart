import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/drills_entity.dart';
import '../repository/drill_repository.dart';

@injectable
class DrillUsecase {
  DrillUsecase(this._drillRepository);

  final DrillRepository _drillRepository;

  Future<Either<DrillsModel?, String>> addNewDrill(
      String userId, DrillsEntity newDrill) {
    return _drillRepository.addNewDrill(userId, newDrill);
  }

  Future<Either<List<Map<String, dynamic>>, String>> getDrillsForUser(
      String userId) {
    return _drillRepository.getDrillsForUser(userId);
  }

  Future<void> removeDrill(int drillId, String userId) {
    return _drillRepository.removeDrill(drillId, userId);
  }

  Future<void> updateDrillinStage(
      String userId, Map<String, dynamic> newDrill) {
    return _drillRepository.updateDrillinStage(userId, newDrill);
  }
}
