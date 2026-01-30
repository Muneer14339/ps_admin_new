part of 'app_ble_device_bloc.dart';

@freezed
class AppBleDeviceEvent with _$AppBleDeviceEvent {
  const factory AppBleDeviceEvent.initializeBluetooth() = InitializeBluetooth;

  const factory AppBleDeviceEvent.startScanning() = StartScanning;
  const factory AppBleDeviceEvent.stopScanning() = StopScanning;
  const factory AppBleDeviceEvent.sendCommand( int ditCommand, int dvcCommand, int swdCommand, int swbdCommand) = SendCommand;
  const factory AppBleDeviceEvent.sendCommandSingle( int pfi) = SendCommandSingle;
  const factory AppBleDeviceEvent.deviceDiscovered(BluetoothDevice device) =
      DeviceDiscovered;
  const factory AppBleDeviceEvent.connectToDevice(BluetoothDevice device) =
      ConnectToDevice;
  const factory AppBleDeviceEvent.backgroundConnectToBLEDevice() =
  BackgroundConnectToBLEDevice;
  const factory AppBleDeviceEvent.getConnectedDevice() = GetConnectedDevice;
  const factory AppBleDeviceEvent.disconnectDevice(BluetoothDevice device) =
      DisconnectDevice;
  const factory AppBleDeviceEvent.listenToConnectionStateChanges() =
      ListenToConnectionStateChanges;
  const factory AppBleDeviceEvent.scanTimeout() = ScanTimeout;
  const factory AppBleDeviceEvent.checkBluetoothStatus() = CheckBluetoothStatus;

  const factory AppBleDeviceEvent.discoverServices(BluetoothDevice device) =
      DiscoverServices;
  const factory AppBleDeviceEvent.listenToCharacteristic(
      BluetoothCharacteristic characteristic) = ListenToCharacteristic;

  const factory AppBleDeviceEvent.startListening() = StartListening;

  const factory AppBleDeviceEvent.stopListening(bool isListen) = StopListening;

  const factory AppBleDeviceEvent.signalReceived() = SignalReceived;
}
