part of 'sho_qdata_bloc.dart';

@freezed
class ShoQdataState with _$ShoQdataState {
  const factory ShoQdataState.initial() = Initial;
  const factory ShoQdataState.connected() = Connected;
  const factory ShoQdataState.loading() = Loading;
  const factory ShoQdataState.success(Map<String, dynamic> analysis) = Success;

  const factory ShoQdataState.error(String message) = Error;
}
