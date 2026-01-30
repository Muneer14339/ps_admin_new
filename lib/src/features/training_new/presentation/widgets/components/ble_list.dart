import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/font/app_fonts.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/modified_container.dart';
import '../../../../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../../train/connectivity/presentation/view/bluetooth_view.dart';
import '../../../../train/connectivity/presentation/widgets/connect_instruction.dart';
import '../../../../train/connectivity/presentation/widgets/custom_textbutton.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';

import '../../../data/models/wifi_device_model.dart';
import 'choose_wifi_ble.dart';
import 'wifi_list.dart';

class BleList extends StatefulWidget {
  static const String routeName = '/bleList';

  const BleList({super.key});

  @override
  State<BleList> createState() => _BleListState();
}

class _BleListState extends State<BleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Expanded(
              child: StreamBuilder<BluetoothAdapterState>(
                  stream: FlutterBluePlus.adapterState,
                  builder: (context, snapshot) {
                    if (snapshot.data?.name == 'on') {
                      appBleDeviceBloc.add(const InitializeBluetooth());
                    } else {
                      appBleDeviceBloc.add(const StopScanning());
                    }
                    return BlocProvider.value(
                      value: appBleDeviceBloc,
                      child: BlocConsumer<AppBleDeviceBloc, AppBleDeviceState>(
                        listenWhen: (previous, current) => previous != current,
                        listener: (context, state) {
                          if (state is Error) {
                            BotToast.closeAllLoading();
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                  SnackBar(content: Text(state.message)));
                          }

                          if (state is Connected) {
                            FlutterBluePlus.stopScan();
                            // appBleDeviceBloc.add(const InitializeBluetooth());

                            // ScaffoldMessenger.of(context)
                            //   ..hideCurrentSnackBar()
                            //   ..showSnackBar(SnackBar(
                            //     content: Text(
                            //         'Connected to ${state.device.platformName}'),
                            //   ));
                            BotToast.closeAllLoading();
                            Navigator.pop(context);
                          }

                          if (state is DeviceIsDisconnected) {
                            FlutterBluePlus.stopScan();
                            appBleDeviceBloc.add(const InitializeBluetooth());
                            BotToast.closeAllLoading();

                            // ScaffoldMessenger.of(context)
                            //   ..hideCurrentSnackBar()
                            //   ..showSnackBar(const SnackBar(
                            //       content: Text('Device disconnected')));
                          }
                        },
                        builder: (context, state) {
                          log('bluetooth state $state');
                          return state.maybeWhen(
                            scanning: (devices, isTimerStoped) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  bluStateView('${snapshot.data?.name}'),
                                  if (!isTimerStoped)
                                    const LinearProgressIndicator(),
                                  if (isTimerStoped &&
                                      devices.isEmpty &&
                                      appBleDeviceBloc.deviceConn == null)
                                    const ConnectInstructions()
                                  else
                                    Expanded(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 40.h, 0, 5.h),
                                        child: ListView.builder(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 12.h, 0, 12.h),
                                          shrinkWrap: true,
                                          itemCount: devices.length,
                                          itemBuilder: (context, index) {
                                            print(
                                                "devices.length ${devices.length}");

                                            final device = devices[index];
                                            BluetoothDevice? connectedDeviceId =
                                                appBleDeviceBloc.deviceConn;

                                            final isConnected =
                                                connectedDeviceId?.remoteId.str ==
                                                    device.remoteId.str;

                                            final String? favoriteIds =
                                                locator<LocalStorageService>()
                                                    .getFavoriteBLEId;
                                            // final isFavorite = favoriteIds!=null? favoriteIds.contains(device.remoteId.str):false;
                                            final bool isFavorite = favoriteIds ==
                                                device.remoteId.str;
                                            return ModifiedContainer(
                                              onTap: () {
                                                if (connectedDeviceId != null) {
                                                  if (connectedDeviceId
                                                      .isConnected) {
                                                    toast(
                                                        '⚠️ Already Connected to ${device.platformName}');
                                                  } else {
                                                    toast(
                                                        'Connecting to ${device.platformName}');
                                                    BotToast.showLoading();
                                                    appBleDeviceBloc.add(
                                                      AppBleDeviceEvent
                                                          .connectToDevice(
                                                              device),
                                                    );
                                                  }
                                                } else {
                                                  toast(
                                                      'Connecting to ${device.platformName}');
                                                  BotToast.showLoading();
                                                  appBleDeviceBloc.add(
                                                    AppBleDeviceEvent
                                                        .connectToDevice(device),
                                                  );
                                                }
                                              },
                                              borderRadius: 10.w,
                                              borderColor: AppTheme.primary(context),

                                              color: isConnected
                                                  ? AppTheme.primary(context)
                                                      .withOpacity(0.2)
                                                  : AppTheme.background(context),
                                              margin: const EdgeInsets.only(
                                                  bottom: 6),
                                              height: 52.h,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // Device Name and ID
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 12.w),
                                                    child: Text(
                                                      '${device.platformName} (${device.remoteId.toString().lastChars(5)})',
                                                      style: TextStyle(
                                                        color:
                                                            AppTheme.textPrimary(
                                                                context),
                                                        fontFamily:
                                                            AppFontFamily.bold,
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),
                                                  ),

                                                  // Icons: ✅ if connected, ⭐ if favorite, ❌ if removable
                                                  Row(
                                                    children: [
                                                      isConnected
                                                          ? TextButton(
                                                              onPressed:
                                                                  () async {
                                                                await device
                                                                    .disconnect();
                                                                appBleDeviceBloc.add(
                                                                    const InitializeBluetooth());
                                                                // appBleDeviceBloc.add(
                                                                //     AppBleDeviceEvent
                                                                //         .disconnectDevice(
                                                                //             device));
                                                              },
                                                              style: TextButton
                                                                  .styleFrom(
                                                                backgroundColor:
                                                                    AppTheme.primary(
                                                                        context),
                                                                foregroundColor:
                                                                    AppTheme
                                                                        .background(
                                                                            context),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                minimumSize:
                                                                    Size.zero,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.h),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            5.0.w,
                                                                        vertical:
                                                                            10.h),
                                                                child: Text(
                                                                  'Disconnect',
                                                                  style: TextStyle(
                                                                      color: AppTheme
                                                                          .background(
                                                                              context),
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontFamily:
                                                                          AppFontFamily
                                                                              .bold),
                                                                ),
                                                              ),
                                                            )
                                                          : TextButton(
                                                              onPressed: () {
                                                                if (connectedDeviceId !=
                                                                    null) {
                                                                  if (connectedDeviceId
                                                                      .isConnected) {
                                                                    toast(
                                                                        '⚠️ Already Connected to ${device.platformName}');
                                                                  } else {
                                                                    toast(
                                                                        'Connecting to ${device.platformName}');
                                                                    BotToast
                                                                        .showLoading();
                                                                    appBleDeviceBloc
                                                                        .add(
                                                                      AppBleDeviceEvent
                                                                          .connectToDevice(
                                                                              device),
                                                                    );
                                                                  }
                                                                } else {
                                                                  toast(
                                                                      'Connecting to ${device.platformName}');
                                                                  BotToast
                                                                      .showLoading();
                                                                  appBleDeviceBloc
                                                                      .add(
                                                                    AppBleDeviceEvent
                                                                        .connectToDevice(
                                                                            device),
                                                                  );
                                                                }
                                                              },

                                                              style: TextButton
                                                                  .styleFrom(
                                                                backgroundColor:
                                                                    AppTheme.background(
                                                                        context),
                                                                foregroundColor:
                                                                    AppTheme
                                                                        .background(
                                                                            context),
                                                                side: BorderSide(color: AppTheme.primary(context)),

                                                                padding:
                                                                    EdgeInsets.symmetric(horizontal: 8.w),
                                                                minimumSize:
                                                                    Size.zero,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.h),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            5.0.w,
                                                                        vertical:
                                                                            10.h),
                                                                child: Text(
                                                                  'Connect',
                                                                  style: TextStyle(
                                                                      color: AppTheme
                                                                          .primary(
                                                                              context),
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontFamily:
                                                                          AppFontFamily
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                      SizedBox(width: 10.w),
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (isFavorite) {
                                                            locator<LocalStorageService>()
                                                                .saveBle('', '');
                                                            toast(
                                                                'Removed from favorites');
                                                            appBleDeviceBloc.add(
                                                                const InitializeBluetooth());
                                                          } else {
                                                            locator<LocalStorageService>()
                                                                .saveBle(
                                                                    device
                                                                        .remoteId
                                                                        .str,
                                                                    device
                                                                        .platformName);
                                                            toast(
                                                                'Added to favorites');
                                                            appBleDeviceBloc.add(
                                                                const InitializeBluetooth());
                                                          }
                                                        },
                                                        child: Icon(
                                                          isFavorite
                                                              ? Icons.star
                                                              : Icons.star_border,
                                                          color: Colors.amber,
                                                          size: 22.w,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                ],
                              );
                            },
                            // connected: (x) => const SizedBox(),
                            orElse: () => ModifiedContainer(
                              padding: EdgeInsets.all(14.w),
                              color: AppTheme.background(context),
                              //AppColors.white,
                              borderRadius: 24.w,
                              margin: hPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  bluStateView(snapshot.data?.name ?? ''),
                                  (appBleDeviceBloc.deviceConn == null)
                                      ? const ConnectInstructions()
                                      : LinearProgressIndicator(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<AppBleDeviceBloc, AppBleDeviceState> bluStateView(
      String bluetoothStatus) {
    return BlocBuilder<AppBleDeviceBloc, AppBleDeviceState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Align(
            alignment: Alignment.topCenter,
            child: Container(
              // height: 0.3.sh,
              decoration: BoxDecoration(
                color: AppTheme.background(context),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: BackButtonWithTitle(
                      title: 'Bluetooth Connections',
                      isShowRefreshIcon: true,
                      onRefresh: () {
                        if (state is Scanning && !state.isTimerStoped) {
                          toast('Scanning in progress');
                        } else {
                          // setState(() {});
                          FlutterBluePlus.stopScan();
                          appBleDeviceBloc.add(const InitializeBluetooth());
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),

                  CustomTextButton(
                      onPressed: () {},
                      text: 'Bluetooth: ${bluetoothStatus.toUpperCase()}',
                      image: Assets.icons.bluetoothW.path),
                  SizedBox(height: 8.h),
                  // CustomTextButton(
                  //     onPressed: () {
                  //       if (state is Scanning && !state.isTimerStoped) {
                  //         toast('Scanning in progress');
                  //       } else {
                  //         // setState(() {});
                  //         FlutterBluePlus.stopScan();
                  //         appBleDeviceBloc.add(const InitializeBluetooth());
                  //       }
                  //     },
                  //     text: 'Scan for Devices',
                  //     image: Assets.icons.scanicon.path),
                  // SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          // orElse: () => const Center(child: Text('orElse')),
        );
      },
    );
  }
}

// class _BleListContent extends StatelessWidget {
//   final TrainingState state;
//
//   const _BleListContent({required this.state});
//
//   @override
//   Widget build(BuildContext context) {
//     // Use dummy list directly in this widget
//     final bluetoothDevices = [
//       WifiDeviceModel(
//         name: 'AimSync Sensor A1',
//         subtitle: 'Battery: 85% • Firmware v2.1.4',
//         signal: 4,
//       ),
//       WifiDeviceModel(
//         name: 'AimSync Trigger T5',
//         subtitle: 'Battery: 92% • Firmware v1.8.2',
//         signal: 3,
//       ),
//       WifiDeviceModel(
//         name: 'AimSync Camera C3',
//         subtitle: 'Battery: 78% • Firmware v3.0.1',
//         signal: 2,
//       ),
//       WifiDeviceModel(
//         name: 'AimSync Display D2',
//         subtitle: 'Battery: 95% • Firmware v2.5.0',
//         signal: 4,
//       ),
//       WifiDeviceModel(
//         name: 'AimSync Hub H1',
//         subtitle: 'Battery: 65% • Firmware v2.2.3',
//         signal: 1,
//       ),
//     ];
//
//     final connectedDevices =
//         bluetoothDevices.where((d) => state.connectedBleId == d.id).toList();
//     final availableDevices =
//         bluetoothDevices.where((d) => state.connectedBleId != d.id).toList();
//
//     return Scaffold(
//       backgroundColor: AppTheme.background(context),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         shrinkWrap: true,
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: BackButtonWithTitle(
//               title: 'Bluetooth Connections',
//               isShowRefreshIcon: true,
//               onRefresh: () {
//                 // You can add refresh logic here if needed
//                 // For example: context.read<TrainingBloc>().add(RefreshBluetoothDevicesEvent());
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//           const ConnectDeviceCard(),
//           const SizedBox(height: 20),
//           if (connectedDevices.isNotEmpty) ...[
//             const SectionHeader(
//               title: 'Connected Device',
//               icon: Icons.bluetooth,
//             ),
//             const SizedBox(height: 8),
//             ...connectedDevices.map(
//               (d) => BleDeviceTile(
//                 device: d,
//                 connected: true,
//                 onTapConnect: () {
//                   _toggleBleConnection(context, d);
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//           const SectionHeader(
//             title: 'Available Devices',
//             icon: Icons.bluetooth,
//           ),
//           const SizedBox(height: 8),
//           if (availableDevices.isNotEmpty) ...[
//             ...availableDevices.map(
//               (d) => BleDeviceTile(
//                 device: d,
//                 connected: false,
//                 onTapConnect: () {
//                   _toggleBleConnection(context, d);
//                 },
//               ),
//             ),
//           ] else ...[
//             _buildEmptyState(),
//           ],
//         ],
//       ),
//     );
//   }
//
//   Widget _buildEmptyState() {
//     return Container(
//       padding: const EdgeInsets.all(40),
//       child: Column(
//         children: [
//           Icon(
//             Icons.bluetooth_disabled,
//             size: 64,
//             color: Colors.grey.withOpacity(0.5),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'No Bluetooth devices found',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey.withOpacity(0.7),
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Make sure your AimSync devices are powered on and in pairing mode',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.6)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _toggleBleConnection(BuildContext context, WifiDeviceModel device) {
//     // Dispatch event to BLoC
//     context.read<TrainingBloc>().add(ToggleBleConnectionEvent(device));
//
//     // Optional: Navigate back after connection
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   if (Navigator.of(context).canPop()) {
//     //     Navigator.of(context).pop();
//     //   }
//     // });
//   }
// }

// class ConnectDeviceCard extends StatelessWidget {
//   const ConnectDeviceCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Container(
//         constraints: const BoxConstraints(maxWidth: 600),
//         decoration: BoxDecoration(
//           color: AppTheme.background(context),
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: AppTheme.primary(context), width: 1),
//         ),
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Icon Container
//             Container(
//               width: 48,
//               height: 48,
//               decoration: BoxDecoration(
//                 color: AppTheme.primary(context).withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 Icons.bolt,
//                 color: AppTheme.primary(context),
//                 size: 28,
//               ),
//             ),
//             const SizedBox(width: 24),
//             // Content
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Connect AimSync Devices',
//                     style: TextStyle(
//                       color: AppTheme.textPrimary(context),
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     'Scan for available AimSync Bluetooth devices nearby. Make sure your devices are powered on and in pairing mode. For optimal performance, keep devices within 30 feet of your tablet.',
//                     style: TextStyle(
//                       color: AppTheme.textSecondary(context),
//                       fontSize: 15,
//                       height: 1.6,
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   // Button
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle scan action - you can dispatch an event here
//                       _scanForDevices(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppTheme.primary(context),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 32,
//                         vertical: 16,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       elevation: 0,
//                     ),
//                     child: const Text(
//                       'Scan for Devices',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _scanForDevices(BuildContext context) {
//     // You can add scan logic here
//     // For example: context.read<TrainingBloc>().add(ScanBluetoothDevicesEvent());
//     print('Scan for Devices pressed');
//
//     // Optional: Show loading state or refresh the device list
//   }
// }

// Custom Bluetooth Device Tile (different from WiFi)
// class BleDeviceTile extends StatelessWidget {
//   final WifiDeviceModel device;
//   final bool connected;
//   final VoidCallback onTapConnect;
//
//   const BleDeviceTile({
//     super.key,
//     required this.device,
//     required this.connected,
//     required this.onTapConnect,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTapConnect,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 6),
//         decoration: BoxDecoration(
//           color: connected
//               ? AppTheme.primary(context).withOpacity(0.2)
//               : AppTheme.background(context),
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: AppTheme.primary(context).withOpacity(0.2)),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
//         child: Row(
//           children: [
//             // Bluetooth icon with signal strength indicator
//             _buildBluetoothIconWithSignal(device.signal, context),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     device.name,
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                       color: AppTheme.textPrimary(context),
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     device.subtitle,
//                     style: TextStyle(
//                       color: AppTheme.textSecondary(context),
//                       fontSize: 13,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 10),
//             AnimatedSwitcher(
//               duration: const Duration(milliseconds: 250),
//               child: connected
//                   ? TextButton.icon(
//                       key: const ValueKey('connected'),
//                       onPressed: onTapConnect,
//                       icon: Icon(
//                         Icons.check,
//                         size: 18,
//                         color: AppTheme.background(context),
//                       ),
//                       label: Text(
//                         'Connected',
//                         style: TextStyle(color: AppTheme.background(context)),
//                       ),
//                       style: TextButton.styleFrom(
//                         backgroundColor: AppTheme.primary(context),
//                         foregroundColor: AppTheme.background(context),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 8,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     )
//                   : OutlinedButton(
//                       key: const ValueKey('connect'),
//                       onPressed: onTapConnect,
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: AppTheme.primary(context),
//                         side: BorderSide(color: AppTheme.primary(context)),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 8,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text(
//                         'Connect',
//                         style: TextStyle(color: AppTheme.primary(context)),
//                       ),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBluetoothIconWithSignal(
//     int signalStrength,
//     BuildContext context,
//   ) {
//     return Stack(
//       children: [
//         Icon(Icons.bluetooth, color: AppTheme.textSecondary(context), size: 26),
//         Positioned(
//           right: 0,
//           bottom: 0,
//           child: Container(
//             padding: const EdgeInsets.all(2),
//             decoration: BoxDecoration(
//               color: _getSignalColor(signalStrength),
//               shape: BoxShape.circle,
//             ),
//             child: Text(
//               signalStrength.toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 8,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Color _getSignalColor(int strength) {
//     switch (strength) {
//       case 1:
//         return Colors.red;
//       case 2:
//         return Colors.orange;
//       case 3:
//         return Colors.yellow;
//       case 4:
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }
// }
