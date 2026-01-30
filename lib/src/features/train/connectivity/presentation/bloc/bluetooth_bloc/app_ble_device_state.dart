part of 'app_ble_device_bloc.dart';

@freezed
class AppBleDeviceState with _$AppBleDeviceState {
  const factory AppBleDeviceState.initial() = Initial;
  const factory AppBleDeviceState.scanning(
      List<BluetoothDevice> devices, bool isTimerStoped) = Scanning;

  const factory AppBleDeviceState.error(String message) = Error;
  const factory AppBleDeviceState.isScanning(bool isScanning) = IsScanning;
  const factory AppBleDeviceState.isConnecting(bool isConnecting) =
      IsConnecting;
  const factory AppBleDeviceState.connected(BluetoothDevice device) = Connected;
  const factory AppBleDeviceState.getConnected() = GetConnected;
  const factory AppBleDeviceState.deviceIsDisconnected() = DeviceIsDisconnected;
  const factory AppBleDeviceState.bluetoothStatus(bool isOn) = BluetoothStatus;

  const factory AppBleDeviceState.servicesDiscovered(
          BluetoothDevice device, List<BluetoothService> services) =
      ServicesDiscovered;
  const factory AppBleDeviceState.characteristicListening(
      BluetoothCharacteristic characteristic) = CharacteristicListening;
  const factory AppBleDeviceState.listeningActive(bool isActive) =
      ListeningActive;

  const factory AppBleDeviceState.counterUpdated(int counter) = CounterUpdated;
}
