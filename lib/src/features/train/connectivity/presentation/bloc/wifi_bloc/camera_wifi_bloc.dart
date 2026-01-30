// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pa_sreens/src/core/helper/native_bindings.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:wifi_iot/wifi_iot.dart';
// import 'package:wifi_scan/wifi_scan.dart';
// part 'camera_wifi_event.dart';
// part 'camera_wifi_state.dart';
// part 'camera_wifi_bloc.freezed.dart';
//
// @injectable
// class CameraWifiBloc extends Bloc<CameraWifiEvent, CameraWifiState> {
//   CameraWifiBloc() : super(const CameraWifiState.initial()) {
//     on<LoadWifiNetworks>((event, emit) async {
//       emit(const CameraWifiState.loading());
//
//       try {
//         ServiceStatus serviceStatus = await Permission.location.serviceStatus;
//         PermissionStatus status = await Permission.location.request();
//
//         if (serviceStatus == ServiceStatus.enabled) {
//           if (status.isGranted) {
//             try {
//               final List<WiFiAccessPoint?> networks =
//                   await WiFiScan.instance.getScannedResults();
//               log('stats of wifi try ${networks.length}');
//               emit(CameraWifiState.loaded(networks));
//             } catch (e) {
//               log('stats of wifi catch ${e.toString()}');
//               emit(CameraWifiState.error(e.toString()));
//             }
//           } else if (status == PermissionStatus.limited) {
//             emit(const CameraWifiState.error(
//                 'Location permission is limited, please go to settings and enable it'));
//           } else if (status == PermissionStatus.permanentlyDenied) {
//             emit(const CameraWifiState.error(
//                 'You permanently denied location permission, please go to settings and enable it'));
//           } else {
//             emit(const CameraWifiState.error(
//                 'Location permission is required to scan Wi-Fi networks.'));
//           }
//         } else {
//           emit(CameraWifiState.error(
//               'Location service is disabled, please go to settings and enable it $serviceStatus'));
//         }
//         // }
//       } catch (e) {
//         print('--------location issue ${e.toString()}');
//
//         emit(CameraWifiState.error(e.toString()));
//       }
//     });
//     on<ConnectToWifi>((event, emit) async {
//       emit(const CameraWifiState.loading());
//       try {
//         bool success = await WiFiForIoTPlugin.connect(
//           event.ssid,
//           security: NetworkSecurity.WPA,
//           password: event.passphrase, // Pass the passphrase here
//         );
//         if (success) {
//           emit(CameraWifiState.connected(event.ssid));
//           log('on emit of ${event.ssid}');
//         } else {
//           emit(CameraWifiState.error('Failed to connect to ${event.ssid}'));
//         }
//       } catch (e) {
//         emit(CameraWifiState.error(e.toString()));
//       }
//     });
//     on<GetConnectedSSID>((event, emit) async {
//       ServiceStatus serviceStatus = await Permission.location.serviceStatus;
//       if (serviceStatus == ServiceStatus.enabled) {
//         try {
//           await Permission.location.request();
//           if (Platform.isIOS) {
//             print('before getConnectedWifi');
//             final connectedSSID = NetworkInfo.getConnectedSSID();
//             print('ios on emit connectedSSID $connectedSSID');
//             if (connectedSSID != null) {
//               emit(CameraWifiState.connectedSSID(connectedSSID));
//             } else {
//               emit(const CameraWifiState.error(
//                   'No connected Wi-Fi network found'));
//             }
//           } else {
//             final connectedSSID = await WiFiForIoTPlugin.getSSID();
//             log('android on emit connectedSSID $connectedSSID');
//             emit(CameraWifiState.connectedSSID(connectedSSID ?? ''));
//           }
//         } catch (e) {
//           print('on emit error $e');
//           emit(CameraWifiState.error(e.toString()));
//         }
//       } else {
//         emit(CameraWifiState.error(
//             'Location service is disabled, please go to settings and enable it $serviceStatus'));
//       }
//     });
//   }
// }

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/helper/native_bindings.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

import '../../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../../core/services/locator/locator.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../session/presentation/bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import '../../../../session/presentation/component/fram_streaming_widget.dart';

part 'camera_wifi_event.dart';

part 'camera_wifi_state.dart';

part 'camera_wifi_bloc.freezed.dart';

@injectable
class CameraWifiBloc extends Bloc<CameraWifiEvent, CameraWifiState> {
  CameraWifiBloc() : super(const CameraWifiState.initial()) {
    // on<LoadWifiNetworks>((event, emit) async {
    //   emit(const CameraWifiState.loading());
    //   List<WiFiAccessPoint?> cameraNetworks = [] ;
    //
    //
    //   try {
    //     ServiceStatus serviceStatus = await Permission.location.serviceStatus;
    //     PermissionStatus status = await Permission.location.request();
    //
    //     if (serviceStatus == ServiceStatus.enabled) {
    //       if (status.isGranted) {
    //         try {
    //            List<WiFiAccessPoint?> networks = [];
    //             networks =
    //           await WiFiScan.instance.getScannedResults();
    //            cameraNetworks = networks
    //                .where((ap) => ap != null && looksLikeCameraSSID(ap.ssid))
    //                .cast<WiFiAccessPoint>()
    //                .toList();
    //
    //            // for (final ap in networks) {
    //            //   // if (ap == null || !looksLikeCameraSSID(ap.ssid)) continue;
    //            //
    //            //   // Try RTSP port check on common camera IP (assumes same IP structure)
    //            //   final ip = "192.168.42.5";
    //            //   final reachable = await testRTSPConnection(ip, 554);
    //            //   if (reachable) {
    //            //     cameraNetworks.add(ap);
    //            //   }
    //            // }
    //
    //   print('Filtered camera-like WiFi networks: ${networks.length}');
    //           print('WiFi networks found: ${cameraNetworks.length}');
    //           emit(CameraWifiState.loaded(cameraNetworks));
    //         } catch (e) {
    //           log('Error scanning WiFi networks: ${e.toString()}');
    //           emit(CameraWifiState.error(e.toString()));
    //         }
    //       } else if (status == PermissionStatus.limited) {
    //         emit(const CameraWifiState.error(
    //             'Location permission is limited, please enable it in settings.'));
    //       } else if (status == PermissionStatus.permanentlyDenied) {
    //         emit(const CameraWifiState.error(
    //             'You permanently denied location permission, enable it in settings.'));
    //       } else {
    //         emit(const CameraWifiState.error(
    //             'Location permission is required to scan Wi-Fi networks.'));
    //       }
    //     } else {
    //       emit(CameraWifiState.error(
    //           'Location service is disabled, please enable it in settings.'));
    //     }
    //   } catch (e) {
    //     log('Location issue: ${e.toString()}');
    //     emit(CameraWifiState.error(e.toString()));
    //   }
    // });
    //
    // on<GetConnectedSSID>((event, emit) async {
    //   ServiceStatus serviceStatus = await Permission.location.serviceStatus;
    //   if (serviceStatus == ServiceStatus.enabled) {
    //     try {
    //       await Permission.location.request();
    //       if (Platform.isIOS) {
    //         log('Checking WiFi connection on iOS...');
    //         final connectedSSID = NetworkInfo.getConnectedSSID();
    //         if (connectedSSID != null) {
    //           emit(CameraWifiState.connectedSSID(connectedSSID));
    //         } else {
    //           emit(const CameraWifiState.error(
    //               'No connected Wi-Fi network found.'));
    //         }
    //       } else {
    //         final connectedSSID = await WiFiForIoTPlugin.getSSID();
    //         log('Android connected to WiFi: $connectedSSID');
    //         emit(CameraWifiState.connectedSSID(connectedSSID ?? ''));
    //       }
    //     } catch (e) {
    //       log('Error checking connected WiFi: $e');
    //       emit(CameraWifiState.error(e.toString()));
    //     }
    //   } else {
    //     emit(CameraWifiState.error(
    //         'Location service is disabled, please enable it in settings.'));
    //   }
    // });

    on<LoadWifiNetworks>((event, emit) async {
      emit(const CameraWifiState.loading());
      List<WiFiAccessPoint> cameraNetworks = [];

      try {
        final serviceStatus = await Permission.location.serviceStatus;
        final permissionStatus = await Permission.location.request();
        await Permission.nearbyWifiDevices
            .request(); // For Android 13+ FireFly_8S_278571

        if (serviceStatus != ServiceStatus.enabled) {
          await Permission.location.request();
          await Permission.location.request();
          await Permission.nearbyWifiDevices
              .request(); // For Android 13+ FireFly_8S_278571
          emit(CameraWifiState.error(
              'Location service is disabled, please enable it in settings.'));
          return;
        }

        if (!permissionStatus.isGranted) {
          if (permissionStatus.isLimited) {
            emit(const CameraWifiState.error(
                'Location permission is limited, please enable it in settings.'));
          } else if (permissionStatus.isPermanentlyDenied) {
            emit(const CameraWifiState.error(
                'You permanently denied location permission, enable it in settings.'));
          } else {
            emit(const CameraWifiState.error(
                'Location permission is required to scan Wi-Fi networks.'));
          }
          return;
        }

        // ✅ Trigger system scan refresh (like going into Settings)
        final canScan = await WiFiScan.instance.canStartScan();
        if (canScan == CanStartScan.yes) {
          await WiFiScan.instance.startScan();
          await Future.delayed(
              const Duration(seconds: 3)); // Allow time for scan
        }
        // if(lastConnectedSsid==null) {
        //   try {
        //      WiFiForIoTPlugin.connect(
        //       "fire_fly",
        //       password: "12345678",
        //       timeoutInSeconds: 5,
        //       withInternet: false,
        //
        //     );
        //     print(
        //         "✅ Wi-Fi connection attempt done (success or fail silently).");
        //   } catch (e) {
        //     // Silent fail — no emit, no dialog
        //     print("⚠️ Wi-Fi connection failed silently: $e");
        //   }
        // }
        // ✅ Retrieve and filter scanned networks
        final List<WiFiAccessPoint?> networks =
            await WiFiScan.instance.getScannedResults();
        cameraNetworks = networks
            .where((ap) => ap != null && looksLikeCameraSSID(ap.ssid))
            .cast<WiFiAccessPoint>()
            .toList();

        print('Filtered camera-like WiFi networks: ${cameraNetworks.length}');
        emit(CameraWifiState.loaded(cameraNetworks));
      } catch (e) {
        log('Error during WiFi scanning: $e');
        emit(CameraWifiState.error('Failed to load Wi-Fi networks: $e'));
      }
    });

    on<DisconnectRtspCamera>((event, emit) async {
      emit(const CameraWifiState.loading());
      try {
        // 1) Check what we’re connected to (optional)
        String? currentSsid;
        if (Platform.isAndroid) {
          currentSsid = await WiFiForIoTPlugin.getSSID();
        } else {
          // If you already use NetworkInfo on iOS, you can await it here.
          // final info = NetworkInfo();
          // currentSsid = await info.getWifiName();
          currentSsid = null; // not required to proceed
        }

        final isCamera = currentSsid != null && getConnectedCamera(currentSsid);

        // 2) Always unbind app traffic from Wi-Fi first
        //    This immediately stops RTSP over Wi-Fi for your process.
        try {
          await WiFiForIoTPlugin.forceWifiUsage(false);
        } catch (_) {
          // ignore; not fatal
        }
// 2) Detect platform & SDK.
        final isAndroid = Platform.isAndroid;
        int sdk = 0;
        if (isAndroid) {
          final info = await DeviceInfoPlugin().androidInfo;
          sdk = info.version.sdkInt ?? 0;
        }

        // 3) Best-effort disconnects.
        if (isAndroid && sdk <= 28) {
          // Pre-Android 10: you can forcefully drop and even toggle Wi-Fi.
          try {
            await WiFiForIoTPlugin.disconnect();
          } catch (_) {}
          await Future.delayed(const Duration(milliseconds: 300));

          // Optional extra hammer on old devices: Wi-Fi off->on
          try {
            await WiFiForIoTPlugin.setEnabled(false);
            await Future.delayed(const Duration(seconds: 1));
            await WiFiForIoTPlugin.setEnabled(true);
          } catch (_) {}
        } else {
          // if (isAndroid) {
          //   WiFiSettings.openWiFiSettings();
          // }
          // Android 10+ (and iOS): cannot force system-level disconnect.
          // If still on the camera SSID, open the Wi-Fi panel so user can "Forget".
          String? ssidNow;
          try {
            ssidNow = await WiFiForIoTPlugin.getSSID();
          } catch (_) {}
          if (getConnectedCamera(ssidNow)) {
            if (isAndroid) {
              WiFiSettings.openWiFiSettings();
            } else {
              // await AppSettings.openWIFISettings();
            }
          }
        }

        // 4) Reset local flags and refresh list.
        lastConnectedSsid = null;
        withWire = null;
        if (event.isWireEnable) {
          add(const ConnectWithWire());
        } else {
          add(const LoadWifiNetworks());
        }
      } catch (e) {
        emit(CameraWifiState.error('Disconnect failed: $e'));
      }
    });
    on<OnDisConnectedCam>((event, emit) async {
      lastConnectedSsid = null;
      withWire = null;
      emit(const CameraWifiState.disConnectedCam());

      add(GetConnectedSSID());
    });

    on<GetConnectedSSID>((event, emit) async {
      await Permission.location.request();
      await Permission.location.request();
      await Permission.nearbyWifiDevices
          .request(); // For Android 13+ FireFly_8S_278571

      ServiceStatus serviceStatus = await Permission.location.serviceStatus;
      if (withWire == null || withWire == false) {
        if (serviceStatus == ServiceStatus.enabled) {
          try {
            await Permission.location.request();

            String? connectedSSID;

            if (Platform.isIOS) {
              log('Checking WiFi connection on iOS...');
              connectedSSID = NetworkInfo.getConnectedSSID();
            } else {
              connectedSSID = await WiFiForIoTPlugin.getSSID();
              log('Android connected to WiFi: $connectedSSID');
            }

            if (connectedSSID != null && getConnectedCamera(connectedSSID)) {
              lastConnectedSsid = connectedSSID;
              withWire = false;
              print('CheckConnectivity_new === 2');

              slRtspStreamingBloc.add(RtspStreamingEvent.socketConnectEvent());

              emit(CameraWifiState.connected(connectedSSID));

              add(const LoadWifiNetworks());
            } else {
              log('Android connected to WiFi_12: $connectedSSID');

              lastConnectedSsid = null;
              withWire = null;

              emit(const CameraWifiState.error(
                  'Not connected to a PulseAim camera.'));
              add(const LoadWifiNetworks());
            }
          } catch (e) {
            log('Error checking connected WiFi: $e');
            emit(CameraWifiState.error(e.toString()));
          }
        } else {
          emit(CameraWifiState.error(
              'Location service is disabled, please enable it in settings.'));
        }
      }
    });

    on<ConnectToWifi>((event, emit) async {
      if (withWire == null || withWire == false) {
        emit(const CameraWifiState.loading());
        try {
          emit(const CameraWifiState.loading());

          bool success = await WiFiForIoTPlugin.findAndConnect(
            event.ssid,
            // security: NetworkSecurity.WPA,
            password: event.passphrase, // Pass the passphrase here
          );

          if (success) {
            log('Connected to WiFi: ${event.ssid}');

            // ✅ Force WiFi usage (prevents using mobile data)
            await WiFiForIoTPlugin.forceWifiUsage(true);

            // ✅ Ensure the camera IP is reachable
            bool isCameraReachable = await canReachCamera("192.168.42.1");
            if (!isCameraReachable) {
              emit(CameraWifiState.error(
                  "Connected to ${event.ssid}, but cannot reach the camera."));
              return;
            }

            // ✅ Ensure RTSP is accessible before confirming connection
            bool rtspSuccess = await testRTSPConnection("192.168.42.1", 554);
            if (!rtspSuccess) {
              lastConnectedSsid = null;
              withWire = null;

              emit(CameraWifiState.error(
                  "Connected to ${event.ssid}, but RTSP stream is unreachable."));
              return;
            } else {
              lastConnectedSsid = event.ssid;
              withWire = false;

              emit(CameraWifiState.connected(event.ssid));
              add(const LoadWifiNetworks());
            }
          } else {
            emit(CameraWifiState.error('Failed to connect to ${event.ssid}'));
          }
        } catch (e) {
          emit(CameraWifiState.error(e.toString()));
        }
      }
    });
    on<ConnectWithWire>((event, emit) async {
      await _requestCameraPermission(emit);
      try {} catch (e) {
        emit(CameraWifiState.error(e.toString()));
      }
    });

    on<ConnectToWifiBackGround>((event, emit) async {
      ServiceStatus serviceStatus = await Permission.location.serviceStatus;

      if (withWire == null || withWire == false) {
        if (serviceStatus == ServiceStatus.enabled) {
          try {
            await Permission.location.request();

            String? connectedSSID;

            if (Platform.isIOS) {
              log('Checking WiFi connection on iOS...');

              connectedSSID = NetworkInfo.getConnectedSSID();
              if (connectedSSID != null) {
                lastConnectedSsid =
                (connectedSSID.toLowerCase().contains("firefly") ||
                    connectedSSID.toLowerCase().contains("pulseaim"))
                    ? connectedSSID
                    : null;
              }
              withWire = null;
              lastConnectedSsid = null;
              return;
            }
            else {
              connectedSSID = await WiFiForIoTPlugin.getSSID();
              log('Android connected to WiFi: $connectedSSID');
            }
            final found = await isNetworkAvailable(
                locator<LocalStorageService>().getFavNetworkSsid);
            if(found){
            if (connectedSSID != null && getConnectedCamera(connectedSSID)) {
              lastConnectedSsid = connectedSSID;
              withWire = false;
              print('CheckConnectivity_new === 1');
              slRtspStreamingBloc.add(RtspStreamingEvent.socketConnectEvent());

              emit(CameraWifiState.connected(connectedSSID));
              add(const LoadWifiNetworks());
            }
            else if (Platform.isIOS) {}
            else {
              final ssid = locator<LocalStorageService>().getFavNetworkSsid;
              final passphrase =
                  locator<LocalStorageService>().getFavNetworkPass;

              // ✅ Skip if no SSID or password saved

              if (ssid == null || passphrase == null) {
                // emit(const CameraWifiState.error("No saved Firefly Wi-Fi credentials."));
                return;
              }

              // ✅ Start auto-connect loop (30s max) if saved values are present
              await startPersistentFireflyConnectionLoop(
                ssid: ssid,
                passphrase: passphrase,
                emit: emit,
              );

              lastConnectedSsid = null;
              withWire = null;

              // emit(const CameraWifiState.error('Not connected to a Firefly camera.'));
              add(const LoadWifiNetworks());
            }
          }

          } catch (e) {
            log('Error checking connected WiFi: $e');
            // emit(CameraWifiState.error(e.toString()));
          }
        }
        else {
          // emit(CameraWifiState.error(
          //     'Location service is disabled, please enable it in settings.'));
        }
      }
    });
  }

  Future<bool> isNetworkAvailable(String? networkSsid) async {
    if(networkSsid==null|| networkSsid==''){
      return false;
    }else{
      // Get scanned networks
      final List<WiFiAccessPoint> networks = await WiFiScan.instance
          .getScannedResults();

      // Check if any network has this SSID
      final bool exists = networks.any(
            (ap) {
          print(ap.ssid);

          return  ap.ssid == networkSsid;
        },
      );
      print(exists);

      return exists;
    }

  }

  Timer? wifiMonitorTimer;
  String? lastConnectedSsid;
  bool? withWire;

  Future<void> _requestCameraPermission(Emitter<CameraWifiState> emit) async {
    try {
      PermissionStatus status = await Permission.camera.status;

      if (status.isDenied) {
        status = await Permission.camera.request();
      }

      if (status.isGranted) {
        if (withWire != null && withWire == true) {
          withWire = false;
          add(const LoadWifiNetworks());
        } else {
          withWire = true;
          lastConnectedSsid = null;
          withWire = true;
          emit(CameraWifiState.connected('wire'));
          add(const LoadWifiNetworks());
        }
      } else {}
    } catch (e) {
    } finally {}
  }

  Future<void> startPersistentFireflyConnectionLoop({
    required String ssid,
    required String passphrase,
    required Emitter<CameraWifiState> emit,
  })
  async {
    wifiMonitorTimer?.cancel(); // Ensure no previous loop is active
    await WiFiForIoTPlugin.forceWifiUsage(true);

    final startTime = DateTime.now();

    wifiMonitorTimer =
        Timer.periodic(const Duration(seconds: 5), (timer) async {
      final elapsed = DateTime.now().difference(startTime);

      // ⏱️ Auto-stop after 30 seconds
      if (elapsed > const Duration(seconds: 30)) {
        log("⏳ Timeout: Stopping WiFi monitor loop after 30 seconds.");
        stopPersistentConnectionLoop();
        if (!emit.isDone) {
          emit(CameraWifiState.error("Failed to connect within 30 seconds."));
        }
        return;
      }

      try {
        final canScan = await WiFiScan.instance.canStartScan();
        if (canScan == CanStartScan.yes) {
          await WiFiScan.instance.startScan();
          await Future.delayed(const Duration(seconds: 2));

          final List<WiFiAccessPoint?> networks =
              await WiFiScan.instance.getScannedResults();

          final firefly = networks.any(
            (ap) => ap != null && looksLikeCameraSSID(ap.ssid),
          );

          if (firefly != null) {
            final currentSSID = await WiFiForIoTPlugin.getSSID();

            // ✅ Already connected? Check IP and RTSP
            if (currentSSID == ssid) {
              final reachable = await canReachCamera("192.168.42.1");
              final rtsp = await testRTSPConnection("192.168.42.1", 554);

              if (reachable && rtsp) {
                log("✅ Already connected to Firefly: $ssid");
                stopPersistentConnectionLoop();
                if (!emit.isDone) {
                  lastConnectedSsid = ssid;
                  withWire = false;

                  emit(CameraWifiState.connected(ssid));
                  add(const LoadWifiNetworks());
                }
                return;
              } else {
                lastConnectedSsid = null;
                withWire = null;
              }
            }

            // 🔁 Attempt to connect
            final success = await WiFiForIoTPlugin.connect(
              ssid,
              security: NetworkSecurity.WPA,
              password: passphrase,
              withInternet: false,
              joinOnce: true,
            );

            if (success) {
              await WiFiForIoTPlugin.forceWifiUsage(true);

              final reachable = await canReachCamera("192.168.42.1");
              final rtsp = await testRTSPConnection("192.168.42.1", 554);

              if (reachable && rtsp) {
                toast('✅ Connected on $ssid');
                log("✅ Connected and RTSP reachable on $ssid");
                lastConnectedSsid = ssid;
                withWire = false;

                add(const LoadWifiNetworks());

                stopPersistentConnectionLoop();
                if (!emit.isDone) {
                  lastConnectedSsid = ssid;
                  withWire = false;

                  // emit(CameraWifiState.connected(ssid));
                  add(const LoadWifiNetworks());
                }
                return;
              } else {
                lastConnectedSsid = null;
                withWire = null;

                log("⚠️ Connected to $ssid, but camera or RTSP is unreachable.");
                if (!emit.isDone) {
                  emit(CameraWifiState.error(
                      "Connected to $ssid, but camera or RTSP stream unreachable."));
                }
              }
            } else {
              log("❌ Failed to connect to $ssid");
              if (!emit.isDone) {
                emit(CameraWifiState.error("Failed to connect to $ssid"));
              }
            }
          }
        }
      } catch (e) {
        log("🔥 Exception in WiFi monitor loop: $e");
        if (!emit.isDone) emit(CameraWifiState.error(e.toString()));
      }
    });
  }

  void stopPersistentConnectionLoop() {
    wifiMonitorTimer?.cancel();
    wifiMonitorTimer = null;
  }

  /// ✅ **Check if the Camera's IP is Reachable**
  Future<bool> canReachCamera(String ip) async {
    try {
      final result = await InternetAddress.lookup(ip);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      log("Camera ($ip) is unreachable: $e");
      return false;
    }
  }

  /// ✅ **Check if the RTSP Port is Open**
  Future<bool> testRTSPConnection(String ip, int port) async {
    try {
      Socket socket =
          await Socket.connect(ip, port, timeout: Duration(seconds: 5));
      log("RTSP connection successful on $ip:$port");
      socket.destroy();
      return true;
    } catch (e) {
      log("RTSP connection failed on $ip:$port: $e");
      return false;
    }
  }

  bool looksLikeCameraSSID(String? ssid) {
    if (ssid == null) return false;
    // return ssid.toLowerCase().contains("firefly");
    final lowerSsid = ssid.toLowerCase();

    return lowerSsid.contains("firefly") || lowerSsid.contains("pulseaim");
  }

  bool getConnectedCamera(String? ssid) {
    if (ssid == null) return false;
    // return ssid.toLowerCase().contains("firefly");
    final lowerSsid = ssid.toLowerCase();
    return lowerSsid.contains("firefly") || lowerSsid.contains("pulseaim");
  }
}
