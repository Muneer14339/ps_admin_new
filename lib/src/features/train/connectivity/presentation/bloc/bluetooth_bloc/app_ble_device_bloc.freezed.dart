// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_ble_device_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppBleDeviceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBleDeviceEventCopyWith<$Res> {
  factory $AppBleDeviceEventCopyWith(
    AppBleDeviceEvent value,
    $Res Function(AppBleDeviceEvent) then,
  ) = _$AppBleDeviceEventCopyWithImpl<$Res, AppBleDeviceEvent>;
}

/// @nodoc
class _$AppBleDeviceEventCopyWithImpl<$Res, $Val extends AppBleDeviceEvent>
    implements $AppBleDeviceEventCopyWith<$Res> {
  _$AppBleDeviceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeBluetoothImplCopyWith<$Res> {
  factory _$$InitializeBluetoothImplCopyWith(
    _$InitializeBluetoothImpl value,
    $Res Function(_$InitializeBluetoothImpl) then,
  ) = __$$InitializeBluetoothImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeBluetoothImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$InitializeBluetoothImpl>
    implements _$$InitializeBluetoothImplCopyWith<$Res> {
  __$$InitializeBluetoothImplCopyWithImpl(
    _$InitializeBluetoothImpl _value,
    $Res Function(_$InitializeBluetoothImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeBluetoothImpl implements InitializeBluetooth {
  const _$InitializeBluetoothImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.initializeBluetooth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeBluetoothImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return initializeBluetooth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return initializeBluetooth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (initializeBluetooth != null) {
      return initializeBluetooth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return initializeBluetooth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return initializeBluetooth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (initializeBluetooth != null) {
      return initializeBluetooth(this);
    }
    return orElse();
  }
}

abstract class InitializeBluetooth implements AppBleDeviceEvent {
  const factory InitializeBluetooth() = _$InitializeBluetoothImpl;
}

/// @nodoc
abstract class _$$StartScanningImplCopyWith<$Res> {
  factory _$$StartScanningImplCopyWith(
    _$StartScanningImpl value,
    $Res Function(_$StartScanningImpl) then,
  ) = __$$StartScanningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartScanningImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$StartScanningImpl>
    implements _$$StartScanningImplCopyWith<$Res> {
  __$$StartScanningImplCopyWithImpl(
    _$StartScanningImpl _value,
    $Res Function(_$StartScanningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartScanningImpl implements StartScanning {
  const _$StartScanningImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.startScanning()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartScanningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return startScanning();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return startScanning?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (startScanning != null) {
      return startScanning();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return startScanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return startScanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (startScanning != null) {
      return startScanning(this);
    }
    return orElse();
  }
}

abstract class StartScanning implements AppBleDeviceEvent {
  const factory StartScanning() = _$StartScanningImpl;
}

/// @nodoc
abstract class _$$StopScanningImplCopyWith<$Res> {
  factory _$$StopScanningImplCopyWith(
    _$StopScanningImpl value,
    $Res Function(_$StopScanningImpl) then,
  ) = __$$StopScanningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopScanningImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$StopScanningImpl>
    implements _$$StopScanningImplCopyWith<$Res> {
  __$$StopScanningImplCopyWithImpl(
    _$StopScanningImpl _value,
    $Res Function(_$StopScanningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopScanningImpl implements StopScanning {
  const _$StopScanningImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.stopScanning()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopScanningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return stopScanning();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return stopScanning?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (stopScanning != null) {
      return stopScanning();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return stopScanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return stopScanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (stopScanning != null) {
      return stopScanning(this);
    }
    return orElse();
  }
}

abstract class StopScanning implements AppBleDeviceEvent {
  const factory StopScanning() = _$StopScanningImpl;
}

/// @nodoc
abstract class _$$SendCommandImplCopyWith<$Res> {
  factory _$$SendCommandImplCopyWith(
    _$SendCommandImpl value,
    $Res Function(_$SendCommandImpl) then,
  ) = __$$SendCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int ditCommand, int dvcCommand, int swdCommand, int swbdCommand});
}

/// @nodoc
class __$$SendCommandImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$SendCommandImpl>
    implements _$$SendCommandImplCopyWith<$Res> {
  __$$SendCommandImplCopyWithImpl(
    _$SendCommandImpl _value,
    $Res Function(_$SendCommandImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ditCommand = null,
    Object? dvcCommand = null,
    Object? swdCommand = null,
    Object? swbdCommand = null,
  }) {
    return _then(
      _$SendCommandImpl(
        null == ditCommand
            ? _value.ditCommand
            : ditCommand // ignore: cast_nullable_to_non_nullable
                as int,
        null == dvcCommand
            ? _value.dvcCommand
            : dvcCommand // ignore: cast_nullable_to_non_nullable
                as int,
        null == swdCommand
            ? _value.swdCommand
            : swdCommand // ignore: cast_nullable_to_non_nullable
                as int,
        null == swbdCommand
            ? _value.swbdCommand
            : swbdCommand // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$SendCommandImpl implements SendCommand {
  const _$SendCommandImpl(
    this.ditCommand,
    this.dvcCommand,
    this.swdCommand,
    this.swbdCommand,
  );

  @override
  final int ditCommand;
  @override
  final int dvcCommand;
  @override
  final int swdCommand;
  @override
  final int swbdCommand;

  @override
  String toString() {
    return 'AppBleDeviceEvent.sendCommand(ditCommand: $ditCommand, dvcCommand: $dvcCommand, swdCommand: $swdCommand, swbdCommand: $swbdCommand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCommandImpl &&
            (identical(other.ditCommand, ditCommand) ||
                other.ditCommand == ditCommand) &&
            (identical(other.dvcCommand, dvcCommand) ||
                other.dvcCommand == dvcCommand) &&
            (identical(other.swdCommand, swdCommand) ||
                other.swdCommand == swdCommand) &&
            (identical(other.swbdCommand, swbdCommand) ||
                other.swbdCommand == swbdCommand));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ditCommand, dvcCommand, swdCommand, swbdCommand);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCommandImplCopyWith<_$SendCommandImpl> get copyWith =>
      __$$SendCommandImplCopyWithImpl<_$SendCommandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return sendCommand(ditCommand, dvcCommand, swdCommand, swbdCommand);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return sendCommand?.call(ditCommand, dvcCommand, swdCommand, swbdCommand);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (sendCommand != null) {
      return sendCommand(ditCommand, dvcCommand, swdCommand, swbdCommand);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return sendCommand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return sendCommand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (sendCommand != null) {
      return sendCommand(this);
    }
    return orElse();
  }
}

abstract class SendCommand implements AppBleDeviceEvent {
  const factory SendCommand(
    final int ditCommand,
    final int dvcCommand,
    final int swdCommand,
    final int swbdCommand,
  ) = _$SendCommandImpl;

  int get ditCommand;
  int get dvcCommand;
  int get swdCommand;
  int get swbdCommand;

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCommandImplCopyWith<_$SendCommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendCommandSingleImplCopyWith<$Res> {
  factory _$$SendCommandSingleImplCopyWith(
    _$SendCommandSingleImpl value,
    $Res Function(_$SendCommandSingleImpl) then,
  ) = __$$SendCommandSingleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int pfi});
}

/// @nodoc
class __$$SendCommandSingleImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$SendCommandSingleImpl>
    implements _$$SendCommandSingleImplCopyWith<$Res> {
  __$$SendCommandSingleImplCopyWithImpl(
    _$SendCommandSingleImpl _value,
    $Res Function(_$SendCommandSingleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pfi = null}) {
    return _then(
      _$SendCommandSingleImpl(
        null == pfi
            ? _value.pfi
            : pfi // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$SendCommandSingleImpl implements SendCommandSingle {
  const _$SendCommandSingleImpl(this.pfi);

  @override
  final int pfi;

  @override
  String toString() {
    return 'AppBleDeviceEvent.sendCommandSingle(pfi: $pfi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCommandSingleImpl &&
            (identical(other.pfi, pfi) || other.pfi == pfi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pfi);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCommandSingleImplCopyWith<_$SendCommandSingleImpl> get copyWith =>
      __$$SendCommandSingleImplCopyWithImpl<_$SendCommandSingleImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return sendCommandSingle(pfi);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return sendCommandSingle?.call(pfi);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (sendCommandSingle != null) {
      return sendCommandSingle(pfi);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return sendCommandSingle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return sendCommandSingle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (sendCommandSingle != null) {
      return sendCommandSingle(this);
    }
    return orElse();
  }
}

abstract class SendCommandSingle implements AppBleDeviceEvent {
  const factory SendCommandSingle(final int pfi) = _$SendCommandSingleImpl;

  int get pfi;

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCommandSingleImplCopyWith<_$SendCommandSingleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceDiscoveredImplCopyWith<$Res> {
  factory _$$DeviceDiscoveredImplCopyWith(
    _$DeviceDiscoveredImpl value,
    $Res Function(_$DeviceDiscoveredImpl) then,
  ) = __$$DeviceDiscoveredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class __$$DeviceDiscoveredImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$DeviceDiscoveredImpl>
    implements _$$DeviceDiscoveredImplCopyWith<$Res> {
  __$$DeviceDiscoveredImplCopyWithImpl(
    _$DeviceDiscoveredImpl _value,
    $Res Function(_$DeviceDiscoveredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? device = null}) {
    return _then(
      _$DeviceDiscoveredImpl(
        null == device
            ? _value.device
            : device // ignore: cast_nullable_to_non_nullable
                as BluetoothDevice,
      ),
    );
  }
}

/// @nodoc

class _$DeviceDiscoveredImpl implements DeviceDiscovered {
  const _$DeviceDiscoveredImpl(this.device);

  @override
  final BluetoothDevice device;

  @override
  String toString() {
    return 'AppBleDeviceEvent.deviceDiscovered(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDiscoveredImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceDiscoveredImplCopyWith<_$DeviceDiscoveredImpl> get copyWith =>
      __$$DeviceDiscoveredImplCopyWithImpl<_$DeviceDiscoveredImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return deviceDiscovered(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return deviceDiscovered?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (deviceDiscovered != null) {
      return deviceDiscovered(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return deviceDiscovered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return deviceDiscovered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (deviceDiscovered != null) {
      return deviceDiscovered(this);
    }
    return orElse();
  }
}

abstract class DeviceDiscovered implements AppBleDeviceEvent {
  const factory DeviceDiscovered(final BluetoothDevice device) =
      _$DeviceDiscoveredImpl;

  BluetoothDevice get device;

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceDiscoveredImplCopyWith<_$DeviceDiscoveredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectToDeviceImplCopyWith<$Res> {
  factory _$$ConnectToDeviceImplCopyWith(
    _$ConnectToDeviceImpl value,
    $Res Function(_$ConnectToDeviceImpl) then,
  ) = __$$ConnectToDeviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class __$$ConnectToDeviceImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$ConnectToDeviceImpl>
    implements _$$ConnectToDeviceImplCopyWith<$Res> {
  __$$ConnectToDeviceImplCopyWithImpl(
    _$ConnectToDeviceImpl _value,
    $Res Function(_$ConnectToDeviceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? device = null}) {
    return _then(
      _$ConnectToDeviceImpl(
        null == device
            ? _value.device
            : device // ignore: cast_nullable_to_non_nullable
                as BluetoothDevice,
      ),
    );
  }
}

/// @nodoc

class _$ConnectToDeviceImpl implements ConnectToDevice {
  const _$ConnectToDeviceImpl(this.device);

  @override
  final BluetoothDevice device;

  @override
  String toString() {
    return 'AppBleDeviceEvent.connectToDevice(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectToDeviceImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectToDeviceImplCopyWith<_$ConnectToDeviceImpl> get copyWith =>
      __$$ConnectToDeviceImplCopyWithImpl<_$ConnectToDeviceImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return connectToDevice(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return connectToDevice?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (connectToDevice != null) {
      return connectToDevice(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return connectToDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return connectToDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (connectToDevice != null) {
      return connectToDevice(this);
    }
    return orElse();
  }
}

abstract class ConnectToDevice implements AppBleDeviceEvent {
  const factory ConnectToDevice(final BluetoothDevice device) =
      _$ConnectToDeviceImpl;

  BluetoothDevice get device;

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectToDeviceImplCopyWith<_$ConnectToDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BackgroundConnectToBLEDeviceImplCopyWith<$Res> {
  factory _$$BackgroundConnectToBLEDeviceImplCopyWith(
    _$BackgroundConnectToBLEDeviceImpl value,
    $Res Function(_$BackgroundConnectToBLEDeviceImpl) then,
  ) = __$$BackgroundConnectToBLEDeviceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackgroundConnectToBLEDeviceImplCopyWithImpl<$Res>
    extends
        _$AppBleDeviceEventCopyWithImpl<
          $Res,
          _$BackgroundConnectToBLEDeviceImpl
        >
    implements _$$BackgroundConnectToBLEDeviceImplCopyWith<$Res> {
  __$$BackgroundConnectToBLEDeviceImplCopyWithImpl(
    _$BackgroundConnectToBLEDeviceImpl _value,
    $Res Function(_$BackgroundConnectToBLEDeviceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BackgroundConnectToBLEDeviceImpl
    implements BackgroundConnectToBLEDevice {
  const _$BackgroundConnectToBLEDeviceImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.backgroundConnectToBLEDevice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackgroundConnectToBLEDeviceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return backgroundConnectToBLEDevice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return backgroundConnectToBLEDevice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (backgroundConnectToBLEDevice != null) {
      return backgroundConnectToBLEDevice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return backgroundConnectToBLEDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return backgroundConnectToBLEDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (backgroundConnectToBLEDevice != null) {
      return backgroundConnectToBLEDevice(this);
    }
    return orElse();
  }
}

abstract class BackgroundConnectToBLEDevice implements AppBleDeviceEvent {
  const factory BackgroundConnectToBLEDevice() =
      _$BackgroundConnectToBLEDeviceImpl;
}

/// @nodoc
abstract class _$$GetConnectedDeviceImplCopyWith<$Res> {
  factory _$$GetConnectedDeviceImplCopyWith(
    _$GetConnectedDeviceImpl value,
    $Res Function(_$GetConnectedDeviceImpl) then,
  ) = __$$GetConnectedDeviceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetConnectedDeviceImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$GetConnectedDeviceImpl>
    implements _$$GetConnectedDeviceImplCopyWith<$Res> {
  __$$GetConnectedDeviceImplCopyWithImpl(
    _$GetConnectedDeviceImpl _value,
    $Res Function(_$GetConnectedDeviceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetConnectedDeviceImpl implements GetConnectedDevice {
  const _$GetConnectedDeviceImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.getConnectedDevice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetConnectedDeviceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return getConnectedDevice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return getConnectedDevice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (getConnectedDevice != null) {
      return getConnectedDevice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return getConnectedDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return getConnectedDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (getConnectedDevice != null) {
      return getConnectedDevice(this);
    }
    return orElse();
  }
}

abstract class GetConnectedDevice implements AppBleDeviceEvent {
  const factory GetConnectedDevice() = _$GetConnectedDeviceImpl;
}

/// @nodoc
abstract class _$$DisconnectDeviceImplCopyWith<$Res> {
  factory _$$DisconnectDeviceImplCopyWith(
    _$DisconnectDeviceImpl value,
    $Res Function(_$DisconnectDeviceImpl) then,
  ) = __$$DisconnectDeviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class __$$DisconnectDeviceImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$DisconnectDeviceImpl>
    implements _$$DisconnectDeviceImplCopyWith<$Res> {
  __$$DisconnectDeviceImplCopyWithImpl(
    _$DisconnectDeviceImpl _value,
    $Res Function(_$DisconnectDeviceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? device = null}) {
    return _then(
      _$DisconnectDeviceImpl(
        null == device
            ? _value.device
            : device // ignore: cast_nullable_to_non_nullable
                as BluetoothDevice,
      ),
    );
  }
}

/// @nodoc

class _$DisconnectDeviceImpl implements DisconnectDevice {
  const _$DisconnectDeviceImpl(this.device);

  @override
  final BluetoothDevice device;

  @override
  String toString() {
    return 'AppBleDeviceEvent.disconnectDevice(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectDeviceImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectDeviceImplCopyWith<_$DisconnectDeviceImpl> get copyWith =>
      __$$DisconnectDeviceImplCopyWithImpl<_$DisconnectDeviceImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return disconnectDevice(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return disconnectDevice?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (disconnectDevice != null) {
      return disconnectDevice(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return disconnectDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return disconnectDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (disconnectDevice != null) {
      return disconnectDevice(this);
    }
    return orElse();
  }
}

abstract class DisconnectDevice implements AppBleDeviceEvent {
  const factory DisconnectDevice(final BluetoothDevice device) =
      _$DisconnectDeviceImpl;

  BluetoothDevice get device;

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisconnectDeviceImplCopyWith<_$DisconnectDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListenToConnectionStateChangesImplCopyWith<$Res> {
  factory _$$ListenToConnectionStateChangesImplCopyWith(
    _$ListenToConnectionStateChangesImpl value,
    $Res Function(_$ListenToConnectionStateChangesImpl) then,
  ) = __$$ListenToConnectionStateChangesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ListenToConnectionStateChangesImplCopyWithImpl<$Res>
    extends
        _$AppBleDeviceEventCopyWithImpl<
          $Res,
          _$ListenToConnectionStateChangesImpl
        >
    implements _$$ListenToConnectionStateChangesImplCopyWith<$Res> {
  __$$ListenToConnectionStateChangesImplCopyWithImpl(
    _$ListenToConnectionStateChangesImpl _value,
    $Res Function(_$ListenToConnectionStateChangesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ListenToConnectionStateChangesImpl
    implements ListenToConnectionStateChanges {
  const _$ListenToConnectionStateChangesImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.listenToConnectionStateChanges()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListenToConnectionStateChangesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return listenToConnectionStateChanges();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return listenToConnectionStateChanges?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (listenToConnectionStateChanges != null) {
      return listenToConnectionStateChanges();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return listenToConnectionStateChanges(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return listenToConnectionStateChanges?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (listenToConnectionStateChanges != null) {
      return listenToConnectionStateChanges(this);
    }
    return orElse();
  }
}

abstract class ListenToConnectionStateChanges implements AppBleDeviceEvent {
  const factory ListenToConnectionStateChanges() =
      _$ListenToConnectionStateChangesImpl;
}

/// @nodoc
abstract class _$$ScanTimeoutImplCopyWith<$Res> {
  factory _$$ScanTimeoutImplCopyWith(
    _$ScanTimeoutImpl value,
    $Res Function(_$ScanTimeoutImpl) then,
  ) = __$$ScanTimeoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScanTimeoutImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$ScanTimeoutImpl>
    implements _$$ScanTimeoutImplCopyWith<$Res> {
  __$$ScanTimeoutImplCopyWithImpl(
    _$ScanTimeoutImpl _value,
    $Res Function(_$ScanTimeoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ScanTimeoutImpl implements ScanTimeout {
  const _$ScanTimeoutImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.scanTimeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScanTimeoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return scanTimeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return scanTimeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (scanTimeout != null) {
      return scanTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return scanTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return scanTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (scanTimeout != null) {
      return scanTimeout(this);
    }
    return orElse();
  }
}

abstract class ScanTimeout implements AppBleDeviceEvent {
  const factory ScanTimeout() = _$ScanTimeoutImpl;
}

/// @nodoc
abstract class _$$CheckBluetoothStatusImplCopyWith<$Res> {
  factory _$$CheckBluetoothStatusImplCopyWith(
    _$CheckBluetoothStatusImpl value,
    $Res Function(_$CheckBluetoothStatusImpl) then,
  ) = __$$CheckBluetoothStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckBluetoothStatusImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$CheckBluetoothStatusImpl>
    implements _$$CheckBluetoothStatusImplCopyWith<$Res> {
  __$$CheckBluetoothStatusImplCopyWithImpl(
    _$CheckBluetoothStatusImpl _value,
    $Res Function(_$CheckBluetoothStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckBluetoothStatusImpl implements CheckBluetoothStatus {
  const _$CheckBluetoothStatusImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.checkBluetoothStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckBluetoothStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return checkBluetoothStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return checkBluetoothStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (checkBluetoothStatus != null) {
      return checkBluetoothStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return checkBluetoothStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return checkBluetoothStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (checkBluetoothStatus != null) {
      return checkBluetoothStatus(this);
    }
    return orElse();
  }
}

abstract class CheckBluetoothStatus implements AppBleDeviceEvent {
  const factory CheckBluetoothStatus() = _$CheckBluetoothStatusImpl;
}

/// @nodoc
abstract class _$$DiscoverServicesImplCopyWith<$Res> {
  factory _$$DiscoverServicesImplCopyWith(
    _$DiscoverServicesImpl value,
    $Res Function(_$DiscoverServicesImpl) then,
  ) = __$$DiscoverServicesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class __$$DiscoverServicesImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$DiscoverServicesImpl>
    implements _$$DiscoverServicesImplCopyWith<$Res> {
  __$$DiscoverServicesImplCopyWithImpl(
    _$DiscoverServicesImpl _value,
    $Res Function(_$DiscoverServicesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? device = null}) {
    return _then(
      _$DiscoverServicesImpl(
        null == device
            ? _value.device
            : device // ignore: cast_nullable_to_non_nullable
                as BluetoothDevice,
      ),
    );
  }
}

/// @nodoc

class _$DiscoverServicesImpl implements DiscoverServices {
  const _$DiscoverServicesImpl(this.device);

  @override
  final BluetoothDevice device;

  @override
  String toString() {
    return 'AppBleDeviceEvent.discoverServices(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverServicesImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverServicesImplCopyWith<_$DiscoverServicesImpl> get copyWith =>
      __$$DiscoverServicesImplCopyWithImpl<_$DiscoverServicesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return discoverServices(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return discoverServices?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (discoverServices != null) {
      return discoverServices(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return discoverServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return discoverServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (discoverServices != null) {
      return discoverServices(this);
    }
    return orElse();
  }
}

abstract class DiscoverServices implements AppBleDeviceEvent {
  const factory DiscoverServices(final BluetoothDevice device) =
      _$DiscoverServicesImpl;

  BluetoothDevice get device;

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscoverServicesImplCopyWith<_$DiscoverServicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListenToCharacteristicImplCopyWith<$Res> {
  factory _$$ListenToCharacteristicImplCopyWith(
    _$ListenToCharacteristicImpl value,
    $Res Function(_$ListenToCharacteristicImpl) then,
  ) = __$$ListenToCharacteristicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BluetoothCharacteristic characteristic});
}

/// @nodoc
class __$$ListenToCharacteristicImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$ListenToCharacteristicImpl>
    implements _$$ListenToCharacteristicImplCopyWith<$Res> {
  __$$ListenToCharacteristicImplCopyWithImpl(
    _$ListenToCharacteristicImpl _value,
    $Res Function(_$ListenToCharacteristicImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? characteristic = null}) {
    return _then(
      _$ListenToCharacteristicImpl(
        null == characteristic
            ? _value.characteristic
            : characteristic // ignore: cast_nullable_to_non_nullable
                as BluetoothCharacteristic,
      ),
    );
  }
}

/// @nodoc

class _$ListenToCharacteristicImpl implements ListenToCharacteristic {
  const _$ListenToCharacteristicImpl(this.characteristic);

  @override
  final BluetoothCharacteristic characteristic;

  @override
  String toString() {
    return 'AppBleDeviceEvent.listenToCharacteristic(characteristic: $characteristic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListenToCharacteristicImpl &&
            (identical(other.characteristic, characteristic) ||
                other.characteristic == characteristic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characteristic);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListenToCharacteristicImplCopyWith<_$ListenToCharacteristicImpl>
  get copyWith =>
      __$$ListenToCharacteristicImplCopyWithImpl<_$ListenToCharacteristicImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return listenToCharacteristic(characteristic);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return listenToCharacteristic?.call(characteristic);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (listenToCharacteristic != null) {
      return listenToCharacteristic(characteristic);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return listenToCharacteristic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return listenToCharacteristic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (listenToCharacteristic != null) {
      return listenToCharacteristic(this);
    }
    return orElse();
  }
}

abstract class ListenToCharacteristic implements AppBleDeviceEvent {
  const factory ListenToCharacteristic(
    final BluetoothCharacteristic characteristic,
  ) = _$ListenToCharacteristicImpl;

  BluetoothCharacteristic get characteristic;

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListenToCharacteristicImplCopyWith<_$ListenToCharacteristicImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartListeningImplCopyWith<$Res> {
  factory _$$StartListeningImplCopyWith(
    _$StartListeningImpl value,
    $Res Function(_$StartListeningImpl) then,
  ) = __$$StartListeningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartListeningImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$StartListeningImpl>
    implements _$$StartListeningImplCopyWith<$Res> {
  __$$StartListeningImplCopyWithImpl(
    _$StartListeningImpl _value,
    $Res Function(_$StartListeningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartListeningImpl implements StartListening {
  const _$StartListeningImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.startListening()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartListeningImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return startListening();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return startListening?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (startListening != null) {
      return startListening();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return startListening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return startListening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (startListening != null) {
      return startListening(this);
    }
    return orElse();
  }
}

abstract class StartListening implements AppBleDeviceEvent {
  const factory StartListening() = _$StartListeningImpl;
}

/// @nodoc
abstract class _$$StopListeningImplCopyWith<$Res> {
  factory _$$StopListeningImplCopyWith(
    _$StopListeningImpl value,
    $Res Function(_$StopListeningImpl) then,
  ) = __$$StopListeningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isListen});
}

/// @nodoc
class __$$StopListeningImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$StopListeningImpl>
    implements _$$StopListeningImplCopyWith<$Res> {
  __$$StopListeningImplCopyWithImpl(
    _$StopListeningImpl _value,
    $Res Function(_$StopListeningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isListen = null}) {
    return _then(
      _$StopListeningImpl(
        null == isListen
            ? _value.isListen
            : isListen // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$StopListeningImpl implements StopListening {
  const _$StopListeningImpl(this.isListen);

  @override
  final bool isListen;

  @override
  String toString() {
    return 'AppBleDeviceEvent.stopListening(isListen: $isListen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopListeningImpl &&
            (identical(other.isListen, isListen) ||
                other.isListen == isListen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isListen);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopListeningImplCopyWith<_$StopListeningImpl> get copyWith =>
      __$$StopListeningImplCopyWithImpl<_$StopListeningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return stopListening(isListen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return stopListening?.call(isListen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (stopListening != null) {
      return stopListening(isListen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return stopListening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return stopListening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (stopListening != null) {
      return stopListening(this);
    }
    return orElse();
  }
}

abstract class StopListening implements AppBleDeviceEvent {
  const factory StopListening(final bool isListen) = _$StopListeningImpl;

  bool get isListen;

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopListeningImplCopyWith<_$StopListeningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignalReceivedImplCopyWith<$Res> {
  factory _$$SignalReceivedImplCopyWith(
    _$SignalReceivedImpl value,
    $Res Function(_$SignalReceivedImpl) then,
  ) = __$$SignalReceivedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignalReceivedImplCopyWithImpl<$Res>
    extends _$AppBleDeviceEventCopyWithImpl<$Res, _$SignalReceivedImpl>
    implements _$$SignalReceivedImplCopyWith<$Res> {
  __$$SignalReceivedImplCopyWithImpl(
    _$SignalReceivedImpl _value,
    $Res Function(_$SignalReceivedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignalReceivedImpl implements SignalReceived {
  const _$SignalReceivedImpl();

  @override
  String toString() {
    return 'AppBleDeviceEvent.signalReceived()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignalReceivedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeBluetooth,
    required TResult Function() startScanning,
    required TResult Function() stopScanning,
    required TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )
    sendCommand,
    required TResult Function(int pfi) sendCommandSingle,
    required TResult Function(BluetoothDevice device) deviceDiscovered,
    required TResult Function(BluetoothDevice device) connectToDevice,
    required TResult Function() backgroundConnectToBLEDevice,
    required TResult Function() getConnectedDevice,
    required TResult Function(BluetoothDevice device) disconnectDevice,
    required TResult Function() listenToConnectionStateChanges,
    required TResult Function() scanTimeout,
    required TResult Function() checkBluetoothStatus,
    required TResult Function(BluetoothDevice device) discoverServices,
    required TResult Function(BluetoothCharacteristic characteristic)
    listenToCharacteristic,
    required TResult Function() startListening,
    required TResult Function(bool isListen) stopListening,
    required TResult Function() signalReceived,
  }) {
    return signalReceived();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeBluetooth,
    TResult? Function()? startScanning,
    TResult? Function()? stopScanning,
    TResult? Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult? Function(int pfi)? sendCommandSingle,
    TResult? Function(BluetoothDevice device)? deviceDiscovered,
    TResult? Function(BluetoothDevice device)? connectToDevice,
    TResult? Function()? backgroundConnectToBLEDevice,
    TResult? Function()? getConnectedDevice,
    TResult? Function(BluetoothDevice device)? disconnectDevice,
    TResult? Function()? listenToConnectionStateChanges,
    TResult? Function()? scanTimeout,
    TResult? Function()? checkBluetoothStatus,
    TResult? Function(BluetoothDevice device)? discoverServices,
    TResult? Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult? Function()? startListening,
    TResult? Function(bool isListen)? stopListening,
    TResult? Function()? signalReceived,
  }) {
    return signalReceived?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeBluetooth,
    TResult Function()? startScanning,
    TResult Function()? stopScanning,
    TResult Function(
      int ditCommand,
      int dvcCommand,
      int swdCommand,
      int swbdCommand,
    )?
    sendCommand,
    TResult Function(int pfi)? sendCommandSingle,
    TResult Function(BluetoothDevice device)? deviceDiscovered,
    TResult Function(BluetoothDevice device)? connectToDevice,
    TResult Function()? backgroundConnectToBLEDevice,
    TResult Function()? getConnectedDevice,
    TResult Function(BluetoothDevice device)? disconnectDevice,
    TResult Function()? listenToConnectionStateChanges,
    TResult Function()? scanTimeout,
    TResult Function()? checkBluetoothStatus,
    TResult Function(BluetoothDevice device)? discoverServices,
    TResult Function(BluetoothCharacteristic characteristic)?
    listenToCharacteristic,
    TResult Function()? startListening,
    TResult Function(bool isListen)? stopListening,
    TResult Function()? signalReceived,
    required TResult orElse(),
  }) {
    if (signalReceived != null) {
      return signalReceived();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeBluetooth value) initializeBluetooth,
    required TResult Function(StartScanning value) startScanning,
    required TResult Function(StopScanning value) stopScanning,
    required TResult Function(SendCommand value) sendCommand,
    required TResult Function(SendCommandSingle value) sendCommandSingle,
    required TResult Function(DeviceDiscovered value) deviceDiscovered,
    required TResult Function(ConnectToDevice value) connectToDevice,
    required TResult Function(BackgroundConnectToBLEDevice value)
    backgroundConnectToBLEDevice,
    required TResult Function(GetConnectedDevice value) getConnectedDevice,
    required TResult Function(DisconnectDevice value) disconnectDevice,
    required TResult Function(ListenToConnectionStateChanges value)
    listenToConnectionStateChanges,
    required TResult Function(ScanTimeout value) scanTimeout,
    required TResult Function(CheckBluetoothStatus value) checkBluetoothStatus,
    required TResult Function(DiscoverServices value) discoverServices,
    required TResult Function(ListenToCharacteristic value)
    listenToCharacteristic,
    required TResult Function(StartListening value) startListening,
    required TResult Function(StopListening value) stopListening,
    required TResult Function(SignalReceived value) signalReceived,
  }) {
    return signalReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitializeBluetooth value)? initializeBluetooth,
    TResult? Function(StartScanning value)? startScanning,
    TResult? Function(StopScanning value)? stopScanning,
    TResult? Function(SendCommand value)? sendCommand,
    TResult? Function(SendCommandSingle value)? sendCommandSingle,
    TResult? Function(DeviceDiscovered value)? deviceDiscovered,
    TResult? Function(ConnectToDevice value)? connectToDevice,
    TResult? Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult? Function(GetConnectedDevice value)? getConnectedDevice,
    TResult? Function(DisconnectDevice value)? disconnectDevice,
    TResult? Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult? Function(ScanTimeout value)? scanTimeout,
    TResult? Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult? Function(DiscoverServices value)? discoverServices,
    TResult? Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult? Function(StartListening value)? startListening,
    TResult? Function(StopListening value)? stopListening,
    TResult? Function(SignalReceived value)? signalReceived,
  }) {
    return signalReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeBluetooth value)? initializeBluetooth,
    TResult Function(StartScanning value)? startScanning,
    TResult Function(StopScanning value)? stopScanning,
    TResult Function(SendCommand value)? sendCommand,
    TResult Function(SendCommandSingle value)? sendCommandSingle,
    TResult Function(DeviceDiscovered value)? deviceDiscovered,
    TResult Function(ConnectToDevice value)? connectToDevice,
    TResult Function(BackgroundConnectToBLEDevice value)?
    backgroundConnectToBLEDevice,
    TResult Function(GetConnectedDevice value)? getConnectedDevice,
    TResult Function(DisconnectDevice value)? disconnectDevice,
    TResult Function(ListenToConnectionStateChanges value)?
    listenToConnectionStateChanges,
    TResult Function(ScanTimeout value)? scanTimeout,
    TResult Function(CheckBluetoothStatus value)? checkBluetoothStatus,
    TResult Function(DiscoverServices value)? discoverServices,
    TResult Function(ListenToCharacteristic value)? listenToCharacteristic,
    TResult Function(StartListening value)? startListening,
    TResult Function(StopListening value)? stopListening,
    TResult Function(SignalReceived value)? signalReceived,
    required TResult orElse(),
  }) {
    if (signalReceived != null) {
      return signalReceived(this);
    }
    return orElse();
  }
}

abstract class SignalReceived implements AppBleDeviceEvent {
  const factory SignalReceived() = _$SignalReceivedImpl;
}

/// @nodoc
mixin _$AppBleDeviceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBleDeviceStateCopyWith<$Res> {
  factory $AppBleDeviceStateCopyWith(
    AppBleDeviceState value,
    $Res Function(AppBleDeviceState) then,
  ) = _$AppBleDeviceStateCopyWithImpl<$Res, AppBleDeviceState>;
}

/// @nodoc
class _$AppBleDeviceStateCopyWithImpl<$Res, $Val extends AppBleDeviceState>
    implements $AppBleDeviceStateCopyWith<$Res> {
  _$AppBleDeviceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AppBleDeviceState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AppBleDeviceState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ScanningImplCopyWith<$Res> {
  factory _$$ScanningImplCopyWith(
    _$ScanningImpl value,
    $Res Function(_$ScanningImpl) then,
  ) = __$$ScanningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BluetoothDevice> devices, bool isTimerStoped});
}

/// @nodoc
class __$$ScanningImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$ScanningImpl>
    implements _$$ScanningImplCopyWith<$Res> {
  __$$ScanningImplCopyWithImpl(
    _$ScanningImpl _value,
    $Res Function(_$ScanningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? devices = null, Object? isTimerStoped = null}) {
    return _then(
      _$ScanningImpl(
        null == devices
            ? _value._devices
            : devices // ignore: cast_nullable_to_non_nullable
                as List<BluetoothDevice>,
        null == isTimerStoped
            ? _value.isTimerStoped
            : isTimerStoped // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$ScanningImpl implements Scanning {
  const _$ScanningImpl(final List<BluetoothDevice> devices, this.isTimerStoped)
    : _devices = devices;

  final List<BluetoothDevice> _devices;
  @override
  List<BluetoothDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  final bool isTimerStoped;

  @override
  String toString() {
    return 'AppBleDeviceState.scanning(devices: $devices, isTimerStoped: $isTimerStoped)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanningImpl &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.isTimerStoped, isTimerStoped) ||
                other.isTimerStoped == isTimerStoped));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_devices),
    isTimerStoped,
  );

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanningImplCopyWith<_$ScanningImpl> get copyWith =>
      __$$ScanningImplCopyWithImpl<_$ScanningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return scanning(devices, isTimerStoped);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return scanning?.call(devices, isTimerStoped);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (scanning != null) {
      return scanning(devices, isTimerStoped);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return scanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return scanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (scanning != null) {
      return scanning(this);
    }
    return orElse();
  }
}

abstract class Scanning implements AppBleDeviceState {
  const factory Scanning(
    final List<BluetoothDevice> devices,
    final bool isTimerStoped,
  ) = _$ScanningImpl;

  List<BluetoothDevice> get devices;
  bool get isTimerStoped;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanningImplCopyWith<_$ScanningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppBleDeviceState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements AppBleDeviceState {
  const factory Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsScanningImplCopyWith<$Res> {
  factory _$$IsScanningImplCopyWith(
    _$IsScanningImpl value,
    $Res Function(_$IsScanningImpl) then,
  ) = __$$IsScanningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isScanning});
}

/// @nodoc
class __$$IsScanningImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$IsScanningImpl>
    implements _$$IsScanningImplCopyWith<$Res> {
  __$$IsScanningImplCopyWithImpl(
    _$IsScanningImpl _value,
    $Res Function(_$IsScanningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isScanning = null}) {
    return _then(
      _$IsScanningImpl(
        null == isScanning
            ? _value.isScanning
            : isScanning // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$IsScanningImpl implements IsScanning {
  const _$IsScanningImpl(this.isScanning);

  @override
  final bool isScanning;

  @override
  String toString() {
    return 'AppBleDeviceState.isScanning(isScanning: $isScanning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsScanningImpl &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isScanning);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsScanningImplCopyWith<_$IsScanningImpl> get copyWith =>
      __$$IsScanningImplCopyWithImpl<_$IsScanningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return isScanning(this.isScanning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return isScanning?.call(this.isScanning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (isScanning != null) {
      return isScanning(this.isScanning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return isScanning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return isScanning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (isScanning != null) {
      return isScanning(this);
    }
    return orElse();
  }
}

abstract class IsScanning implements AppBleDeviceState {
  const factory IsScanning(final bool isScanning) = _$IsScanningImpl;

  bool get isScanning;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsScanningImplCopyWith<_$IsScanningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsConnectingImplCopyWith<$Res> {
  factory _$$IsConnectingImplCopyWith(
    _$IsConnectingImpl value,
    $Res Function(_$IsConnectingImpl) then,
  ) = __$$IsConnectingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isConnecting});
}

/// @nodoc
class __$$IsConnectingImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$IsConnectingImpl>
    implements _$$IsConnectingImplCopyWith<$Res> {
  __$$IsConnectingImplCopyWithImpl(
    _$IsConnectingImpl _value,
    $Res Function(_$IsConnectingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isConnecting = null}) {
    return _then(
      _$IsConnectingImpl(
        null == isConnecting
            ? _value.isConnecting
            : isConnecting // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$IsConnectingImpl implements IsConnecting {
  const _$IsConnectingImpl(this.isConnecting);

  @override
  final bool isConnecting;

  @override
  String toString() {
    return 'AppBleDeviceState.isConnecting(isConnecting: $isConnecting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsConnectingImpl &&
            (identical(other.isConnecting, isConnecting) ||
                other.isConnecting == isConnecting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnecting);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsConnectingImplCopyWith<_$IsConnectingImpl> get copyWith =>
      __$$IsConnectingImplCopyWithImpl<_$IsConnectingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return isConnecting(this.isConnecting);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return isConnecting?.call(this.isConnecting);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (isConnecting != null) {
      return isConnecting(this.isConnecting);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return isConnecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return isConnecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (isConnecting != null) {
      return isConnecting(this);
    }
    return orElse();
  }
}

abstract class IsConnecting implements AppBleDeviceState {
  const factory IsConnecting(final bool isConnecting) = _$IsConnectingImpl;

  bool get isConnecting;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsConnectingImplCopyWith<_$IsConnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
    _$ConnectedImpl value,
    $Res Function(_$ConnectedImpl) then,
  ) = __$$ConnectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BluetoothDevice device});
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
    _$ConnectedImpl _value,
    $Res Function(_$ConnectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? device = null}) {
    return _then(
      _$ConnectedImpl(
        null == device
            ? _value.device
            : device // ignore: cast_nullable_to_non_nullable
                as BluetoothDevice,
      ),
    );
  }
}

/// @nodoc

class _$ConnectedImpl implements Connected {
  const _$ConnectedImpl(this.device);

  @override
  final BluetoothDevice device;

  @override
  String toString() {
    return 'AppBleDeviceState.connected(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      __$$ConnectedImplCopyWithImpl<_$ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return connected(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return connected?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class Connected implements AppBleDeviceState {
  const factory Connected(final BluetoothDevice device) = _$ConnectedImpl;

  BluetoothDevice get device;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetConnectedImplCopyWith<$Res> {
  factory _$$GetConnectedImplCopyWith(
    _$GetConnectedImpl value,
    $Res Function(_$GetConnectedImpl) then,
  ) = __$$GetConnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetConnectedImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$GetConnectedImpl>
    implements _$$GetConnectedImplCopyWith<$Res> {
  __$$GetConnectedImplCopyWithImpl(
    _$GetConnectedImpl _value,
    $Res Function(_$GetConnectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetConnectedImpl implements GetConnected {
  const _$GetConnectedImpl();

  @override
  String toString() {
    return 'AppBleDeviceState.getConnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetConnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return getConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return getConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (getConnected != null) {
      return getConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return getConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return getConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (getConnected != null) {
      return getConnected(this);
    }
    return orElse();
  }
}

abstract class GetConnected implements AppBleDeviceState {
  const factory GetConnected() = _$GetConnectedImpl;
}

/// @nodoc
abstract class _$$DeviceIsDisconnectedImplCopyWith<$Res> {
  factory _$$DeviceIsDisconnectedImplCopyWith(
    _$DeviceIsDisconnectedImpl value,
    $Res Function(_$DeviceIsDisconnectedImpl) then,
  ) = __$$DeviceIsDisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceIsDisconnectedImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$DeviceIsDisconnectedImpl>
    implements _$$DeviceIsDisconnectedImplCopyWith<$Res> {
  __$$DeviceIsDisconnectedImplCopyWithImpl(
    _$DeviceIsDisconnectedImpl _value,
    $Res Function(_$DeviceIsDisconnectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeviceIsDisconnectedImpl implements DeviceIsDisconnected {
  const _$DeviceIsDisconnectedImpl();

  @override
  String toString() {
    return 'AppBleDeviceState.deviceIsDisconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceIsDisconnectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return deviceIsDisconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return deviceIsDisconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (deviceIsDisconnected != null) {
      return deviceIsDisconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return deviceIsDisconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return deviceIsDisconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (deviceIsDisconnected != null) {
      return deviceIsDisconnected(this);
    }
    return orElse();
  }
}

abstract class DeviceIsDisconnected implements AppBleDeviceState {
  const factory DeviceIsDisconnected() = _$DeviceIsDisconnectedImpl;
}

/// @nodoc
abstract class _$$BluetoothStatusImplCopyWith<$Res> {
  factory _$$BluetoothStatusImplCopyWith(
    _$BluetoothStatusImpl value,
    $Res Function(_$BluetoothStatusImpl) then,
  ) = __$$BluetoothStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOn});
}

/// @nodoc
class __$$BluetoothStatusImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$BluetoothStatusImpl>
    implements _$$BluetoothStatusImplCopyWith<$Res> {
  __$$BluetoothStatusImplCopyWithImpl(
    _$BluetoothStatusImpl _value,
    $Res Function(_$BluetoothStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isOn = null}) {
    return _then(
      _$BluetoothStatusImpl(
        null == isOn
            ? _value.isOn
            : isOn // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$BluetoothStatusImpl implements BluetoothStatus {
  const _$BluetoothStatusImpl(this.isOn);

  @override
  final bool isOn;

  @override
  String toString() {
    return 'AppBleDeviceState.bluetoothStatus(isOn: $isOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothStatusImpl &&
            (identical(other.isOn, isOn) || other.isOn == isOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOn);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothStatusImplCopyWith<_$BluetoothStatusImpl> get copyWith =>
      __$$BluetoothStatusImplCopyWithImpl<_$BluetoothStatusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return bluetoothStatus(isOn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return bluetoothStatus?.call(isOn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (bluetoothStatus != null) {
      return bluetoothStatus(isOn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return bluetoothStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return bluetoothStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (bluetoothStatus != null) {
      return bluetoothStatus(this);
    }
    return orElse();
  }
}

abstract class BluetoothStatus implements AppBleDeviceState {
  const factory BluetoothStatus(final bool isOn) = _$BluetoothStatusImpl;

  bool get isOn;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BluetoothStatusImplCopyWith<_$BluetoothStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServicesDiscoveredImplCopyWith<$Res> {
  factory _$$ServicesDiscoveredImplCopyWith(
    _$ServicesDiscoveredImpl value,
    $Res Function(_$ServicesDiscoveredImpl) then,
  ) = __$$ServicesDiscoveredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BluetoothDevice device, List<BluetoothService> services});
}

/// @nodoc
class __$$ServicesDiscoveredImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$ServicesDiscoveredImpl>
    implements _$$ServicesDiscoveredImplCopyWith<$Res> {
  __$$ServicesDiscoveredImplCopyWithImpl(
    _$ServicesDiscoveredImpl _value,
    $Res Function(_$ServicesDiscoveredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? device = null, Object? services = null}) {
    return _then(
      _$ServicesDiscoveredImpl(
        null == device
            ? _value.device
            : device // ignore: cast_nullable_to_non_nullable
                as BluetoothDevice,
        null == services
            ? _value._services
            : services // ignore: cast_nullable_to_non_nullable
                as List<BluetoothService>,
      ),
    );
  }
}

/// @nodoc

class _$ServicesDiscoveredImpl implements ServicesDiscovered {
  const _$ServicesDiscoveredImpl(
    this.device,
    final List<BluetoothService> services,
  ) : _services = services;

  @override
  final BluetoothDevice device;
  final List<BluetoothService> _services;
  @override
  List<BluetoothService> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString() {
    return 'AppBleDeviceState.servicesDiscovered(device: $device, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesDiscoveredImpl &&
            (identical(other.device, device) || other.device == device) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    device,
    const DeepCollectionEquality().hash(_services),
  );

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesDiscoveredImplCopyWith<_$ServicesDiscoveredImpl> get copyWith =>
      __$$ServicesDiscoveredImplCopyWithImpl<_$ServicesDiscoveredImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return servicesDiscovered(device, services);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return servicesDiscovered?.call(device, services);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (servicesDiscovered != null) {
      return servicesDiscovered(device, services);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return servicesDiscovered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return servicesDiscovered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (servicesDiscovered != null) {
      return servicesDiscovered(this);
    }
    return orElse();
  }
}

abstract class ServicesDiscovered implements AppBleDeviceState {
  const factory ServicesDiscovered(
    final BluetoothDevice device,
    final List<BluetoothService> services,
  ) = _$ServicesDiscoveredImpl;

  BluetoothDevice get device;
  List<BluetoothService> get services;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServicesDiscoveredImplCopyWith<_$ServicesDiscoveredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CharacteristicListeningImplCopyWith<$Res> {
  factory _$$CharacteristicListeningImplCopyWith(
    _$CharacteristicListeningImpl value,
    $Res Function(_$CharacteristicListeningImpl) then,
  ) = __$$CharacteristicListeningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BluetoothCharacteristic characteristic});
}

/// @nodoc
class __$$CharacteristicListeningImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$CharacteristicListeningImpl>
    implements _$$CharacteristicListeningImplCopyWith<$Res> {
  __$$CharacteristicListeningImplCopyWithImpl(
    _$CharacteristicListeningImpl _value,
    $Res Function(_$CharacteristicListeningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? characteristic = null}) {
    return _then(
      _$CharacteristicListeningImpl(
        null == characteristic
            ? _value.characteristic
            : characteristic // ignore: cast_nullable_to_non_nullable
                as BluetoothCharacteristic,
      ),
    );
  }
}

/// @nodoc

class _$CharacteristicListeningImpl implements CharacteristicListening {
  const _$CharacteristicListeningImpl(this.characteristic);

  @override
  final BluetoothCharacteristic characteristic;

  @override
  String toString() {
    return 'AppBleDeviceState.characteristicListening(characteristic: $characteristic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacteristicListeningImpl &&
            (identical(other.characteristic, characteristic) ||
                other.characteristic == characteristic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characteristic);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacteristicListeningImplCopyWith<_$CharacteristicListeningImpl>
  get copyWith => __$$CharacteristicListeningImplCopyWithImpl<
    _$CharacteristicListeningImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return characteristicListening(characteristic);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return characteristicListening?.call(characteristic);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (characteristicListening != null) {
      return characteristicListening(characteristic);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return characteristicListening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return characteristicListening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (characteristicListening != null) {
      return characteristicListening(this);
    }
    return orElse();
  }
}

abstract class CharacteristicListening implements AppBleDeviceState {
  const factory CharacteristicListening(
    final BluetoothCharacteristic characteristic,
  ) = _$CharacteristicListeningImpl;

  BluetoothCharacteristic get characteristic;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacteristicListeningImplCopyWith<_$CharacteristicListeningImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListeningActiveImplCopyWith<$Res> {
  factory _$$ListeningActiveImplCopyWith(
    _$ListeningActiveImpl value,
    $Res Function(_$ListeningActiveImpl) then,
  ) = __$$ListeningActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isActive});
}

/// @nodoc
class __$$ListeningActiveImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$ListeningActiveImpl>
    implements _$$ListeningActiveImplCopyWith<$Res> {
  __$$ListeningActiveImplCopyWithImpl(
    _$ListeningActiveImpl _value,
    $Res Function(_$ListeningActiveImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isActive = null}) {
    return _then(
      _$ListeningActiveImpl(
        null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                as bool,
      ),
    );
  }
}

/// @nodoc

class _$ListeningActiveImpl implements ListeningActive {
  const _$ListeningActiveImpl(this.isActive);

  @override
  final bool isActive;

  @override
  String toString() {
    return 'AppBleDeviceState.listeningActive(isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningActiveImpl &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isActive);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningActiveImplCopyWith<_$ListeningActiveImpl> get copyWith =>
      __$$ListeningActiveImplCopyWithImpl<_$ListeningActiveImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return listeningActive(isActive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return listeningActive?.call(isActive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (listeningActive != null) {
      return listeningActive(isActive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return listeningActive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return listeningActive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (listeningActive != null) {
      return listeningActive(this);
    }
    return orElse();
  }
}

abstract class ListeningActive implements AppBleDeviceState {
  const factory ListeningActive(final bool isActive) = _$ListeningActiveImpl;

  bool get isActive;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningActiveImplCopyWith<_$ListeningActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CounterUpdatedImplCopyWith<$Res> {
  factory _$$CounterUpdatedImplCopyWith(
    _$CounterUpdatedImpl value,
    $Res Function(_$CounterUpdatedImpl) then,
  ) = __$$CounterUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$CounterUpdatedImplCopyWithImpl<$Res>
    extends _$AppBleDeviceStateCopyWithImpl<$Res, _$CounterUpdatedImpl>
    implements _$$CounterUpdatedImplCopyWith<$Res> {
  __$$CounterUpdatedImplCopyWithImpl(
    _$CounterUpdatedImpl _value,
    $Res Function(_$CounterUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? counter = null}) {
    return _then(
      _$CounterUpdatedImpl(
        null == counter
            ? _value.counter
            : counter // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$CounterUpdatedImpl implements CounterUpdated {
  const _$CounterUpdatedImpl(this.counter);

  @override
  final int counter;

  @override
  String toString() {
    return 'AppBleDeviceState.counterUpdated(counter: $counter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterUpdatedImpl &&
            (identical(other.counter, counter) || other.counter == counter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counter);

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterUpdatedImplCopyWith<_$CounterUpdatedImpl> get copyWith =>
      __$$CounterUpdatedImplCopyWithImpl<_$CounterUpdatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)
    scanning,
    required TResult Function(String message) error,
    required TResult Function(bool isScanning) isScanning,
    required TResult Function(bool isConnecting) isConnecting,
    required TResult Function(BluetoothDevice device) connected,
    required TResult Function() getConnected,
    required TResult Function() deviceIsDisconnected,
    required TResult Function(bool isOn) bluetoothStatus,
    required TResult Function(
      BluetoothDevice device,
      List<BluetoothService> services,
    )
    servicesDiscovered,
    required TResult Function(BluetoothCharacteristic characteristic)
    characteristicListening,
    required TResult Function(bool isActive) listeningActive,
    required TResult Function(int counter) counterUpdated,
  }) {
    return counterUpdated(counter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult? Function(String message)? error,
    TResult? Function(bool isScanning)? isScanning,
    TResult? Function(bool isConnecting)? isConnecting,
    TResult? Function(BluetoothDevice device)? connected,
    TResult? Function()? getConnected,
    TResult? Function()? deviceIsDisconnected,
    TResult? Function(bool isOn)? bluetoothStatus,
    TResult? Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult? Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult? Function(bool isActive)? listeningActive,
    TResult? Function(int counter)? counterUpdated,
  }) {
    return counterUpdated?.call(counter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BluetoothDevice> devices, bool isTimerStoped)?
    scanning,
    TResult Function(String message)? error,
    TResult Function(bool isScanning)? isScanning,
    TResult Function(bool isConnecting)? isConnecting,
    TResult Function(BluetoothDevice device)? connected,
    TResult Function()? getConnected,
    TResult Function()? deviceIsDisconnected,
    TResult Function(bool isOn)? bluetoothStatus,
    TResult Function(BluetoothDevice device, List<BluetoothService> services)?
    servicesDiscovered,
    TResult Function(BluetoothCharacteristic characteristic)?
    characteristicListening,
    TResult Function(bool isActive)? listeningActive,
    TResult Function(int counter)? counterUpdated,
    required TResult orElse(),
  }) {
    if (counterUpdated != null) {
      return counterUpdated(counter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Scanning value) scanning,
    required TResult Function(Error value) error,
    required TResult Function(IsScanning value) isScanning,
    required TResult Function(IsConnecting value) isConnecting,
    required TResult Function(Connected value) connected,
    required TResult Function(GetConnected value) getConnected,
    required TResult Function(DeviceIsDisconnected value) deviceIsDisconnected,
    required TResult Function(BluetoothStatus value) bluetoothStatus,
    required TResult Function(ServicesDiscovered value) servicesDiscovered,
    required TResult Function(CharacteristicListening value)
    characteristicListening,
    required TResult Function(ListeningActive value) listeningActive,
    required TResult Function(CounterUpdated value) counterUpdated,
  }) {
    return counterUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Scanning value)? scanning,
    TResult? Function(Error value)? error,
    TResult? Function(IsScanning value)? isScanning,
    TResult? Function(IsConnecting value)? isConnecting,
    TResult? Function(Connected value)? connected,
    TResult? Function(GetConnected value)? getConnected,
    TResult? Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult? Function(BluetoothStatus value)? bluetoothStatus,
    TResult? Function(ServicesDiscovered value)? servicesDiscovered,
    TResult? Function(CharacteristicListening value)? characteristicListening,
    TResult? Function(ListeningActive value)? listeningActive,
    TResult? Function(CounterUpdated value)? counterUpdated,
  }) {
    return counterUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Scanning value)? scanning,
    TResult Function(Error value)? error,
    TResult Function(IsScanning value)? isScanning,
    TResult Function(IsConnecting value)? isConnecting,
    TResult Function(Connected value)? connected,
    TResult Function(GetConnected value)? getConnected,
    TResult Function(DeviceIsDisconnected value)? deviceIsDisconnected,
    TResult Function(BluetoothStatus value)? bluetoothStatus,
    TResult Function(ServicesDiscovered value)? servicesDiscovered,
    TResult Function(CharacteristicListening value)? characteristicListening,
    TResult Function(ListeningActive value)? listeningActive,
    TResult Function(CounterUpdated value)? counterUpdated,
    required TResult orElse(),
  }) {
    if (counterUpdated != null) {
      return counterUpdated(this);
    }
    return orElse();
  }
}

abstract class CounterUpdated implements AppBleDeviceState {
  const factory CounterUpdated(final int counter) = _$CounterUpdatedImpl;

  int get counter;

  /// Create a copy of AppBleDeviceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounterUpdatedImplCopyWith<_$CounterUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
