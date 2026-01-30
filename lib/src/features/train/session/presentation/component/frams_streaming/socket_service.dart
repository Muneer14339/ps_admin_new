import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/frams_streaming/stream_manager.dart';
import 'package:wifi_iot/wifi_iot.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../../../../connectivity/presentation/view/wifi_list_view.dart';
import '../../bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import '../fram_streaming_widget.dart';

/// old
// class CameraSocketHandler {
//   final String cameraIp;
//   final int commandPort;
//   final Function(int) onSessionStarted;
//   late Socket _socket;
//   int? token;
//   Completer<void>? _stopVfCompleter;
//   Completer<void>? _setFovCompleter;
//
//   CameraSocketHandler({
//     required this.cameraIp,
//     required this.commandPort,
//     required this.onSessionStarted,
//   });
//
//
//
//   Future<void> initSocket() async {
//     try {
//       _socket = await Socket.connect(cameraIp, commandPort);
//       _startSession();
//       _socket.listen(
//         _handleResponse,
//         onError: (error) => _onSocketError(error),
//         onDone: _onSocketDone,
//       );
//     } catch (e) {
//       print('Socket connection error: $e');
//     }
//   }
//
//   void _startSession() {
//
//     Map<String, dynamic> startSessionCmd = {"token": 0, "msg_id": 257};
//     _sendCommand(startSessionCmd);
//   }
//   void _sendCommand(Map<String, dynamic> command) {
//     String jsonString = jsonEncode(command);
//     _socket.write(jsonString);
//   }
//   void _handleResponse(List<int> data) {
//
//     String response = utf8.decode(data);
//     List<String> responses = _splitResponses(response);
//     for (var r in responses) {
//       try {
//         Map<String, dynamic> parsedResponse = jsonDecode(r);
//         _processResponse(parsedResponse);
//       } catch (e) {
//         print("Failed to decode response: $r, error: $e");
//       }
//     }
//   }
//   List<String> _splitResponses(String response) {
//     return response
//         .split('}{')
//         .map((e) => e.contains('{') ? e : '{$e')
//         .map((e) => e.contains('}') ? e : '$e}')
//         .toList();
//   }
//   void _processResponse(Map<String, dynamic> response) {
//     print("_processResponse==$response");
//     if (response["rval"] == 0) {
//       switch (response["msg_id"]) {
//         case 257:
//           if (response["param"] != null) {
//             token = response["param"];
//             onSessionStarted(token!);
//           }
//           break;
//         case 260:
//           _stopVfCompleter?.complete();
//           break;
//         case 2:
//           _setFovCompleter?.complete();
//           break;
//         case 259:
//         // Handle live view reset if needed
//           break;
//         default:
//           break;
//       }
//     } else {
//       print("Error in response==: $response");
//     }
//   }
//
//
// // List<String> supportedResolutions = [
//   //   "3840x2160 30P 16:9",
//   //   "3840x2160 25P 16:9",
//   //   "2880x2160 30P 16:9",
//   //   "2704x2028 30P 4:3",
//   //   "2704x1520 30P 16:9",
//   //   "2560x1440 30P 16:9",
//   //   "2560x1440 60P 4:3",
//   //   "1920x1440 30P 4:3",
//   //   "1920x1080 60P 16:9",
//   //   "1920x1080 30P 16:9",
//   //   "1280x960 30P 4:3",
//   //   "960x540 30P 16:9",
//   //   "1920x1080 120P 16:9",
//   //   "1920x1080 100P 16:9",
//   //   "1280x720 240P 16:9",
//   //   "1280x720 120P 16:9",
//   //   "1280x720 60P 16:9",
//   //   "1280x720 30P 16:9"
//   // ];
//   Future<void> setLowResolution(String resolution) async {
//     if (token != null) {
//       _stopVfCompleter = Completer<void>();
//       print("🔴 Stopping Viewfinder before setting resolution...");
//       _sendCommand({"token": token, "msg_id": 260}); // Stop VF
//       await _stopVfCompleter?.future;
//
//       _setFovCompleter = Completer<void>();
//       _setResolution(resolution); // Apply lower resolution
//       await _setFovCompleter?.future;
//
//       print("✅ Restarting Viewfinder after setting resolution...");
//       _sendCommand({"token": token, "msg_id": 259}); // Reset VF
//     } else {
//       print("❌ Token is not available. Cannot set resolution.");
//     }
//   }
//
//   void _setResolution(String resolution) {
//     if (token != null) {
//       _sendCommand({
//         "msg_id": 2,
//         "param": resolution,
//         "token": token,
//         "type": "video_resolution",
//       });
//     } else {
//       print("❌ Token is not available. Cannot set resolution.");
//     }
//   }
//
//   Future<void> resetLiveView(String fov) async {
//     if (token != null) {
//       _stopVfCompleter = Completer<void>();
//       _sendCommand({"token": token, "msg_id": 260});
//       await _stopVfCompleter?.future;
//       _setFovCompleter = Completer<void>();
//       _setFov(fov);
//       await _setFovCompleter?.future;
//       _sendCommand({"token": token, "msg_id": 259});
//     } else {
//       print("Token is not available. Cannot reset live view.");
//     }
//   }
//   void _setFov(String fov) {
//     if (token != null) {
//       _sendCommand({
//         "msg_id": 2,
//         "param": fov,
//         "token": token,
//         "type": "FOV",
//       });
//
//     } else {
//       print("Token is not available. Cannot set FOV.");
//     }
//   }
//
//   Future<void> setLightFreq(String fov) async {
//     if (token != null) {
//       _stopVfCompleter = Completer<void>();
//       _sendCommand({"token": token, "msg_id": 260});
//       await _stopVfCompleter?.future;
//       _setFovCompleter = Completer<void>();
//       _setLightFreqValues(fov);
//       await _setFovCompleter?.future;
//       _sendCommand({"token": token, "msg_id": 259});
//     } else {
//       print("Token is not available. Cannot reset live view.");
//     }
//   }
//   Future<void> _setLightFreqValues(String iso) async {
//     print("_setIsoValues$iso");
//
//     if (token != null) {
//       _sendCommand({
//         "msg_id": 2,
//         "param": iso,
//         "token": token,
//         "type": "ISO",
//       });
//     } else {
//       print("Token is not available. Cannot set ISO.");
//     }
//   }
//
//   Future<void> setIso(String fov) async {
//     if (token != null) {
//       // _stopVfCompleter = Completer<void>();
//       // _sendCommand({"token": token, "msg_id": 260});
//       // await _stopVfCompleter?.future;
//       // _setFovCompleter = Completer<void>();
//       _setIsoValues(fov);
//       // await _setFovCompleter?.future;
//       // _sendCommand({"token": token, "msg_id": 259});
//     } else {
//       print("Token is not available. Cannot reset live view.");
//     }
//   }
//   Future<void> _setIsoValues(String iso) async {
//     print("_setIsoValues$iso");
//
//     if (token != null) {
//       _sendCommand({
//         "msg_id": 2,
//         "param": iso,
//         "token": token,
//         "type": "ISO",
//       });
//     } else {
//       print("Token is not available. Cannot set ISO.");
//     }
//   }
//
//   Future<void> setEv(String fov) async {
//     if (token != null) {
//       _stopVfCompleter = Completer<void>();
//       _sendCommand({"token": token, "msg_id": 260});
//       await _stopVfCompleter?.future;
//       _setFovCompleter = Completer<void>();
//       _setEvValues(fov);
//       await _setFovCompleter?.future;
//       _sendCommand({"token": token, "msg_id": 259});
//     } else {
//       print("Token is not available. Cannot reset live view.");
//     }
//   }
//   Future<void> _setEvValues(String evValue) async {
//     print("_setEvValues$evValue");
//
//     if (token != null) {
//       _sendCommand({
//         "msg_id": 2,
//         "param": evValue,
//         "token": token,
//         "type": "EV_Value",
//       });
//     } else {
//       print("Token is not available. Cannot set EV Value.");
//     }
//   }
//
//
//
//   void _onSocketError(dynamic error) {
//     print('Socket error: $error');
//     _socket.destroy();
//   }
//
//   void _onSocketDone() {
//     print('Socket disconnected.');
//     _socket.destroy();
//   }
//
//   Future<void> disposeSocket() async {
//     try{
//       _socket.destroy();
//     }catch(e){
//       print("disposeSocket");
//       print(e.toString());
//     }
//   }
//
// }


AudioPlayer audioPlayer = AudioPlayer();

///New_19_Nov
class CameraSocketHandler {
  final Function(int)? onSessionStarted;
  Socket? _socket;
  int? token;
  String _responseBuffer = "";

  // Completers for commands expecting a response.
  Completer<void>? _stopVfCompleter;
  Completer<void>? _commandCompleter;
  Completer<BatteryInfo>? _batteryCompleter;

  int error = 100;
  StreamSubscription? _socketSubscription;
  bool _isConnected = false;

  bool _isReconnecting = false;
  DateTime? _lastSuccessfulConnection;
  String cameraIp = '192.168.42.1';
  int commandPort = 7878;
  int rtspPort = 554;

  // final String cameraIp = '192.168.42.1';
  // final int commandPort = 7878;  // Command port
  final String rtspUrl = 'rtsp://192.168.42.1/live';
  final Function(BatteryInfo)? onBatteryInfoReceived;

  CameraSocketHandler({
     this.onSessionStarted,
     this.onBatteryInfoReceived,
  });

  /// Initializes the socket connection and starts the session.
  // Future<int> initSocket() async {
  //   try {
  //     _socket = await Socket.connect(cameraIp, commandPort);
  //     print('Connected to $cameraIp:$commandPort');
  //     _startSession();
  //     _socket.map(utf8.decode).listen(
  //       _onData,
  //       onError: _onSocketError,
  //       onDone: _onSocketDone,
  //     );
  //     error = 200;
  //
  //     return 200;
  //   } catch (e) {
  //     error = 404;
  //     // await initSocket();
  //     print('Socket connection error: $e');
  //     return 404;
  //
  //   }
  // }
  ///check_27_Nov
//   Future<int> initSocket({
//     int retryCount = 3,
//     Duration retryDelay = const Duration(seconds: 2),
//   }) async
//   {
//     int attempts = 0;
//
//     while (attempts < retryCount) {
//       attempts++;
//
//       try {
//         print('Attempt $attempts/$retryCount: Connecting to $cameraIp:$commandPort...');
//
//         // Properly dispose existing socket before reconnecting
//         if (_socket != null) {
//           try {
//             print('Closing existing socket...');
//             await _socket?.close();
//             _socket = null;
//             // Wait a bit longer to ensure port is released
//             await Future.delayed(Duration(milliseconds: 1000));
//           } catch (e) {
//             print('Error closing existing socket: $e');
//             _socket = null; // Force null even on error
//           }
//         }
//
//         // Connect with timeout
//         _socket = await Socket.connect(
//           cameraIp,
//           commandPort,
//           timeout: Duration(seconds: 8),
//         );
//
//         print('✓ Successfully connected to $cameraIp:$commandPort');
//
//         // Configure socket
//         _socket?.setOption(SocketOption.tcpNoDelay, true);
//
//         _startSession();
//
//         _socket?.map(utf8.decode).listen(
//           _onData,
//           onError: _onSocketError,
//           onDone: _onSocketDone,
//           cancelOnError: false,
//         );
//
//         error = 200;
//         return 200;
//
//       } on SocketException catch (e) {
//         print('✗ Socket error (attempt $attempts): ${e.message}');
//         print('Error code: ${e.osError?.errorCode}');
//
//         error = 404;
//         _socket = null; // Ensure socket is null on error
//
//         if (attempts >= retryCount) {
//           print('❌ All attempts failed.');
//           print('💡 If this happens after disposing, wait a moment before reconnecting.');
//
//           return 404;
//         }
//
//         // Increase delay between retries after dispose
//         Duration currentDelay = retryDelay * attempts; // Exponential backoff
//         print('⏳ Retrying in ${currentDelay.inSeconds} seconds...');
//         await Future.delayed(currentDelay);
//
//       } on TimeoutException catch (e) {
//         print('✗ Timeout (attempt $attempts)');
//         error = 408;
//         _socket = null;
//
//         if (attempts >= retryCount) {
//           print('❌ Connection timeout.');
//           return 408;
//         }
//
//         Duration currentDelay = retryDelay * attempts;
//         print('⏳ Retrying in ${currentDelay.inSeconds} seconds...');
//         await Future.delayed(currentDelay);
//
//       } catch (e) {
//         print('✗ Error (attempt $attempts): $e');
//         error = 500;
//         _socket = null;
//
//         if (attempts >= retryCount) {
//           return 500;
//         }
//
//         Duration currentDelay = retryDelay * attempts;
//         print('⏳ Retrying in ${currentDelay.inSeconds} seconds...');
//         await Future.delayed(currentDelay);
//       }
//     }
//
//     return error;
//   }
  ///New One 2 dec
//   Future<int> initSocket({
//     int retryCount = 3,
//     Duration retryDelay = const Duration(seconds: 2),
//   }) async
//   {
//     // Route all traffic over the RTSP Wi-Fi
//     await WiFiForIoTPlugin.forceWifiUsage(true);
//
//     // Ensure we're really on the camera network
//     final networkReady = await _waitForCameraNetwork();
//     if (!networkReady) {
//       error = 64; // network / host unreachable
//       toast('❌ Network not ready, Check your Wifi');
//       return error;
//     }
//
//     print('⏳ Network detected, waiting 500ms before connect...');
//     await Future.delayed(const Duration(milliseconds: 500));
//
//     int attempts = 0;
//
//     while (attempts < retryCount) {
//       attempts++;
//
//       try {
//         print('Attempt $attempts/$retryCount: Connecting to $cameraIp:$commandPort...');
//
//         // ✅ ONLY close socket if it's NOT already connected and healthy
//         if (_socket != null && _isSocketHealthy()) {
//           print('✅ Socket already connected and healthy, reusing existing connection');
//           _socket?.setOption(SocketOption.tcpNoDelay, true);
//
//           _startSession();
//           error = 200;
//           _isConnected = true; // ✅ Track connection state
//           return 200;
//         }
//
//         // Close if socket exists but is unhealthy
//         if (_socket != null) {
//           try {
//             await _socket?.close();
//           } catch (e) {
//             print('Error closing existing socket: $e');
//           } finally {
//             _socket = null;
//           }
//         }
//
//         _socket = await Socket.connect(
//           cameraIp,
//           attempts == 1 || attempts == 3 ? commandPort : rtspPort,
//           timeout: const Duration(seconds: 8),
//         );
//
//         print('✅ Connected to $cameraIp:$commandPort');
//
//         _socket?.setOption(SocketOption.tcpNoDelay, true);
//
//         _startSession();
//
//         // ✅ Store subscription to prevent multiple listeners
//         _socketSubscription?.cancel();
//         _socketSubscription = _socket
//             ?.map(utf8.decode)
//             .listen(_onData, onError: _onSocketError, onDone: _onSocketDone);
//
//         error = 200;
//         _isConnected = true; // ✅ Track connection state
//         return 200;
//
//       } on SocketException catch (e) {
//         final code = e.osError?.errorCode;
//         print('✗ SocketException on attempt $attempts: ${e.message} (code: $code)');
//
//         switch (code) {
//           case 64:
//           case 113:
//             toast('👉 Camera network is up, but OS reports no usable route to $cameraIp.');
//             break;
//           case 110:
//             toast('👉 Packets sent to $cameraIp:$commandPort but no response (port closed/hung).');
//             break;
//           case 111:
//             toast('👉 Camera reachable but port $commandPort is actively refusing connections.');
//             break;
//           default:
//             toast('👉 Generic socket error.');
//         }
//
//         error = code ?? 500;
//         _socket = null;
//         _isConnected = false; // ✅ Update state
//
//         if (attempts >= retryCount) {
//           print('❌ All attempts failed with SocketException.');
//           return error;
//         }
//
//         final delay = retryDelay * attempts;
//         print('⏳ Retrying in ${delay.inSeconds}s...');
//         await Future.delayed(delay);
//
//       } on TimeoutException {
//         print('✗ Timeout on attempt $attempts');
//         error = 408;
//         _socket = null;
//         _isConnected = false; // ✅ Update state
//
//         if (attempts >= retryCount) {
//           print('❌ All attempts failed with timeout.');
//           return error;
//         }
//
//         final delay = retryDelay * attempts;
//         print('⏳ Retrying in ${delay.inSeconds}s...');
//         await Future.delayed(delay);
//
//       } catch (e) {
//         print('✗ Unexpected error on attempt $attempts: $e');
//         error = 500;
//         _socket = null;
//         _isConnected = false; // ✅ Update state
//
//         if (attempts >= retryCount) {
//           print('❌ All attempts failed with unexpected error.');
//           return error;
//         }
//
//         final delay = retryDelay * attempts;
//         print('⏳ Retrying in ${delay.inSeconds}s...');
//         await Future.delayed(delay);
//       }
//     }
//
//     return error;
//   }
//
// // ✅ Add helper method to check socket health
//   bool _isSocketHealthy() {
//     try {
//       return _socket != null &&
//           _isConnected &&
//           _socket!.address.address == cameraIp &&
//           _socket!.remotePort == commandPort;
//     } catch (e) {
//       return false;
//     }
//   }
//
// // ✅ Update socket done handler
//   void _onSocketDone() {
//     print('🔌 Socket connection closed');
//     _isConnected = false;
//     _socket = null;
//     _socketSubscription?.cancel();
//     _socketSubscription = null;
//   }
//
// // ✅ Update socket error handler
//   void _onSocketError(error) {
//     print('❌ Socket error: $error');
//     _isConnected = false;
//   }
  Future<int> initSocket({
    int retryCount = 2,
    Duration retryDelay = const Duration(seconds: 2),
  })
  async {
    print('CheckConnectivity_new==== Init');
    // ✅ Check if socket is already connected and healthy
    if (_socket != null && _isSocketHealthy()) {
      print(
          '✅ Socket already connected and healthy, reusing existing connection');
      _socket?.setOption(SocketOption.tcpNoDelay, true);
      // _startSession();
      error = 200;
      _isConnected = true; // ✅ Track connection state
      return 200;
    }

    // Route all traffic over the RTSP Wi-Fi
    await WiFiForIoTPlugin.forceWifiUsage(true);

    // Ensure we're really on the camera network
    // final networkReady = await _waitForCameraNetwork();
    // if (!networkReady) {
    //   error = 64;
    //   toast('❌ Network not ready, Check your Wifi');
    //   return error;
    // }

    // print('⏳ Network detected, waiting 500ms before connect...');
    // await Future.delayed(const Duration(milliseconds: 500));
    //
    // print('⏳ Waiting additional time for routing table...');
    // await Future.delayed(const Duration(milliseconds: 1500));

    int attempts = 0;

    while (attempts < retryCount) {
      attempts++;

      try {
        print(
            'Attempt $attempts/$retryCount: Connecting to $cameraIp:$commandPort...');

        if (_socket != null && !_isSocketHealthy()) {
          try {
            await _socket?.close();
          } catch (e) {
            print('Error closing existing socket: $e');
          } finally {
            _socket = null;
            _isConnected = false;
          }
        }

        int targetPort = commandPort;
        if (attempts == 2) {
          // targetPort = rtspPort;
          print('🔄 Trying RTSP port instead: $targetPort');
        }

        _socket = await Socket.connect(
          cameraIp,
          targetPort,
          timeout: const Duration(seconds: 10),
        );

        print('✅ Connected to $cameraIp:$targetPort');

        _socket?.setOption(SocketOption.tcpNoDelay, true);
        _startSession();

        _socketSubscription?.cancel();
        _socketSubscription = _socket?.map(utf8.decode).listen(
              _onData,
              onError: _onSocketError,
              onDone: _onSocketDone,
              cancelOnError: false,
            );

        error = 200;
        _isConnected = true;
        _lastSuccessfulConnection = DateTime.now();
        return 200;
      } on SocketException catch (e) {
        final code = e.osError?.errorCode;
        print(
            '✗ SocketException on attempt $attempts/$retryCount: ${e.message} (code: $code)');

        switch (code) {
          case 64:
          case 113:
            print('❌ No route to camera - OS routing issue');
            if (attempts < retryCount) {
              print('🔄 Rebinding Wi-Fi...');
              await WiFiForIoTPlugin.forceWifiUsage(false);
              await Future.delayed(const Duration(milliseconds: 800));
              await WiFiForIoTPlugin.forceWifiUsage(true);
              await Future.delayed(const Duration(milliseconds: 2000));
            } else {
              toast(
                  '❌ Cannot reach camera. Disconnect and reconnect to camera Wi-Fi.');
            }
            break;

          case 110:
            print('⏱️ Connection timeout - camera may be busy or port closed');
            if (attempts < retryCount) {
              await Future.delayed(const Duration(milliseconds: 1500));
            } else {
              toast('⏱️ Camera not responding. Check if camera is powered on.');
            }
            break;

          case 111:
            print('🚫 Connection refused - camera actively rejecting');
            if (attempts < retryCount) {
              await Future.delayed(const Duration(milliseconds: 1000));
            } else {
              toast(
                  '🚫 Camera refused connection. Restart camera or try different port.');
            }
            break;

          default:
            print('❌ Unknown socket error: code $code');
            if (attempts >= retryCount) {
              toast('❌ Connection failed with error $code');
            }
        }

        error = code ?? 500;
        _socket = null;
        _isConnected = false;

        if (attempts >= retryCount) {
          print('❌ All $retryCount attempts failed with SocketException.');
          return error;
        }

        final delay = retryDelay * attempts;
        print('⏳ Retrying in ${delay.inSeconds}s...');
        await Future.delayed(delay);
      } on TimeoutException {
        print('✗ Timeout on attempt $attempts/$retryCount');
        error = 408;
        _socket = null;
        _isConnected = false;

        if (attempts >= retryCount) {
          print('❌ All attempts failed with timeout.');
          toast('⏱️ Connection timed out. Check camera power and Wi-Fi.');
          return error;
        }

        final delay = retryDelay * attempts;
        print('⏳ Retrying in ${delay.inSeconds}s...');
        await Future.delayed(delay);
      } catch (e) {
        print('✗ Unexpected error on attempt $attempts/$retryCount: $e');
        error = 500;
        _socket = null;
        _isConnected = false;

        if (attempts >= retryCount) {
          print('❌ All attempts failed with unexpected error.');
          toast('❌ Unexpected error: $e');
          return error;
        }

        final delay = retryDelay * attempts;
        print('⏳ Retrying in ${delay.inSeconds}s...');
        await Future.delayed(delay);
      }
    }

    return error;
  }

  bool _isSocketHealthy() {
    try {
      if (_socket == null || !_isConnected) {
        return false;
      }

      final remoteAddress = _socket!.remoteAddress.address;

      if (remoteAddress != cameraIp) {
        print('⚠️ Socket connected to wrong address: $remoteAddress');
        return false;
      }

      if (_lastSuccessfulConnection != null) {
        final age = DateTime.now().difference(_lastSuccessfulConnection!);
        if (age.inMinutes > 5) {
          print('⚠️ Connection is ${age.inMinutes} minutes old - may be stale');
        }
      }

      return true;
    } catch (e) {
      print('❌ Socket health check failed: $e');
      return false;
    }
  }

// ✅ Check if currently connected to camera Wi-Fi
  Future<bool> _isConnectedToCameraWiFi() async {
    try {
      final ipAddress = await WiFiForIoTPlugin.getIP();

      if (ipAddress == null || ipAddress.isEmpty) {
        print('❌ No IP address - not connected to any Wi-Fi');
        return false;
      }

      // Check if IP is in camera's subnet (192.168.42.x)
      final isInCameraSubnet = ipAddress.startsWith('192.168.42.');

      if (isInCameraSubnet) {
        print('✅ Connected to camera Wi-Fi: $ipAddress');
      } else {
        print('❌ Not on camera network. Current IP: $ipAddress');
      }

      return isInCameraSubnet;
    } catch (e) {
      print('❌ Error checking Wi-Fi: $e');
      return false;
    }
  }

// ✅ Alternative: Check by SSID (if you know the camera's Wi-Fi name)
  Future<bool> _isConnectedToCameraWiFiBySSID() async {
    try {
      final ssid = await WiFiForIoTPlugin.getSSID();

      if (ssid == null || ssid.isEmpty) {
        print('❌ No SSID - not connected to any Wi-Fi');
        return false;
      }

      // Replace with your camera's actual SSID pattern
      // Examples: "Camera_XXXX", "RTSP_Camera", "YI_Action_XXXX", etc.
      final cameraSSIDPattern =
          RegExp(r'(Camera|RTSP|YI|ActionCam).*', caseSensitive: false);
      final isConnected = cameraSSIDPattern.hasMatch(ssid);

      if (isConnected) {
        print('✅ Connected to camera Wi-Fi: $ssid');
      } else {
        print('❌ Not connected to camera. Current SSID: $ssid');
      }

      return isConnected;
    } catch (e) {
      print('❌ Error checking SSID: $e');
      return false;
    }
  }
  void _onSocketDone() {
    StreamManager().addSpeedData(3);
    audioPlayer.play(AssetSource('audio/beep_warning.mp3'));
    toast("❌ Camera is disconnected");

    cameraWiBloc.add(const OnDisConnectedCam());

    print('🔌 Socket connection closed');
    _isConnected = false;
    _socket = null;
    _socketSubscription?.cancel();
    _socketSubscription = null;

    // ✅ Only auto-reconnect if still on camera Wi-Fi
    // _autoReconnectIfOnCameraWiFi();
  }

  void _onSocketError(error) {
    // audioPlayer.play(AssetSource('audio/beep_warning.mp3'));
    //
    // toast("❌ Camera is disconnected");


    if (error.toString().contains('Connection reset') ||
        error.toString().contains('Broken pipe')) {
      _isConnected = false;

      // ✅ Only auto-reconnect if still on camera Wi-Fi
      // _autoReconnectIfOnCameraWiFi();
    }
  }

// ✅ Auto-reconnect only when on camera Wi-Fi
  Future<void> _autoReconnectIfOnCameraWiFi() async {
    if (_isReconnecting) {
      print('⏭️ Reconnection already in progress, skipping...');
      return;
    }

    // ✅ Check if still connected to camera Wi-Fi
    final onCameraWiFi = await _isConnectedToCameraWiFi();
    // OR use SSID check: final onCameraWiFi = await _isConnectedToCameraWiFiBySSID();

    if (!onCameraWiFi) {
      print('❌ Not on camera Wi-Fi - skipping auto-reconnect');
      return;
    }

    _isReconnecting = true;
    print('🔄 Still on camera Wi-Fi - attempting auto-reconnect...');

    await Future.delayed(const Duration(seconds: 2));

    final result = await initSocket(retryCount: 3);

    if (result == 200) {
      print('✅ Auto-reconnect successful');
      toast('✅ Reconnected to camera');
    } else {
      print('❌ Auto-reconnect failed: $result');
      toast('❌ Failed to reconnect. Error: $result');
    }

    _isReconnecting = false;
  }

// ✅ Manual reconnect (called by user action)
  Future<int> reconnect() async {
    print('🔄 Manual reconnect requested...');

    final onCameraWiFi = await _isConnectedToCameraWiFi();

    if (!onCameraWiFi) {
      toast('❌ Please connect to camera Wi-Fi first');
      return 64;
    }

    // Close existing socket
    try {
      await _socket?.close();
    } catch (e) {
      print('Error closing socket: $e');
    } finally {
      _socket = null;
      _isConnected = false;
    }

    return await initSocket();
  }

  // void dispose() {
  //   if (_isConnected && _socket != null) {
  //     print('⚠️ Disposing connected socket - closing gracefully');
  //   }
  //   _isReconnecting = false;
  //   _socketSubscription?.cancel();
  //   _socket?.close();
  //   _socket = null;
  //   _isConnected = false;
  //   _lastSuccessfulConnection = null;
  // }

  final _connectivity = Connectivity();
  final _networkInfo = NetworkInfo();

  Future<bool> _waitForCameraNetwork({
    Duration timeout = const Duration(seconds: 12),
  }) async {
    final ipParts = cameraIp.split('.');
    if (ipParts.length != 4) {
      print('⚠️ cameraIp is not IPv4, skipping network wait: $cameraIp');
      return true;
    }

    final subnetPrefix = '${ipParts[0]}.${ipParts[1]}.${ipParts[2]}.';
    print(
        '🔍 Waiting for Wi-Fi on subnet $subnetPrefix (gateway ≈ $cameraIp)...');

    final deadline = DateTime.now().add(timeout);

    while (DateTime.now().isBefore(deadline)) {
      try {
        final rawConn = await _connectivity.checkConnectivity();
        bool onWifi;

        if (rawConn is List) {
          onWifi = rawConn.contains(ConnectivityResult.wifi);
        } else {
          onWifi = rawConn == ConnectivityResult.wifi;
        }

        if (!onWifi) {
          print('⏳ Not on Wi-Fi yet (conn = $rawConn), retrying...');
          await Future.delayed(const Duration(milliseconds: 500));
          continue;
        }

        final ip = await _networkInfo.getWifiIP();
        final gateway = await _networkInfo.getWifiGatewayIP();

        print('📡 Wi-Fi IP: $ip, gateway: $gateway');

        final onSameSubnet = (ip != null && ip.startsWith(subnetPrefix)) ||
            (gateway != null && gateway == cameraIp);

        if (onSameSubnet) {
          print('✅ Camera network OK (subnet $subnetPrefix, gateway $gateway)');
          return true;
        }

        print('⏳ On Wi-Fi but not camera subnet yet, retrying...');
        await Future.delayed(const Duration(milliseconds: 500));
      } catch (e) {
        print('⚠️ Error while checking Wi-Fi / IP: $e');
        return false;
      }
    }

    print('❌ Timed out waiting for camera network ($subnetPrefix)');
    return false;
  }

  Future<BatteryInfo?> getBatteryPower() async {
    if (token == null) {
      print("❌ Token is not available. Cannot get battery power.");
      return null;
    }

    _batteryCompleter = Completer<BatteryInfo>();
    print("🔋 Requesting battery power info...");

    _sendCommand({
      "msg_id": 13,
      "token": token,
      // "type": "get_power",
    });

    try {
      // Wait for response with timeout
      return await _batteryCompleter!.future.timeout(
        Duration(seconds: 5),
        onTimeout: () {
          print("⚠️ Battery power request timed out");
          return BatteryInfo(type: "unknown", value: "0");
        },
      );
    } catch (e) {
      print("❌ Error getting battery power: $e");
      return null;
    }
  }

  // void reconnectSocket() async {
  //   String serverIp = '192.168.42.1';
  //   int serverPort = 7878;
  //
  //   Socket.connect(serverIp, serverPort).then((Socket socket) {
  //     print('Connected to the server!');
  //     // Handle connection logic
  //   }).catchError((error) {
  //     print('Connection failed: $error');
  //     // Retry after some delay
  //     Future.delayed(Duration(seconds: 5), reconnectSocket);
  //   });
  // }

  /// Sends the start session command.
  void _startSession() {
    Map<String, dynamic> startSessionCmd = {"token": 0, "msg_id": 257};
    _sendCommand(startSessionCmd);
  }

  /// Encodes and sends a JSON command to the socket.
  void _sendCommand(Map<String, dynamic> command) {
    try {
      String jsonString = jsonEncode(command);
      _socket?.write(jsonString);
      print('Sent command: $jsonString');
    } catch (e) {
      print('Error sending command: $e');
    }
  }

  /// Buffers incoming data and processes complete JSON responses.
  void _onData(String data) {
    _responseBuffer += data;
    List<String> messages = _extractCompleteMessages(_responseBuffer);

    // If the last message is incomplete, leave it in the buffer.
    if (messages.isNotEmpty && !messages.last.trim().endsWith('}')) {
      _responseBuffer = messages.removeLast();
    } else {
      _responseBuffer = "";
    }

    for (var message in messages) {
      try {
        Map<String, dynamic> parsedResponse = jsonDecode(message);
        _processResponse(parsedResponse);
      } catch (e) {
        print("Failed to decode response: $message, error: $e");
      }
    }
  }

  /// Splits a string into a list of JSON messages using a simple heuristic.
  List<String> _extractCompleteMessages(String buffer) {
    List<String> parts = buffer.split('}{');
    if (parts.length > 1) {
      for (int i = 0; i < parts.length; i++) {
        if (i == 0 && !parts[i].startsWith('{')) {
          parts[i] = '{' + parts[i];
        }
        if (i != parts.length - 1 && !parts[i].endsWith('}')) {
          parts[i] = parts[i] + '}';
        }
        if (i != 0 && !parts[i].startsWith('{')) {
          parts[i] = '{' + parts[i];
        }
      }
    }
    return parts;
  }

  /// Processes a JSON-decoded response and completes waiting completers.
  void _processResponse(Map<String, dynamic> response) {
    print("Processing response: $response");
    if (response["rval"] == 0) {
      switch (response["msg_id"]) {
        case 257:
          // Session start response.
          if (response["param"] != null) {
            token = response["param"];
            // onSessionStarted!(token!);
          }
          break;
        case 260:
          // Stop viewfinder response.
          _stopVfCompleter?.complete();
          _stopVfCompleter = null;
          break;
        case 2:
          // Generic command response.
          _commandCompleter?.complete();
          _commandCompleter = null;
          break;
        case 259:
          // Viewfinder reset response (if needed).
          break;
        case 13:
          // Battery/Power info response
          if (response["type"] != null && response["param"] != null) {
            BatteryInfo info = BatteryInfo(
              type: response["type"],
              value: response["param"].toString(), // Convert to string
            );
            print("🔋 Battery Info: ${info.toString()}");

            // Complete the battery completer if waiting
            _batteryCompleter?.complete(info);
            _batteryCompleter = null;

            // Call the callback if provided
            onBatteryInfoReceived?.call(info);
          }
          break;
        default:
          print("Unhandled msg_id: ${response["msg_id"]}");
          break;
      }
    } else {
      print("Error in response: $response");
    }
  }

  /// Stops the viewfinder, sends a parameter command, and then restarts the viewfinder.
  Future<void> _updateParameter(String type, String value) async {
    if (token == null) {
      print("❌ Token is not available. Cannot update parameter.");
      return;
    }
    _stopVfCompleter = Completer<void>();
    print("🔴 Stopping Viewfinder before updating $type...");
    _sendCommand({"token": token, "msg_id": 260});
    await _stopVfCompleter?.future;

    _commandCompleter = Completer<void>();
    _sendCommand({
      "msg_id": 2,
      "param": value,
      "token": token,
      "type": type,
    });
    await _commandCompleter?.future;

    print("✅ Restarting Viewfinder after updating $type...");
    _sendCommand({"token": token, "msg_id": 259});
  }

  /// Sets a low video resolution.
  Future<void> setLowResolution(String resolution) async {
    await _updateParameter("video_resolution", resolution);
  }

  /// Resets live view by updating the field of view (FOV).
  Future<void> resetLiveView(String fov) async {
    print("CheckConnectivity_new == _Check_FOV");
    await _updateParameter("FOV", fov);
  }

  /// Resets live view by updating the field of view (FOV).
  Future<void> rebootView() async {
    await _updateParameter("Power", 'Power_Off');
  }

  /// Sets the light frequency.
  Future<void> setLightFreq(String lightFreq) async {
    await _updateParameter("light_freq", lightFreq);
  }

  /// Sets the ISO value. This command does not stop the live view.
  Future<void> setIso(String iso) async {
    if (token == null) {
      print("❌ Token is not available. Cannot set ISO.");
      return;
    }
    print("Setting ISO to $iso");
    _sendCommand({
      "msg_id": 2,
      "param": iso,
      "token": token,
      "type": "ISO",
    });
  }

  /// Sets the exposure value (EV).
  Future<void> setEv(String evValue) async {
    await _updateParameter("video_ev", evValue);
  }

  /// Sets the white balance.
  Future<void> setWhiteBalance(String whiteBalance) async {
    await _updateParameter("video_wb", whiteBalance);
  }

  // void _onSocketError(dynamic error) {
  //   print('Socket error: $error');
  //   _socket?.destroy();
  // }
  //
  // void _onSocketDone() {
  //   print('Socket disconnected.');
  //   _socket?.destroy();
  // }

  /// Closes the socket connection.
  // Future<void> disposeSocket() async {
  //   try {
  //     if(error != 404){
  //       _socket?.destroy();
  //
  //     }
  //
  //   } catch (e) {
  //     print("disposeSocket error: ${e.toString()}");
  //   }
  // }
  Future<void> disposeSocket() async {
    try {
      if (_socket != null) {
        // resetLiveView('80');
        // print('Disposing socket...');
        //
        // // Properly close the socket instead of destroy
        // await _socket?.close();
        // _socket = null;
        //
        // // Reset error state
        // error = 0;

        print('✓ Socket disposed successfully');
      } else {
        print('No active socket to dispose');
      }
    } catch (e) {
      print("disposeSocket error: ${e.toString()}");
      // Force null the socket even if error occurs
      _socket = null;
    }
  }
}

///With_battery
// class CameraSocketHandler {
//   final String cameraIp;
//   final int commandPort;
//   final Function(int) onSessionStarted;
//   final Function(BatteryInfo)? onBatteryInfoReceived;
//
//   Socket? _socket;
//   int? token;
//   String _responseBuffer = "";
//
//   // Completers for commands expecting a response.
//   Completer<void>? _stopVfCompleter;
//   Completer<void>? _commandCompleter;
//   Completer<BatteryInfo>? _batteryCompleter;
//   int error = 100;
//
//   final int rtspPort = 554;
//   final String rtspUrl = 'rtsp://192.168.42.1/live';
//
//   CameraSocketHandler({
//     required this.cameraIp,
//     required this.commandPort,
//     required this.onSessionStarted,
//     this.onBatteryInfoReceived,
//   });
//
//   Future<int> initSocket({
//     int retryCount = 3,
//     Duration retryDelay = const Duration(seconds: 2),
//   }) async {
//     int attempts = 0;
//
//     while (attempts < retryCount) {
//       attempts++;
//
//       try {
//         print('Attempt $attempts/$retryCount: Connecting to $cameraIp:$commandPort...');
//
//         if (_socket != null) {
//           try {
//             print('Closing existing socket...');
//             await _socket?.close();
//             _socket = null;
//             await Future.delayed(Duration(milliseconds: 1000));
//           } catch (e) {
//             print('Error closing existing socket: $e');
//             _socket = null;
//           }
//         }
//
//         _socket = await Socket.connect(
//           cameraIp,
//           commandPort,
//           timeout: Duration(seconds: 8),
//         );
//
//         print('✓ Successfully connected to $cameraIp:$commandPort');
//
//         _socket?.setOption(SocketOption.tcpNoDelay, true);
//
//         _startSession();
//
//         _socket?.map(utf8.decode).listen(
//           _onData,
//           onError: _onSocketError,
//           onDone: _onSocketDone,
//           cancelOnError: false,
//         );
//
//         error = 200;
//         return 200;
//
//       } on SocketException catch (e) {
//         print('✗ Socket error (attempt $attempts): ${e.message}');
//         print('Error code: ${e.osError?.errorCode}');
//
//         error = 404;
//         _socket = null;
//
//         if (attempts >= retryCount) {
//           print('❌ All attempts failed.');
//           return 404;
//         }
//
//         Duration currentDelay = retryDelay * attempts;
//         print('⏳ Retrying in ${currentDelay.inSeconds} seconds...');
//         await Future.delayed(currentDelay);
//
//       } on TimeoutException catch (e) {
//         print('✗ Timeout (attempt $attempts)');
//         error = 408;
//         _socket = null;
//
//         if (attempts >= retryCount) {
//           print('❌ Connection timeout.');
//           return 408;
//         }
//
//         Duration currentDelay = retryDelay * attempts;
//         print('⏳ Retrying in ${currentDelay.inSeconds} seconds...');
//         await Future.delayed(currentDelay);
//
//       } catch (e) {
//         print('✗ Error (attempt $attempts): $e');
//         error = 500;
//         _socket = null;
//
//         if (attempts >= retryCount) {
//           return 500;
//         }
//
//         Duration currentDelay = retryDelay * attempts;
//         print('⏳ Retrying in ${currentDelay.inSeconds} seconds...');
//         await Future.delayed(currentDelay);
//       }
//     }
//
//     return error;
//   }
//
//   void _startSession() {
//     Map<String, dynamic> startSessionCmd = {"token": 0, "msg_id": 257};
//     _sendCommand(startSessionCmd);
//   }
//
//   void _sendCommand(Map<String, dynamic> command) {
//     try {
//       String jsonString = jsonEncode(command);
//       _socket?.write(jsonString);
//       print('Sent command: $jsonString');
//     } catch (e) {
//       print('Error sending command: $e');
//     }
//   }
//
//   void _onData(String data) {
//     _responseBuffer += data;
//     List<String> messages = _extractCompleteMessages(_responseBuffer);
//
//     if (messages.isNotEmpty && !messages.last.trim().endsWith('}')) {
//       _responseBuffer = messages.removeLast();
//     } else {
//       _responseBuffer = "";
//     }
//
//     for (var message in messages) {
//       try {
//         Map<String, dynamic> parsedResponse = jsonDecode(message);
//         _processResponse(parsedResponse);
//       } catch (e) {
//         print("Failed to decode response: $message, error: $e");
//       }
//     }
//   }
//
//   List<String> _extractCompleteMessages(String buffer) {
//     List<String> parts = buffer.split('}{');
//     if (parts.length > 1) {
//       for (int i = 0; i < parts.length; i++) {
//         if (i == 0 && !parts[i].startsWith('{')) {
//           parts[i] = '{' + parts[i];
//         }
//         if (i != parts.length - 1 && !parts[i].endsWith('}')) {
//           parts[i] = parts[i] + '}';
//         }
//         if (i != 0 && !parts[i].startsWith('{')) {
//           parts[i] = '{' + parts[i];
//         }
//       }
//     }
//     return parts;
//   }
//
//   void _processResponse(Map<String, dynamic> response) {
//     print("Processing response: $response");
//     if (response["rval"] == 0) {
//       switch (response["msg_id"]) {
//         case 257:
//         // Session start response
//           if (response["param"] != null) {
//             token = response["param"];
//             onSessionStarted(token!);
//           }
//           break;
//         case 260:
//         // Stop viewfinder response
//           _stopVfCompleter?.complete();
//           _stopVfCompleter = null;
//           break;
//         case 2:
//         // Generic command response
//           _commandCompleter?.complete();
//           _commandCompleter = null;
//           break;
//         case 13:
//         // Battery/Power info response
//           if (response["type"] != null && response["param"] != null) {
//             BatteryInfo info = BatteryInfo(
//               type: response["type"],
//               value: response["param"].toString(), // Convert to string
//             );
//             print("🔋 Battery Info: ${info.toString()}");
//
//             // Complete the battery completer if waiting
//             _batteryCompleter?.complete(info);
//             _batteryCompleter = null;
//
//             // Call the callback if provided
//             onBatteryInfoReceived?.call(info);
//           }
//           break;
//         case 259:
//         // Viewfinder reset response
//           break;
//         default:
//           print("Unhandled msg_id: ${response["msg_id"]}");
//           break;
//       }
//     } else {
//       print("Error in response: $response");
//     }
//   }
//
//   Future<void> _updateParameter(String type, String value) async {
//     if (token == null) {
//       print("❌ Token is not available. Cannot update parameter.");
//       return;
//     }
//     _stopVfCompleter = Completer<void>();
//     print("🔴 Stopping Viewfinder before updating $type...");
//     _sendCommand({"token": token, "msg_id": 260});
//     await _stopVfCompleter?.future;
//
//     _commandCompleter = Completer<void>();
//     _sendCommand({
//       "msg_id": 2,
//       "param": value,
//       "token": token,
//       "type": type,
//     });
//     await _commandCompleter?.future;
//
//     print("✅ Restarting Viewfinder after updating $type...");
//     _sendCommand({"token": token, "msg_id": 259});
//   }
//
//   /// Gets the battery power information
//   /// Returns BatteryInfo with type (adapter/battery) and power level (0-5)
//   Future<BatteryInfo?> getBatteryPower() async {
//     if (token == null) {
//       print("❌ Token is not available. Cannot get battery power.");
//       return null;
//     }
//
//     _batteryCompleter = Completer<BatteryInfo>();
//     print("🔋 Requesting battery power info...");
//
//     _sendCommand({
//       "msg_id": 13,
//       "token": token,
//       // "type": "get_power",
//     });
//
//     try {
//       // Wait for response with timeout
//       return await _batteryCompleter!.future.timeout(
//         Duration(seconds: 5),
//         onTimeout: () {
//           print("⚠️ Battery power request timed out");
//           return BatteryInfo(type: "unknown", value: "0");
//         },
//       );
//     } catch (e) {
//       print("❌ Error getting battery power: $e");
//       return null;
//     }
//   }
//
//   Future<void> setLowResolution(String resolution) async {
//     await _updateParameter("video_resolution", resolution);
//   }
//
//   Future<void> resetLiveView(String fov) async {
//     await _updateParameter("FOV", fov);
//   }
//
//   Future<void> setLightFreq(String lightFreq) async {
//     await _updateParameter("light_freq", lightFreq);
//   }
//
//   Future<void> setIso(String iso) async {
//     if (token == null) {
//       print("❌ Token is not available. Cannot set ISO.");
//       return;
//     }
//     print("Setting ISO to $iso");
//     _sendCommand({
//       "msg_id": 2,
//       "param": iso,
//       "token": token,
//       "type": "ISO",
//     });
//   }
//
//   Future<void> setEv(String evValue) async {
//     await _updateParameter("video_ev", evValue);
//   }
//
//   Future<void> setWhiteBalance(String whiteBalance) async {
//     await _updateParameter("video_wb", whiteBalance);
//   }
//
//   void _onSocketError(dynamic error) {
//     print('Socket error: $error');
//     _socket?.destroy();
//   }
//
//   void _onSocketDone() {
//     print('Socket disconnected.');
//     _socket?.destroy();
//   }
//
//   Future<void> disposeSocket() async {
//     try {
//       if (_socket != null) {
//         print('Disposing socket...');
//
//         await _socket?.close();
//         _socket = null;
//
//         error = 0;
//
//         print('✓ Socket disposed successfully');
//       } else {
//         print('No active socket to dispose');
//       }
//     } catch (e) {
//       print("disposeSocket error: ${e.toString()}");
//       _socket = null;
//     }
//   }
// }
class BatteryInfo {
  final String type; // "adapter" or "battery"
  final String value; // "0", "1", "2", "3", "4", "5"

  BatteryInfo({required this.type, required this.value});

  /// Returns true if camera is charging (connected to USB/adapter)
  bool get isCharging => type == "adapter";

  /// Returns true if running on battery
  bool get isOnBattery => type == "battery";

  /// Returns battery percentage (0%, 25%, 50%, 75%, 100%)
  int get batteryPercentage {
    switch (value) {
      case "0":
        return 0;
      case "1":
        return 25;
      case "2":
        return 50;
      case "3":
        return 75;
      case "4":
      case "5":
        return 100;
      default:
        return 0;
    }
  }

  /// Returns a user-friendly status string
  String get status {
    if (isCharging) {
      return "Charging...";
    } else {
      return "Battery: $batteryPercentage%";
    }
  }

  @override
  String toString() {
    return 'BatteryInfo(type: $type, value: $value, ${status})';
  }
}
