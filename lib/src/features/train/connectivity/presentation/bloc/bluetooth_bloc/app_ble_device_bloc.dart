import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/utils/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../../core/utils/read_decode.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../session/data/model/session_model.dart';
import '../../../../session/presentation/view/session_start_view.dart';
import 'timer_bloc/listning_timer_bloc.dart';

part 'app_ble_device_event.dart';

part 'app_ble_device_state.dart';

part 'app_ble_device_bloc.freezed.dart';

ListningTimerBloc listeningTimerBloc = locator<ListningTimerBloc>();

@injectable
class AppBleDeviceBloc extends Bloc<AppBleDeviceEvent, AppBleDeviceState> {
  final Map<DeviceIdentifier, StreamSubscription> _deviceSubscriptions = {};
  BluetoothCharacteristic? _characteristic;
  int _signalCounter = 0;
  bool _shouldListen = false;
  StreamSubscription<List<int>>? _characteristicSubscription;
  BluetoothDevice? deviceConn;

  late BluetoothService service;
  late BluetoothCharacteristic receiveCharacteristic;
  late BluetoothCharacteristic sendCharacteristic;

  AppBleDeviceBloc() : super(const AppBleDeviceState.initial()) {
    on<StartScanning>(_onStartScanning);
    on<InitializeBluetooth>(_onInitializeBluetooth);
    on<StopScanning>(_onStopScanning);
    on<DeviceDiscovered>(_onDeviceDiscovered);
    on<ConnectToDevice>(_onConnectToDevice);
    on<BackgroundConnectToBLEDevice>(backgroundConnectToBLEDevice);
    on<GetConnectedDevice>(_getConnectedDevice);
    on<DisconnectDevice>(_onDisconnectDevice);
    on<SendCommand>(_onCommandSend);
    on<SendCommandSingle>(_onCommandSendSingle);
    on<ScanTimeout>(_onScanTimeout);
    on<CheckBluetoothStatus>(_onCheckBluetoothStatus);
    on<ListenToConnectionStateChanges>(_listenToConnectionStateChanges);
    on<DiscoverServices>(_onDiscoverServices);
    on<ListenToCharacteristic>(_onListenToCharacteristic);
    on<StartListening>(_onStartListening);
    on<StopListening>(_onStopListening);
    on<SignalReceived>(_onSignalReceived);
  }

  void setCharacteristic(BluetoothCharacteristic characteristic) {
    _characteristic = characteristic;
  }

  void _onStartListening(
    StartListening event,
    Emitter<AppBleDeviceState> emit,
  ) async {
    if (_characteristic != null) {
      print("_characteristic length is $_characteristic");
      try {
        _shouldListen = true;
        emit(const AppBleDeviceState.listeningActive(true));
        if (_shouldListen) {
          await _characteristic!.setNotifyValue(_shouldListen);
          _characteristicSubscription =
              _characteristic!.onValueReceived.listen((value) {
            List decodedValue = DecodeRead().uInt32B(value);
            String receivedData = decodedValue[0].toString();
            // print("state is _onStartListening===2");
            if (_shouldListen) {
              if (receivedData == '1437206016') {
                print("state is _onStartListening===0");

                final state = listeningTimerBloc.state;
                print("state is _onStartListening===${state.toString()}");

                if (state is TimerInitial) {
                  print("==== _onStartListening state is TimerInitial");
                  add(const SignalReceived());
                }
                else if (state is OnShotDetected) {
                  // listeningTimerBloc.add(const ListningTimerEvent.stopTimer());
                  print("state is OnShotDetected===$state");
                }
                else if (state is TimerRunning) {
                  print("state is TimerRunning${state.secondsLeft}");
                }
              }
            }
          });
        }
      } catch (e) {
        emit(AppBleDeviceState.error('Failed to discover characteristic: $e'));
      }
    } else {
      emit(
          const AppBleDeviceState.error('Characteristic with UUID not found.'));
    }
  }

  Future<void> _onStopListening(
    StopListening event,
    Emitter<AppBleDeviceState> emit,
  ) async {
    if(event.isListen){
      _signalCounter = 0;
      await _characteristicSubscription?.cancel();
      _characteristicSubscription = null;
      if (_characteristic != null && _shouldListen && deviceConn != null) {
        _shouldListen = false;
        await _characteristic?.setNotifyValue(false);
        emit(const AppBleDeviceState.counterUpdated(0));
        emit(const AppBleDeviceState.listeningActive(false));
      } else if (deviceConn == null) {
        emit(const AppBleDeviceState.deviceIsDisconnected());
      }
    }else{

      _shouldListen = _shouldListen?false:true;
    }


  }

  void _onSignalReceived(
    SignalReceived event,
    Emitter<AppBleDeviceState> emit,
  ) {
    // if (stateBle_counter == listShoots.length || stateBle_counter==0) {
    if (_shouldListen) {
      _signalCounter++;
      print("======================= if _signalCounter is $_signalCounter");
      emit(AppBleDeviceState.counterUpdated(_signalCounter));
      listeningTimerBloc.add(const ListningTimerEvent.startTimer());
    }
    // } else {
    //   shootModel = ShootModel(
    //       parTime: 0,
    //       shootImagePath: "imgPath",
    //       shootNumber: stateBle_counter,
    //       shootScore: 0,
    //       shotDirection: '🔴');
    //   listShoots.add(shootModel);
    //
    //   listeningTimerBloc.add(const ListningTimerEvent.onShotDetectedEvent(true));
    //
    //   if (_shouldListen) {
    //     listeningTimerBloc.add(const ListningTimerEvent.startTimer());
    //     _signalCounter++;
    //     print("======================= _signalCounter is $_signalCounter");
    //     emit(AppBleDeviceState.counterUpdated(_signalCounter));
    //   }
    // }
  }

  Future<void> _onDiscoverServices(
    DiscoverServices event,
    Emitter<AppBleDeviceState> emit,
  ) async {
    // if (!_shouldListen) return; // Only proceed if listening is active

    try {
      List<BluetoothService> services = await event.device.discoverServices();
      emit(AppBleDeviceState.servicesDiscovered(event.device, services));
      for (BluetoothService service in services) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          if (characteristic.uuid.toString() == receiveCharacteristicUuid) {
            setCharacteristic(characteristic);
            add(AppBleDeviceEvent.listenToCharacteristic(characteristic));
          }
        }
      }
    } catch (e) {
      emit(AppBleDeviceState.error('Failed to discover services: $e'));
    }
  }

  void _onListenToCharacteristic(
    ListenToCharacteristic event,
    Emitter<AppBleDeviceState> emit,
  ) {
    if (!_shouldListen) {
      return; // Only listen to characteristics if listening is active
    }

    event.characteristic.lastValueStream.listen((value) {
      print('Received characteristic value: $value');
      emit(AppBleDeviceState.characteristicListening(event.characteristic));
    });
  }

  Future<BluetoothDevice?> getConnectedDevice() async {
    List<BluetoothDevice> connectedDevices = FlutterBluePlus.connectedDevices;
    if (connectedDevices.isNotEmpty) {
      return connectedDevices.first;
    } else {
      return null;
    }
  }

  Future<void> _onCheckBluetoothStatus(
      CheckBluetoothStatus event, Emitter<AppBleDeviceState> emit) async {
    const isOn = BluetoothAdapterState.on == BluetoothAdapterState.on;
    print("BluetoothAdapterState====: $isOn");
    emit(const AppBleDeviceState.bluetoothStatus(isOn));
    if (isOn) {
      add(const StartScanning());
    }
  }

  void _onScanTimeout(ScanTimeout event, Emitter<AppBleDeviceState> emit) {
    // Stop the scanning and update the state
    add(const AppBleDeviceEvent.checkBluetoothStatus());

    emit(const AppBleDeviceState.isScanning(false));
    emit(const AppBleDeviceState.error("Scan timed out"));
  }

  void _listenToConnectionStateChanges(
      ListenToConnectionStateChanges event, Emitter<AppBleDeviceState> emit) {
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        final device = result.device;
        device.connectionState.listen((state) {
          if (state == BluetoothConnectionState.disconnected) {
            add(AppBleDeviceEvent.disconnectDevice(device));
            add(const StartScanning());
          }
        });
      }
    });
  }

  void _onConnectToDevice(
      ConnectToDevice event, Emitter<AppBleDeviceState> emit) async {
    try {
      // emit(const AppBleDeviceState.isConnecting(true));
      _scanTimeoutTimer?.cancel();
      _scanEmptyTimer?.cancel();
      await FlutterBluePlus.stopScan();
      await event.device.connect();
      _listenForDeviceDisconnection(event.device);
      add(const AppBleDeviceEvent.stopScanning());
      // emit(const AppBleDeviceState.isScanning(false));
      // emit(const AppBleDeviceState.isConnecting(false));
      add(AppBleDeviceEvent.discoverServices(event.device));
      emit(AppBleDeviceState.connected(event.device));
      deviceConn = event.device;
          add(SendCommandSingle(5));
      add(const InitializeBluetooth());
      toast('✅ Connected to ${event.device.platformName}');
    } catch (e) {
      emit(AppBleDeviceState.error("$e\nFailed to connect to device"));
    }
  }

  void _listenForDeviceDisconnection(BluetoothDevice device) {
    final subscription = device.connectionState.listen((state) {
      if (state == BluetoothConnectionState.disconnected) {
        add(DisconnectDevice(device));
      }
    });
    _deviceSubscriptions[device.remoteId] = subscription;
  }

  backgroundConnectToBLEDevice(
      AppBleDeviceEvent event, Emitter<AppBleDeviceState> emit) async {
    deviceConn = null;
    final targetId = locator<LocalStorageService>().getFavoriteBLEId;
    // if (targetId == null || deviceConn?.remoteId != null) return;
    if (targetId == null) return;

    print("targetId : $targetId");
    emit(const AppBleDeviceState.isScanning(true));

    late StreamSubscription<List<ScanResult>> scanSubscription;
    final completer = Completer<void>();

    scanSubscription = FlutterBluePlus.scanResults.listen((results) async {
      for (ScanResult result in results) {
        final device = result.device;
        if (device.remoteId.str == targetId) {
          // filteredDevices.add(device);
          // // updatedDevices.add(event.device);
          // emit(AppBleDeviceState.scanning(filteredDevices, timerEnded));

          await scanSubscription.cancel();
          await FlutterBluePlus.stopScan();
          print("✅ Found target BLE device: ${device.platformName}");

          add(AppBleDeviceEvent.connectToDevice(
              device)); // Triggers _onConnectToDevice

          if (!completer.isCompleted) completer.complete(); // Stop wait early
          return;
        }
      }
    });

    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 30));

    // Wait for 30 seconds or until the completer is triggered
    await Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 30)),
    ]);

    // Stop scan if it wasn't already stopped
    if (FlutterBluePlus.isScanningNow) {
      await FlutterBluePlus.stopScan();
    }
    await scanSubscription.cancel();

    if (!completer.isCompleted) {
      // emit(const AppBleDeviceState.error("❌ Failed to find BLE device within 30 seconds"));
    }

    emit(const AppBleDeviceState.isScanning(false));
  }

  Future<void> _onInitializeBluetooth(
      InitializeBluetooth event, Emitter<AppBleDeviceState> emit) async {
    try {
      if (Platform.isAndroid) {
        await FlutterBluePlus.turnOn();
        await Permission.location.request();
        add(const StartScanning());

        add(const AppBleDeviceEvent.checkBluetoothStatus());
      } else {
        add(const StopScanning());
        add(const StartScanning());
      }
    } catch (e) {
      emit(AppBleDeviceState.error(e.toString()));
    }
  }

  void _getConnectedDevice(
      GetConnectedDevice event, Emitter<AppBleDeviceState> emit) async {
    BluetoothDevice? device = await getConnectedDevice();
    if (device != null) {
      emit(AppBleDeviceState.connected(device));
    } else {}
  }

  // void _onDeviceDiscovered(
  //     DeviceDiscovered event, Emitter<AppBleDeviceState> emit) {
  //   final currentState = state;
  //   if (currentState is Scanning) {
  //     if (event.device.platformName.startsWith("GMSync") ||
  //         event.device.platformName.startsWith("ShotPulse")) {
  //       // deviceFound = true;

  //       var updatedDevices = List<BluetoothDevice>.from(currentState.devices);
  //       updatedDevices =
  //           updatedDevices.fold<List<BluetoothDevice>>([], (prev, element) {
  //         if (!prev.any((e) => e.remoteId == element.remoteId)) {
  //           prev.add(element);
  //         }
  //         return prev;
  //       });
  //       // final deviceExists =
  //       //     updatedDevices.any((device) => device.remoteId == device.remoteId);
  //       print('========In the relam============= ${event.device.remoteId}');
  //       // if (!deviceExists) {
  //       updatedDevices.add(event.device);
  //       filteredDevices = updatedDevices;
  //       emit(AppBleDeviceState.scanning(filteredDevices, timerEnded));
  //       // }
  //     }
  //   }
  // }

  void _onDeviceDiscovered(
      DeviceDiscovered event, Emitter<AppBleDeviceState> emit) {
    final currentState = state;
    // &&
    // (event.device.platformName.startsWith("GMSync") ||
    // event.device.platformName.startsWith("ShotPulse"))

    if (currentState is Scanning &&
        (event.device.platformName.startsWith("GMSync") ||
            event.device.platformName.contains("amba") ||
            event.device.platformName.startsWith("ShotPulse") ||
            event.device.platformName.startsWith("PulseAimBle") ||
            event.device.platformName.startsWith("PulseAim"))) {
      // var updatedDevices = List<BluetoothDevice>.from(currentState.devices);

      final alreadyExists = filteredDevices.any(
        (device) => device.remoteId.str == event.device.remoteId.str,
      );

      if (!alreadyExists) {
        print(
            'Running timer...44 - Adding new device: ${event.device.platformName}');
        filteredDevices.add(event.device);
        // updatedDevices.add(event.device);
        emit(AppBleDeviceState.scanning(filteredDevices, timerEnded));
      } else {
        if (!emit.isDone) {
          print('Running timer...55 - Device already exists, skipping');

          // emit(AppBleDeviceState.scanning(filteredDevices, true));
          add(const StopScanning());
        }
      }

      // print('Running timer...33-----${updatedDevices.length}');
      //
      // // Add the device only if it doesn't already exist
      // if (!updatedDevices
      //     .any((device) => device.remoteId == event.device.remoteId)) {
      //   print('Running timer...44');
      //
      //   filteredDevices.add(event.device);
      //   // filteredDevices.addAll(updatedDevices);
      //   emit(AppBleDeviceState.scanning(filteredDevices, timerEnded));
      // }
    }
  }

  List<BluetoothDevice> filteredDevices = [];
  bool timerEnded = true;

  bool loopingDevices(List<ScanResult> results) {
    for (var result in results) {
      final platformName = result.device.platformName.toLowerCase();
      print("Checking device: {-$platformName-} - ${result.device.remoteId}");
      if (platformName.startsWith("gmsync") ||
          platformName.contains("amba") ||
          platformName.startsWith("shotpulse")) {
        print("Match found for: $platformName");
        return false;
      }
    }
    print("No matching devices found.");
    return true;
  }

/*
  void _onStartScanning(
      StartScanning event, Emitter<AppBleDeviceState> emit) async {
    BluetoothDevice? device = await getConnectedDevice();
    bool deviceFound = false;
    bool nodeviceFound = false;
    bool onceAfterLoop = true;

    // Reset the state to scanning with an empty list to refresh the UI
    emit(const AppBleDeviceState.scanning([], false));

    if (device != null) {
      emit(AppBleDeviceState.connected(device));
    } else {
      print("Device connected======2");

      // Start scanning with a timeout
      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));

      FlutterBluePlus.scanResults.listen((results) {
        if (results.isNotEmpty) {
          for (ScanResult result in results) {
            print(" Outer Device found: ${result.device.platformName}");
            if (result.device.platformName.isNotEmpty) {
              deviceFound = true;
              print("Device found: ${result.device.platformName}");

              final device = result.device;
              device.connectionState.listen((state) {
                if (state == BluetoothConnectionState.disconnected) {
                  add(AppBleDeviceEvent.deviceDiscovered(result.device));
                }
              });
            }
          }
        }

        _scanTimeoutTimer?.cancel();
        _scanTimeoutTimer = Timer(const Duration(seconds: 10), () {
          if (!deviceFound || nodeviceFound) {
            log('No devices found within timeout.');
            add(const StopScanning());
          } else {
            bool hasNonMatchingDevices = loopingDevices(results);
            if (onceAfterLoop) {
              onceAfterLoop = false;
              if (hasNonMatchingDevices) {
                log('Non-matching devices detected.');
                add(const StopScanning());
              } else {
                log('Matching devices found; scan continues.');
              }
            }
          }
        });
      }, onError: (error) {
        log('Error during scan: $error');
        emit(const AppBleDeviceState.error('Scan failed.'));
      }, onDone: () {
        log('Scan completed.');
      });
    }
  }
*/

  void _onStopScanning(
      StopScanning event, Emitter<AppBleDeviceState> emit) async {
    // await FlutterBluePlus.stopScan();
    emit(AppBleDeviceState.scanning(filteredDevices, true));
  }

  void _onStartScanning(
      StartScanning event, Emitter<AppBleDeviceState> emit) async {
    deviceConn = null;
    BluetoothDevice? device = await getConnectedDevice();
    filteredDevices = [];
    bool deviceFound = false;
    bool nodeviceFound = false;
    timerEnded = false;
    bool newScan = true;
    bool onceAfterLoop = true;
    List<ScanResult> res = [];
    StreamSubscription<List<ScanResult>>? streamSubscription;

    emit(const AppBleDeviceState.scanning([], false));
// print("Track_Ble_issue==1");
    if (device != null) {
      deviceConn = device;
      filteredDevices.add(device);
      // emit(AppBleDeviceState.scanning(filteredDevices, timerEnded));

      // emit(AppBleDeviceState.connected(device));
    }
    // else {

    if (FlutterBluePlus.isScanningNow) {
      res.clear();
    } else {
      await FlutterBluePlus.startScan();
    }

    if (!timerEnded) {
      // Listen to scan results
      res.clear();
      streamSubscription = FlutterBluePlus.scanResults.listen((results) {
        // int fL = filteredDevices.length;
        // filteredDevices.retainWhere((device) {
        //   final exists =
        //       results.any((r) => r.device.remoteId == device.remoteId);
        //   print('Device: ${device.remoteId}, =FL Exists in results: $exists');
        //   return exists;
        // });
        // if (fL != filteredDevices.length) {
        //   print("Device found: ====================================== =FL");
        //   add(const StopScanning());
        // }
        res = results;
        if (newScan) {
          newScan = false;
          res.clear();
        }
        if (res.isNotEmpty) {
          for (ScanResult result in res) {
            // print("Device found: ${result.device.platformName}");
            if (result.device.platformName.isNotEmpty) {
              deviceFound = true;
              final device = result.device;
              if (!timerEnded) {
                device.connectionState.listen((state) {
                  if (state == BluetoothConnectionState.disconnected) {
                    add(AppBleDeviceEvent.deviceDiscovered(result.device));
                  }
                });
              }
            }
          }
        } else {
          print('No results found.');
        }
      }, onError: (error) {
        log('Error during scan: $error');
        emit(const AppBleDeviceState.error('Scan failed.'));
      }, onDone: () {
        print('Scan completed.');
      });
    } else {
      print("=====ElSE");
    }

    // Timeout timer
    _scanTimeoutTimer?.cancel();
    _scanEmptyTimer?.cancel();
    _scanTimeoutTimer = Timer(const Duration(seconds: 10), () async {
      // int fL = filteredDevices.length;
      // filteredDevices.retainWhere((device) {
      //   final exists = res.any((r) => r.device.remoteId == device.remoteId);
      //   print('Device: ${device.remoteId}, Exists in res: $exists');
      //   return exists;
      // });
      // if (fL != filteredDevices.length) {
      //   print("Device found: ====================================== FL");
      //   add(const StopScanning());
      // }
      await streamSubscription?.cancel();
      streamSubscription = null; // Avoid potential reuse
      timerEnded = true;
      res = [];
      log('Stopped scanning due to timeout.');
      add(const StopScanning());

      // if (!deviceFound || nodeviceFound) {
      //   log('No devices found within timeout.');
      //   add(const StopScanning());
      // } else {
      //   bool hasNonMatchingDevices = loopingDevices(res);
      //   if (onceAfterLoop) {
      //     // final futureDevices = FlutterBluePlus.lastScanResults;
      //     // int fL = filteredDevices.length;
      //     // filteredDevices.retainWhere((device) {
      //     //   final exists = futureDevices
      //     //       .any((r) => r.device.remoteId != device.remoteId);
      //     //   print(
      //     //       'Device: ${device.remoteId}, Exists in res: $futureDevices');
      //     //   return exists;
      //     // });
      //     // if (fL != filteredDevices.length) {
      //     //   print("Device found: ====================================== FL");
      //     //   add(const StopScanning());
      //     // }
      //     onceAfterLoop = false;
      //     if (hasNonMatchingDevices) {
      //       log('Non-matching devices detected.');
      //       add(const StopScanning());
      //     } else {
      //       add(const StopScanning());
      //       log('Matching devices found; scan continues.');
      //     }
      //   }
      // }
    });
    _scanEmptyTimer = Timer(const Duration(seconds: 4), () async {
      if (res.isEmpty) {
        log('No devices found within 4 seconds.');
      }
    });
    // }
  }

  void _onDisconnectDevice(
      DisconnectDevice event, Emitter<AppBleDeviceState> emit) async {
    try {
      deviceConn = null;

      await event.device.disconnect();
      emit(const AppBleDeviceState.deviceIsDisconnected());

      add(const StopListening(true));
      toast('⚠️ Device Disconnected');
    } catch (e) {
      emit(const AppBleDeviceState.error("Device Disconnected"));
    }
  }

  void _onCommandSend(
      SendCommand event, Emitter<AppBleDeviceState> emit) async {
    int ditCommand = event.ditCommand;
    int dvcCommand = event.dvcCommand;
    int swdCommand = event.swdCommand;
    int swbdCommand = event.swbdCommand;

    print(
        "Command Recieved : $ditCommand,$dvcCommand,$swdCommand,$swbdCommand");
    List<int> ditC;
    List<int> dvcC;
    List<int> swdC;
    List<int> swbdC;

    switch (ditCommand) {
      case 15:
        print("3");
        // 12g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x78, 0x00];
        break;
      case 14:
        print("3");
        // 12g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x70, 0x00];
        break;
      case 13:
        print("3");
        // 12g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x68, 0x00];
        break;
      case 12:
        print("3");
        // 12g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x60, 0x00];
        break;
      case 11:
        print("4");
        // 11g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x58, 0x00];
        break;
      case 10:
        print("5");
        // 10g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x50, 0x00];
        break;
      case 9:
        print("6");
        // 9g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x48, 0x00];
        break;
      case 8:
        print("7");
        // 8g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x40, 0x00];
        break;
      case 7:
        print("8");
        // 7g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x38, 0x00];
        break;
      case 6:
        print("9");
        // 6g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x30, 0x00];
        break;
      case 5:
        print("10");
        // 5g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x28, 0x00];
        break;
      case 4:
        print("11");
        // 4g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x20, 0x00];
        break;
      case 3:
        print("12");
        // 3g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x18, 0x00];
        break;
      case 2:
        print("13");
        // 2g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x10, 0x00];
        break;
      case 1:
        print("14");
        // 1g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x08, 0x00];
        break;
      default:
        print("5");
        // Defaulting to 10g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x50, 0x00];
        break;
    }

    switch (dvcCommand) {
      case 1:
        // Command for 1
        dvcC = [0x55, 0xAA, 0x03, 0x01, 0x01];
        print("----------------------------1");
        break;
      case 2:
        // Command for 2
        dvcC = [0x55, 0xAA, 0x03, 0x01, 0x05];
        print("----------------------------2");
        break;
      case 3:
        // 3
        dvcC = [0x55, 0xAA, 0x03, 0x01, 0X0A];
        print("----------------------------3");
        break;
      case 4:
        // 4
        dvcC = [0x55, 0xAA, 0x03, 0x01, 0X19];
        print("----------------------------4");
        break;
      case 5:
        // 5
        dvcC = [0x55, 0xAA, 0x03, 0x01, 0X32];
        print("----------------------------5");
        break;
      case 6:
        // 6
        dvcC = [0x55, 0xAA, 0x03, 0x01, 0X4B];
        print("----------------------------6");
        break;
      default:
        dvcC = [0x55, 0xAA, 0x03, 0x01, 0x64];
        print("-Default --------------------------5");
        break;
    }

    // Handle SWD command
    switch (swdCommand) {
      case 1:
        print("1");
        // Command for 1
        swdC = [0x55, 0xAA, 0x04, 0x01, 0x01];
        break;
      case 2:
        print("2");
        // Command for 2
        swdC = [0x55, 0xAA, 0x04, 0x01, 0x05];
        break;
      case 3:
        print("3");
        // 3
        swdC = [0x55, 0xAA, 0x04, 0x01, 0X0A];
        break;
      case 4:
        print("4");
        // 4
        swdC = [0x55, 0xAA, 0x04, 0x01, 0X14];
        print("----------------------------4");
        break;
      case 5:
        print("5");
        // 5
        swdC = [0x55, 0xAA, 0x04, 0x01, 0X32];
        break;
      case 6:
        print("6");
        // 5
        swdC = [0x55, 0xAA, 0x04, 0x01, 0X64];
        break;
      default:
        print("0");
        swdC = [0x55, 0xAA, 0x04, 0x01, 0xFF];
        break;
    }

    switch (swbdCommand) {
      case 1:
        print("1");
        // Command for 1
        swbdC = [0x55, 0xAA, 0x05, 0x01, 0x01];
        break;
      case 2:
        print("2");
        // Command for 2
        swbdC = [0x55, 0xAA, 0x05, 0x01, 0x05];
        break;
      case 3:
        print("3");
        // 3
        swbdC = [0x55, 0xAA, 0x05, 0x01, 0X0A];
        break;
      case 4:
        print("4");
        // 4
        swbdC = [0x55, 0xAA, 0x05, 0x01, 0X19];
        print("----------------------------4");
        break;
      case 5:
        print("5");
        // 5
        swbdC = [0x55, 0xAA, 0x05, 0x01, 0X32];
        break;
      case 6:
        print("1");
        swbdC = [0x55, 0xAA, 0x05, 0x01, 0x64];
        break;
      default:
        print("1");
        swbdC = [0x55, 0xAA, 0x05, 0x01, 0xFF];
        break;
    }

    // The rest of your code
    print('In send command func ');
    List<BluetoothService> services = await deviceConn!.discoverServices();
    print("services length is ${services.length}");

    for (var serv in services) {
      print("service is ${serv.uuid}");
      if (serv.uuid.toString() == serviceUuid) {
        print("service match ${serv.uuid.toString()}");
        service = serv;
      }
    }

    print('after service check');
    print("match service uuid is ${service.uuid}");

    for (var char in service.characteristics) {
      print('Char uuids: ${char.uuid.toString()}');
      if (char.uuid.toString() == receiveCharacteristicUuid) {
        print("char match for read ${char.uuid.toString()}");
        receiveCharacteristic = char;
        print("char is $receiveCharacteristic");
        await receiveCharacteristic.setNotifyValue(true);
      }
      if (char.serviceUuid.toString() == 'b3a0') {
        print("char match for write uuid ${char.uuid.toString()}");
        sendCharacteristic = char;

        // Check if the characteristic is writable
        if (sendCharacteristic.properties.write) {
          print("Before Writing the command");

          // Write the new command to the characteristic
          await sendCharacteristic.write(ditC);
          print("Sent Command DIT: $ditC");
          var v = await sendCharacteristic.write(dvcC);
          print("Sent Command DVC: $dvcC");
          await sendCharacteristic.write(swdC);
          print("Sent Command SWD: $swdC");
          await sendCharacteristic.write(swbdC);
          print("Sent Command SWBD: $swbdC");

          //List<int> response = await receiveCharacteristic.read();
          //print('response value: ${response}');

          print("After Writing the command");
          print(
              'Command sent successfully: ${ditC.map((e) => e.toRadixString(16).padLeft(2, '0')).join(' ')}');
          print(
              'Command sent successfully: ${dvcC.map((e) => e.toRadixString(16).padLeft(2, '0')).join(' ')}');
          print(
              'Command sent successfully: ${swdC.map((e) => e.toRadixString(16).padLeft(2, '0')).join(' ')}');
          print(
              'Command sent successfully: ${swbdC.map((e) => e.toRadixString(16).padLeft(2, '0')).join(' ')}');
          // toast('---------Sensitivity Updated');
          toast('✅Sensitivity Updated');
        } else {
          print('Characteristic is not writable.');
        }
        // Check if the characteristic is readable
        // if (receiveCharacteristic.properties.notify) {
        //   print("char is in  $receiveCharacteristic");
        //   print("Before reading the characteristic");
        //   //Notify
        //   // List<int> response = [];
        //   // receiveCharacteristic.lastValueStream.listen((value) {
        //   //   response = value;
        //   //   print("Value is pbtained0");
        //   //   print("Value is check uis $value");
        //
        //   // });
        //   print("After reading the characteristic");
        // }
      }
    }
  }

  void _onCommandSendSingle(
      SendCommandSingle event, Emitter<AppBleDeviceState> emit) async {
    int ditCommand = event.pfi;
    List<int> ditC;

    switch (ditCommand) {
      case 15:
        print("3");
        // 12g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x78, 0x00];
        break;
      case 14:
        print("3");
        // 12g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x70, 0x00];
        break;
      case 13:
        print("3");
        // 12g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x68, 0x00];
        break;
      case 12:
        print("3");
        // 12g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x60, 0x00];
        break;
      case 11:
        print("4");
        // 11g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x58, 0x00];
        break;
      case 10:
        print("5");
        // 10g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x50, 0x00];
        break;
      case 9:
        print("6");
        // 9g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x48, 0x00];
        break;
      case 8:
        print("7");
        // 8g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x40, 0x00];
        break;
      case 7:
        print("8");
        // 7g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x38, 0x00];
        break;
      case 6:
        print("9");
        // 6g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x30, 0x00];
        break;
      case 5:
        print("10");
        // 5g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x28, 0x00];
        break;
      case 4:
        print("11");
        // 4g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x20, 0x00];
        break;
      case 3:
        print("12");
        // 3g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x18, 0x00];
        break;
      case 2:
        print("13");
        // 2g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x10, 0x00];
        break;
      case 1:
        print("14");
        // 1g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x08, 0x00];
        break;
      default:
        print("5");
        // Defaulting to 10g
        ditC = [0x55, 0xAA, 0x02, 0x02, 0x50, 0x00];
        break;
    }

    // The rest of your code
    // print('In send command func ');
    List<BluetoothService> services = await deviceConn!.discoverServices();
    // print("services length is ${services.length}");

    for (var serv in services) {
      // print("service is ${serv.uuid}");
      if (serv.uuid.toString() == serviceUuid) {
        // print("service match ${serv.uuid.toString()}");
        service = serv;
      }
    }

    // print('after service check');
    // print("match service uuid is ${service.uuid}");

    for (var char in service.characteristics) {
      // print('Char uuids: ${char.uuid.toString()}');
      if (char.uuid.toString() == receiveCharacteristicUuid) {
        // print("char match for read ${char.uuid.toString()}");
        receiveCharacteristic = char;
        // print("char is $receiveCharacteristic");
        await receiveCharacteristic.setNotifyValue(true);
      }
      if (char.serviceUuid.toString() == 'b3a0') {
        // print("char match for write uuid ${char.uuid.toString()}");
        sendCharacteristic = char;

        // Check if the characteristic is writable
        if (sendCharacteristic.properties.write) {
          // print("Before Writing the command");

          // Write the new command to the characteristic
          await sendCharacteristic.write(ditC);
          // print("Sent Command DIT: $ditC");
          print('Command sent successfully: ${ditC.map((e) => e.toRadixString(16).padLeft(2, '0')).join(' ')}');

          // toast('---------Sensitivity Updated');
        }
        else {
          print('Characteristic is not writable.');
        }
      }
    }
  }

  @override
  Future<void> close() {
    FlutterBluePlus.stopScan();
    for (var subscription in _deviceSubscriptions.values) {
      subscription.cancel();
    }
    _characteristicSubscription?.cancel();

    try {
      _scanTimeoutTimer?.cancel();
      _scanEmptyTimer?.cancel();
    } catch (e) {
      log('========================= close Scan timer cancel error $e');
    }
    return super.close();
  }

  Timer? _scanTimeoutTimer;
  Timer? _scanEmptyTimer;
}
