import 'package:injectable/injectable.dart';
import '../../domain/repository/distance_repository.dart';
import '../local/source/distance_source.dart';

@Injectable(as: DistanceRepository)
class DistanceRepositoryImpl implements DistanceRepository {
  DistanceRepositoryImpl(this._distanceSource);
  final DistanceSource _distanceSource;

  @override
  Future<void> updateDistanceinStage(String userId, String distance) {
    return _distanceSource.updateDistanceinStage(userId, distance);
  }
}
