part of 'camera_wifi_bloc.dart';

@freezed
class CameraWifiEvent with _$CameraWifiEvent {
  const factory CameraWifiEvent.loadWifiNetworks() = LoadWifiNetworks;
  const factory CameraWifiEvent.onDisConnectedCam() = OnDisConnectedCam;
  const factory CameraWifiEvent.connectWithWire() = ConnectWithWire;
  const factory CameraWifiEvent.disconnectRtspCamera(bool isWireEnable) = DisconnectRtspCamera;
  const factory CameraWifiEvent.connectToWifi(String ssid,{String? passphrase}) = ConnectToWifi;
  const factory CameraWifiEvent.connectToWifiBackGround() = ConnectToWifiBackGround;
  const factory CameraWifiEvent.getConnectedSSID() = GetConnectedSSID;

}
