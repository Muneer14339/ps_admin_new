part of 'sho_qdata_bloc.dart';

@freezed
sealed class ShoQdataEvent with _$ShoQdataEvent {
  const factory ShoQdataEvent.connect() = Connect;
  const factory ShoQdataEvent.sendData(Map<String, dynamic> sessionData) = SendData;
  const factory ShoQdataEvent.clearData() = ClearData; // 👈 new

  // Internal events (not exported)
  const factory ShoQdataEvent.wsFrame(String data) = _WsFrame;
  const factory ShoQdataEvent.wsClosed() = _WsClosed;
  const factory ShoQdataEvent.wsError(String error) = _WsError;
}
