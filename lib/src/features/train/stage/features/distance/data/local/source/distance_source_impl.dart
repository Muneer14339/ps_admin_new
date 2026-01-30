import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/train/stage/features/distance/data/local/service/distance_db_helper.dart';

import 'distance_source.dart';

@Injectable(as: DistanceSource)
class DistanceSourceImpl implements DistanceSource {
  @override
  Future<void> updateDistanceinStage(String userId, String distance) {
    return DistanceDbHelper().updateDistanceinStage(userId, distance);
  }
}
