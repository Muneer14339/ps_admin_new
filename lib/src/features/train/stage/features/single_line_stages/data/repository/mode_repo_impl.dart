import 'package:injectable/injectable.dart';
import '../../domain/repository/mode_repository.dart';
import '../local/source/single_line_source.dart';

@Injectable(as: SingleLineRepository)
class SingleLineRepositoryImpl implements SingleLineRepository {
  SingleLineRepositoryImpl(this._singleLineSource);
  final SingleLineSource _singleLineSource;

  @override
  Future<void> updateMountLocationinStage(String userId, String mountLocation) {
    return _singleLineSource.updateMountLocationinStage(userId, mountLocation);
  }

  @override
  Future<void> updateVanueinStage(String userId, String vanue) {
    return _singleLineSource.updateVanueinStage(userId, vanue);
  }

  @override
  Future<void> updatedominantHandStage(String userId, String dominantHand) {
    return _singleLineSource.updateDominentHandinStage(userId, dominantHand);
  }

  @override
  Future<void> updateAimSyncinStage(String userId, String aimSync) {
    return _singleLineSource.updateAimSyncinStage(userId, aimSync);
  }
}
