import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/gen/assets.gen.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/orange_button.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/widgets/connect_instruction.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/utils/utils.dart';
import '../widgets/custom_textbutton.dart';

AppBleDeviceBloc appBleDeviceBloc = locator<AppBleDeviceBloc>();

class BluetoothView extends StatefulWidget {
  const BluetoothView({super.key});

  @override
  State<BluetoothView> createState() => _BluetoothViewState();
}

class _BluetoothViewState extends State<BluetoothView> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: TrainBackgroundPainter(context),
        child: Scaffold(
          appBar:
              appBarCustom(ctx: context, title: 'PulseAim Connection Wizard'),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Gap(30.h),
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
                          listenWhen: (previous, current) =>
                              previous != current,
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
                              // initial: () => const HomeScreen(),
                              // servicesDiscovered: (v,w) => const HomeScreen(),
                              // connected: (x) => CustomTextButton(
                              //     onPressed: () {},
                              //     text:
                              //         'Connected to ${x.platformName.lastChars(5)}',
                              //     image: Assets.icons.bluetoothW.path),

                              scanning: (devices, isTimerStoped) {
                                print('flutter_side_algo===${devices.length}');
                                // devices = devices.fold<List<BluetoothDevice>>(
                                //     [], (prev, element) {
                                //   if (!prev.any(
                                //       (e) => e.remoteId == element.remoteId)) {
                                //     prev.add(element);
                                //   }
                                //   return prev;
                                // });
                                return ModifiedContainer(
                                    padding: EdgeInsets.all(14.w),
                                    margin: hPadding,
                                    color: Theme.of(context).cardColor,
                                    borderRadius: 24.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        bluStateView('${snapshot.data?.name}'),
                                        if (!isTimerStoped)
                                          const LinearProgressIndicator(),
                                        if (isTimerStoped && devices.isEmpty && appBleDeviceBloc.deviceConn==null)
                                          const ConnectInstructions()
                                        else
                                          // Container(
                                          //     padding: EdgeInsets.fromLTRB(
                                          //         0, 40.h, 0, 5.h),
                                          //     height: 250.h,
                                          //     child: ListView.builder(
                                          //         padding: EdgeInsets.fromLTRB(
                                          //             0, 12.h, 0, 12.h),
                                          //         shrinkWrap: true,
                                          //         itemCount: devices.length,
                                          //         itemBuilder: (context, index) {
                                          //           final device = devices[index];
                                          //           return ModifiedContainer(
                                          //               onTap: () {
                                          //                 toast(
                                          //                     'Connecting to ${device.platformName}');
                                          //                 BotToast.showLoading();
                                          //                 context
                                          //                     .read<
                                          //                         AppBleDeviceBloc>()
                                          //                     .add(AppBleDeviceEvent
                                          //                         .connectToDevice(
                                          //                             device));
                                          //               },
                                          //               borderRadius: 10.w,
                                          //               color: AppColors
                                          //                   .greyTextColor,
                                          //               margin:
                                          //                   const EdgeInsets.only(
                                          //                       bottom: 6),
                                          //               height: 52.h,
                                          //               child: Center(
                                          //                 child: Text(
                                          //                     '${device.platformName} (${device.remoteId.toString().lastChars(5)})',
                                          //                     style: TextStyle(
                                          //                         color: AppColors
                                          //                             .white,
                                          //                         fontFamily:
                                          //                             AppFontFamily
                                          //                                 .bold,
                                          //                         fontSize:
                                          //                             16.sp)),
                                          //               ));
                                          //         }))
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 40.h, 0, 5.h),
                                              child: ListView.builder(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 12.h, 0, 12.h),
                                                shrinkWrap: true,
                                                itemCount: devices.length,
                                                itemBuilder: (context, index) {
                                                  print(
                                                      "devices.length ${devices.length}");

                                                  final device = devices[index];
                                                  BluetoothDevice?
                                                      connectedDeviceId =
                                                      appBleDeviceBloc.deviceConn;

                                                  final isConnected =
                                                      connectedDeviceId
                                                              ?.remoteId.str ==
                                                          device.remoteId.str;

                                                  final String? favoriteIds =
                                                      locator<LocalStorageService>()
                                                          .getFavoriteBLEId;
                                                  // final isFavorite = favoriteIds!=null? favoriteIds.contains(device.remoteId.str):false;
                                                  final bool isFavorite =
                                                      favoriteIds ==
                                                          device.remoteId.str;
                                                  return ModifiedContainer(
                                                    onTap: () {
                                                      if (connectedDeviceId !=
                                                          null) {
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
                                                              .connectToDevice(
                                                                  device),
                                                        );
                                                      }
                                                    },
                                                    borderRadius: 10.w,
                                                    color:
                                                        AppColors.greyTextColor,
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
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      12.w),
                                                          child: Text(
                                                            '${device.platformName} (${device.remoteId.toString().lastChars(5)})',
                                                            style: TextStyle(
                                                              color:
                                                                  AppColors.white,
                                                              fontFamily:
                                                                  AppFontFamily
                                                                      .bold,
                                                              fontSize: 16.sp,
                                                            ),
                                                          ),
                                                        ),

                                                        // Icons: ✅ if connected, ⭐ if favorite, ❌ if removable
                                                        Row(
                                                          children: [
                                                            if (isConnected)
                                                              TextButton(
                                                                onPressed:
                                                                    () async {
                                                                      await device.disconnect();
                                                                      appBleDeviceBloc.add(const InitializeBluetooth());
                                                                  // appBleDeviceBloc.add(
                                                                  //     AppBleDeviceEvent
                                                                  //         .disconnectDevice(
                                                                  //             device));
                                                                },
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  minimumSize:
                                                                      Size.zero,
                                                                  // fixedSize: Size(50.w, 36.h),
                                                                  backgroundColor:
                                                                      AppColors
                                                                          .kPrimaryColor,
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
                                                                              5.0
                                                                                  .w,
                                                                          vertical:
                                                                              10.h),
                                                                  child: Text(
                                                                    'Disconnect',
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .white,
                                                                        fontSize:
                                                                            14.h,
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
                                                                      .saveBle(
                                                                          '', '');
                                                                  toast(
                                                                      'Removed from favorites');
                                                                  appBleDeviceBloc.add(const InitializeBluetooth());

                                                                } else {
                                                                  locator<LocalStorageService>().saveBle(
                                                                      device
                                                                          .remoteId
                                                                          .str,
                                                                      device
                                                                          .platformName);
                                                                  toast(
                                                                      'Added to favorites');
                                                                  appBleDeviceBloc.add(const InitializeBluetooth());

                                                                }
                                                              },
                                                              child: Icon(
                                                                isFavorite
                                                                    ? Icons.star
                                                                    : Icons
                                                                        .star_border,
                                                                color:
                                                                    Colors.amber,
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
                                    ));
                              },
                              // connected: (x) => const SizedBox(),
                              orElse: () => ModifiedContainer(
                                padding: EdgeInsets.all(14.w),
                                color: Theme.of(context).cardColor,
                                //AppColors.white,
                                borderRadius: 24.w,
                                margin: hPadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    bluStateView(snapshot.data?.name ?? ''),
                                    (appBleDeviceBloc.deviceConn==null)?
                                      const ConnectInstructions():LinearProgressIndicator(),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              ),
              SizedBox(height: 25.h),
              OrangeButton(text: 'Back', onTap: () => Navigator.pop(context)),
              SizedBox(height: 20.h),
            ],
          ),
        ));
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
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  CustomTextButton(
                      onPressed: () {},
                      text: 'Bluetooth: ${bluetoothStatus.toUpperCase()}',
                      image: Assets.icons.bluetoothW.path),
                  SizedBox(height: 24.h),
                  CustomTextButton(
                      onPressed: () {
                        if (state is Scanning && !state.isTimerStoped) {
                          toast('Scanning in progress');
                        } else {
                          // setState(() {});
                          FlutterBluePlus.stopScan();
                          appBleDeviceBloc.add(const InitializeBluetooth());
                        }
                      },
                      text: 'Scan for Devices',
                      image: Assets.icons.scanicon.path),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          // orElse: () => const Center(child: Text('orElse')),
        );
      },
    );
  }

  @override
  void dispose() {
    FlutterBluePlus.stopScan();
    super.dispose();
  }
}

extension E on String {
  String lastChars(int n) => substring(length - n);
}
