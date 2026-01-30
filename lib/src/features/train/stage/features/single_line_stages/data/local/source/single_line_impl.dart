import 'package:injectable/injectable.dart';

import '../service/singleline_db_helper.dart';
import 'single_line_source.dart';

@Injectable(as: SingleLineSource)
class SingleLineImpl implements SingleLineSource {
  @override
  Future<void> updateAimSyncinStage(String userId, String aimSync) {
    return SingleLineStagesHelper().updateAimSyncinStage(userId, aimSync);
  }

  @override
  Future<void> updateDominentHandinStage(String userId, String dominantHand) {
    return SingleLineStagesHelper()
        .updateDominantHandStage(userId, dominantHand);
  }

  @override
  Future<void> updateMountLocationinStage(String userId, String mountLocation) {
    return SingleLineStagesHelper()
        .updateMountLocationinStage(userId, mountLocation);
  }

  @override
  Future<void> updateVanueinStage(String userId, String vanue) {
    return SingleLineStagesHelper().updateVanueinStage(userId, vanue);
  }
}
