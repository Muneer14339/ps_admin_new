import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';

typedef GetConnectedSSIDNative = Pointer<Utf8> Function();
typedef GetConnectedSSIDiOS = Pointer<Utf8> Function();

class NetworkInfo {
  // Load the dynamic library
  static final DynamicLibrary _nativeLib = DynamicLibrary.process();

  // Bind to the native Swift function
  static final GetConnectedSSIDiOS _getConnectedSSID = _nativeLib
      .lookup<NativeFunction<GetConnectedSSIDNative>>('getConnectedSSID')
      .asFunction();

  /// Get the connected Wi-Fi SSID
  static String? getConnectedSSID() {
    final ssidPointer = _getConnectedSSID();
    if (ssidPointer == nullptr) {
      return null;
    }
    final ssid = ssidPointer.toDartString();
    calloc.free(ssidPointer);
    return ssid;
  }
}

class WiFiSettings {
  static const platform = MethodChannel('com.tlc.PulseAim');

  static Future<void> openWiFiSettings() async {
    try {
      await platform.invokeMethod('openWiFiSettings');
    } on PlatformException catch (e) {
      print("Failed to open Wi-Fi settings: ${e.message}");
    }
  }
  static Future<void> scanWiFi() async {
    try {
      await platform.invokeMethod('startWifiScan');
    } on PlatformException catch (e) {
      print("Failed to open Wi-Fi settings: ${e.message}");
    }
  }
}
