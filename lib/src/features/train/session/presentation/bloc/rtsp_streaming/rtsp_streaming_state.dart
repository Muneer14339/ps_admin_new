
part of 'rtsp_streaming_bloc.dart';

@freezed
class RtspStreamingState with _$RtspStreamingState {
  const factory RtspStreamingState.initial({

    @Default(false) bool isLoading,
    @Default(false) bool isFovLoading,
    @Default(false) bool  isPauseStream,
    @Default(false) bool  isStreamDisposed,
    @Default(false) bool  onDisposeSessions,
    @Default(false) bool  isSimpleStream,
    @Default(false) bool  isReSetting,


    @Default('') String error,

    @Default('none') String streamState,
    @Default('Open stream') String startText,
    @Default('') String batteryP,

}) = _Initial;
}
