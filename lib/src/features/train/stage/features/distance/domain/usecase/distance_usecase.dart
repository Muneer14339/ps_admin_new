import 'package:injectable/injectable.dart';
import '../repository/distance_repository.dart';

@injectable
class DistanceUsecase {
  DistanceUsecase(this._distanceRepository);

  final DistanceRepository _distanceRepository;

  Future<void> updateDistanceinStage(String userId, String distance) {
    return _distanceRepository.updateDistanceinStage(userId, distance);
  }
}
