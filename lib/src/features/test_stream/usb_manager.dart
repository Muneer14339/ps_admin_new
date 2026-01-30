import 'package:flutter/material.dart';
import 'package:flutter_usb_camera/flutter_usb_camera.dart';

class UsbCameraManager {
  static bool _isInitialized = false;
  static String _currentDeviceName = '';
  static bool _isCameraOpen = false;

  // Initialize callbacks with proper error handling
  static void initializeCallbacks() {
    if (_isInitialized) return;

    FlutterUsbCamera.setCallbacks(
      UsbCameraCallbacks(
        onAttach: _handleDeviceAttach,
        onDeviceOpen: _handleDeviceOpen,
        onCameraOpen: _handleCameraOpen,
        onCameraClose: _handleCameraClose,
        onDeviceClose: _handleDeviceClose,
        onDetach: _handleDeviceDetach,
        onCancel: _handleCancel,
      ),
    );

    _isInitialized = true;
    debugPrint('USB Camera callbacks initialized');
  }

  // Device attached callback
  static void _handleDeviceAttach(UsbDeviceInfo? usbDeviceInfo) {
    try {
      debugPrint('📱 Device Attached: ${usbDeviceInfo?.deviceName ?? 'Unknown'}');
      _currentDeviceName = usbDeviceInfo?.deviceName ?? '';

      // Optional: Show user notification
      // You can emit events here for UI updates
      _notifyDeviceStateChange('attached', usbDeviceInfo);
    } catch (e) {
      debugPrint('❌ Error in onAttach: $e');
    }
  }

  // Device opened callback
  static void _handleDeviceOpen(UsbDeviceInfo? usbDeviceInfo, bool? isFirstOpen) {
    try {
      debugPrint('🔓 Device Opened: ${usbDeviceInfo?.deviceName ?? 'Unknown'}');
      debugPrint('   First Open: ${isFirstOpen ?? false}');

      if (isFirstOpen == true) {
        debugPrint('   This is the first time opening this device');
        // Perform first-time setup if needed
      }

      _notifyDeviceStateChange('opened', usbDeviceInfo);
    } catch (e) {
      debugPrint('❌ Error in onDeviceOpen: $e');
    }
  }

  // Camera opened callback
  static void _handleCameraOpen(UsbDeviceInfo? usbDeviceInfo) {
    try {
      debugPrint('📷 Camera Opened: ${usbDeviceInfo?.deviceName ?? 'Unknown'}');
      _isCameraOpen = true;

      // Camera is ready for use
      _notifyDeviceStateChange('camera_opened', usbDeviceInfo);
    } catch (e) {
      debugPrint('❌ Error in onCameraOpen: $e');
    }
  }

  // Camera closed callback
  static void _handleCameraClose(UsbDeviceInfo? usbDeviceInfo) {
    try {
      debugPrint('📷❌ Camera Closed: ${usbDeviceInfo?.deviceName ?? 'Unknown'}');
      _isCameraOpen = false;

      _notifyDeviceStateChange('camera_closed', usbDeviceInfo);
    } catch (e) {
      debugPrint('❌ Error in onCameraClose: $e');
    }
  }

  // Device closed callback
  static void _handleDeviceClose(UsbDeviceInfo? usbDeviceInfo) {
    try {
      debugPrint('🔒 Device Closed: ${usbDeviceInfo?.deviceName ?? 'Unknown'}');

      _notifyDeviceStateChange('closed', usbDeviceInfo);
    } catch (e) {
      debugPrint('❌ Error in onDeviceClose: $e');
    }
  }

  // Device detached callback
  static void _handleDeviceDetach(UsbDeviceInfo? usbDeviceInfo) {
    try {
      debugPrint('📱❌ Device Detached: ${usbDeviceInfo?.deviceName ?? 'Unknown'}');
      _currentDeviceName = '';
      _isCameraOpen = false;

      _notifyDeviceStateChange('detached', usbDeviceInfo);
    } catch (e) {
      debugPrint('❌ Error in onDetach: $e');
    }
  }

  // Cancel callback
  static void _handleCancel(UsbDeviceInfo? usbDeviceInfo) {
    try {
      debugPrint('❌ Operation Cancelled: ${usbDeviceInfo?.deviceName ?? 'Unknown'}');

      _notifyDeviceStateChange('cancelled', usbDeviceInfo);
    } catch (e) {
      debugPrint('❌ Error in onCancel: $e');
    }
  }

  // Helper method to notify UI about state changes
  static void _notifyDeviceStateChange(String state, UsbDeviceInfo? deviceInfo) {
    // You can use streams, notifiers, or other state management here
    // Example with a global stream controller:
    // UsbCameraEventBus.instance.emit(UsbCameraEvent(state, deviceInfo));

    debugPrint('📡 State Changed: $state for device: ${deviceInfo?.deviceName}');
  }

  // Getters for current state
  static bool get isInitialized => _isInitialized;
  static String get currentDeviceName => _currentDeviceName;
  static bool get isCameraOpen => _isCameraOpen;

  // Clean up method
  static void dispose() {
    // FlutterUsbCamera.clearCallbacks();
    FlutterUsbCamera.clearCallbacks();
    FlutterUsbCamera.stopStream();
    _isInitialized = false;
    _currentDeviceName = '';
    _isCameraOpen = false;
    debugPrint('USB Camera Manager disposed');
  }
}

// // Example usage in a widget
// class UsbCameraWidget extends StatefulWidget {
//   const UsbCameraWidget({super.key});
//
//   @override
//   _UsbCameraWidgetState createState() => _UsbCameraWidgetState();
// }
//
// class _UsbCameraWidgetState extends State<UsbCameraWidget> {
//   @override
//   void initState() {
//     super.initState();
//     // Initialize callbacks when widget is created
//     UsbCameraManager.initializeCallbacks();
//   }
//
//   @override
//   void dispose() {
//     // Clean up when widget is disposed
//     UsbCameraManager.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('USB Camera')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Current Device: ${UsbCameraManager.currentDeviceName}'),
//             Text('Camera Open: ${UsbCameraManager.isCameraOpen}'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Your camera operations here
//                 debugPrint('Camera button pressed');
//               },
//               child: Text('Open Camera'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Optional: Event-based system for better state management
// class UsbCameraEvent {
//   final String type;
//   final UsbDeviceInfo? deviceInfo;
//   final DateTime timestamp;
//
//   UsbCameraEvent(this.type, this.deviceInfo) : timestamp = DateTime.now();
// }
//
// // You can extend this with streams for reactive programming
// class UsbCameraEventBus {
//   static final UsbCameraEventBus _instance = UsbCameraEventBus._internal();
//   factory UsbCameraEventBus() => _instance;
//   UsbCameraEventBus._internal();
//
//   static UsbCameraEventBus get instance => _instance;
//
// // Stream controller for events
// // final StreamController<UsbCameraEvent> _controller = StreamController.broadcast();
// // Stream<UsbCameraEvent> get events => _controller.stream;
//
// // void emit(UsbCameraEvent event) => _controller.add(event);
// // void dispose() => _controller.close();
// }