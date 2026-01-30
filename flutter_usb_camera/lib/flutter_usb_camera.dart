import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class FlutterUsbCamera {
  static const _methodChannel = MethodChannel('flutter_usb_camera/methods');
  static const _eventsChannel = EventChannel('flutter_usb_camera/frames');
  static const EventChannel _stateChannel = EventChannel('flutter_usb_camera/states');

  static Stream<Uint8List>? _stream;

  static Future<void> startStream({
    int fps = 30,
    int? croppedWidth,
    int? croppedHeight,
  }) async {
    await _methodChannel.invokeMethod('startStream', {
      'fps': fps,
      'croppedWidth': croppedWidth,
      'croppedHeight': croppedHeight,
    });
  }

  static Future<void> stopStream() async {
    await _methodChannel.invokeMethod('stopStream');
  }

  static Future<void> pausePreview ()async{
    await _methodChannel.invokeListMethod("pausePreview");
  }

  static Future<void> resumePreview ()async{
    await _methodChannel.invokeListMethod("resumePreview");
  }
  static Stream<Uint8List> frames() {
    _stream ??= _eventsChannel.receiveBroadcastStream().cast<Uint8List>();
    return _stream!;
  }




  static UsbCameraCallbacks? _callbacks;
  static StreamSubscription<dynamic>? _stateSub;

  /// Call once (e.g., in initState) to receive native USB state events as method callbacks.
  static Future<void> setCallbacks(UsbCameraCallbacks callbacks) async {
    _callbacks = callbacks;
    // Ensure single subscription
    _stateSub ??= _stateChannel.receiveBroadcastStream().listen(
          (dynamic e) {
        try {
          final map = Map<String, dynamic>.from(e as Map);
          final usbDeviceInfo = UsbDeviceInfo.fromMap(map);
          final event = (map['event'] as String?) ?? '';
          switch (event) {
            case 'attach':
              _callbacks?.onAttach?.call(usbDeviceInfo);
              break;
            case 'device_open':
              _callbacks?.onDeviceOpen?.call(usbDeviceInfo, map['isFirstOpen'] == true);
              break;
            case 'camera_open':
              _callbacks?.onCameraOpen?.call(usbDeviceInfo);
              break;
            case 'camera_close':
              _callbacks?.onCameraClose?.call(usbDeviceInfo);
              break;
            case 'device_close':
              _callbacks?.onDeviceClose?.call(usbDeviceInfo);
              break;
            case 'detach':
              _callbacks?.onDetach?.call(usbDeviceInfo);
              break;
            case 'cancel':
              _callbacks?.onCancel?.call(usbDeviceInfo);
              break;
            default:
            // ignore unknowns
              break;
          }
        } catch (err, st) {
          // keep failures from killing the subscription
          // debugPrint('USB state dispatch error: $err\n$st');
        }
      },
      onError: (err, st) {
        // Optionally surface errors or log
        // debugPrint('USB state stream error: $err\n$st');
      },
      cancelOnError: false,
    );
  }

  /// Stop receiving callbacks (e.g., in dispose).
  static Future<void> clearCallbacks() async {
    _callbacks = null;
    await _stateSub?.cancel();
    _stateSub = null;
  }



}

/// Lightweight info we pass with callbacks.
class UsbDeviceInfo {
  final int? vendorId;
  final int? productId;
  final String? deviceName;
  final int? deviceId;

  const UsbDeviceInfo({this.vendorId, this.productId, this.deviceName, this.deviceId});

  factory UsbDeviceInfo.fromMap(Map<String, dynamic> m) => UsbDeviceInfo(
    vendorId: m['vendorId'] as int?,
    productId: m['productId'] as int?,
    deviceName: m['deviceName'] as String?,
    deviceId: m['deviceId'] as int?,
  );
}

/// Register one of these to receive method-like callbacks.
class UsbCameraCallbacks {
  final void Function(UsbDeviceInfo? device)? onAttach;
  final void Function(UsbDeviceInfo? device, bool isFirstOpen)? onDeviceOpen;
  final void Function(UsbDeviceInfo? device)? onCameraOpen;
  final void Function(UsbDeviceInfo? device)? onCameraClose;
  final void Function(UsbDeviceInfo? device)? onDeviceClose;
  final void Function(UsbDeviceInfo? device)? onDetach;
  final void Function(UsbDeviceInfo? device)? onCancel;

  const UsbCameraCallbacks({
    this.onAttach,
    this.onDeviceOpen,
    this.onCameraOpen,
    this.onCameraClose,
    this.onDeviceClose,
    this.onDetach,
    this.onCancel,
  });
}


