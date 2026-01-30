part of 'rtsp_streaming_bloc.dart';

@freezed
class RtspStreamingEvent with _$RtspStreamingEvent {

  const factory RtspStreamingEvent.started(int streamMode,int distance,bool withCable) = _Started;
  const factory RtspStreamingEvent.setFovOptionsEvent(String val , bool isReset) = _SetFovOptionsEvent;
  const factory RtspStreamingEvent.setLightFreqEvent(String val) = _SetLightFreqEvent;
  const factory RtspStreamingEvent.setIsoOptionsEvent(String val) = _SetIsoOptionsEvent;
  const factory RtspStreamingEvent.setEvOptionsEvent(String val) = _SetEvOptionsEvent;
  const factory RtspStreamingEvent.setVideoResolutionsEvent(String val) = _SetVideoResolutionsEvent;
  const factory RtspStreamingEvent.disposeBloc(bool onDisposeSessions) = _DisposeBloc;
  const factory RtspStreamingEvent.startStreaming(bool withCable) = _StartStreaming;
  const factory RtspStreamingEvent.socketConnectEvent() = _SocketConnectEvent;
  const factory RtspStreamingEvent.startFrameProcessing() = _StartFrameProcessing;
  const factory RtspStreamingEvent.detectCircleProcessingEvent() = _DetectCircleProcessingEvent;
  const factory RtspStreamingEvent.stopCircleDetection() = _StopCircleDetection;

}
