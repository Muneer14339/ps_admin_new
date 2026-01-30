part of 'camera_wifi_bloc.dart';

@freezed
class CameraWifiState with _$CameraWifiState {
  const factory CameraWifiState.initial() = Initial;
  const factory CameraWifiState.loading() = Loading;
  const factory CameraWifiState.disConnectedCam() = DisConnectedCam;
  const factory CameraWifiState.loaded(List<WiFiAccessPoint?> networks) =
      Loaded;
  const factory CameraWifiState.error(String message) = Error;
  const factory CameraWifiState.connected(String ssid) = Connected;
  // const factory CameraWifiState.connectedSSID(String ssid) =
  //     ConnectedSSID; // New state
}
