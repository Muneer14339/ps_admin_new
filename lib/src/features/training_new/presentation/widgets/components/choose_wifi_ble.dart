import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_iot/wifi_iot.dart';
import '../../../../../core/enum/session_enum.dart';
import '../../../../../core/helper/native_bindings.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/locatore.dart';
import '../../../../../core/routes/routes_services.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart'
    as bl;
import '../../../../train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../../../../train/connectivity/presentation/view/bluetooth_view.dart';
import '../../../../train/connectivity/presentation/view/connectivity_view.dart';
import '../../../../train/connectivity/presentation/view/wifi_list_view.dart';
import '../../../../train/session/presentation/bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import '../../../../train/session/presentation/component/fram_streaming_widget.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';

class ChooseWifiBle extends StatefulWidget {
  static const String routeName = '/choose_Wifi_Ble';

  const ChooseWifiBle({super.key});

  @override
  State<ChooseWifiBle> createState() => _ChooseWifiBleState();
}

class _ChooseWifiBleState extends State<ChooseWifiBle> {
  bool wifiOn = false;
  bool withWire = false;
  bool bluetoothOn = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppTheme.background(context),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonWithTitle(title: 'Choose Connection'),
                SizedBox(height: 20.h),
                Text(
                  "Select how you want to connect your device",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.textPrimary(context),
                  ),
                ),
                SizedBox(height: 24.h),



                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        "Camera Connectivity",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.textPrimary(context),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      BlocProvider.value(
                        value: cameraWiBloc,
                        child: BlocBuilder<CameraWifiBloc, CameraWifiState>(
                          builder: (context, state) {
                            if (state is Loaded) {
                              wifiOn = cameraWiBloc.lastConnectedSsid != null &&
                                  cameraWiBloc.lastConnectedSsid != '';
                              // bluetoothOn = state.isBluetooth;
                            } else if (cameraWiBloc.lastConnectedSsid != null) {
                              wifiOn = cameraWiBloc.lastConnectedSsid != null &&
                                  cameraWiBloc.lastConnectedSsid !=
                                      '<unknown ssid>' &&
                                  (cameraWiBloc.lastConnectedSsid!
                                      .toLowerCase()
                                      .contains("firefly") ||
                                      cameraWiBloc.lastConnectedSsid!
                                          .toLowerCase()
                                          .contains("pulseaim"));
                              log('ios on emit connectedSSID $wifiOn');
                            }
                            return _connectionCard(
                              context,
                              title: "Wi-Fi Connection",
                              subtitle: cameraWiBloc.lastConnectedSsid != null
                                  ? '${cameraWiBloc.lastConnectedSsid} is connected'
                                  : "Connect via Wi-Fi network",
                              icon: Icons.wifi_rounded,
                              isConnected: wifiOn,
                              onTap: () async {
                                if( cameraWiBloc.withWire==null||
                                    cameraWiBloc.withWire==false){
                                  if (await requestNecessaryPermissions()) {
                                    if (!wifiOn) {
                                      // cameraWiBloc.add(ConnectToWifiBackGround());
                                    }
                                    locator<RoutesService>()
                                        .navigateTo(AppRoutes.wifiList)
                                        .then((v) {
                                      cameraWiBloc.add(const GetConnectedSSID());
                                    });
                                  } else {
                                    toast('⚠️Permissions Needed');
                                    await openAppSettings(); // From permission_handler
                                  }
                                }else{
                                  toast('⚠️ Camera is Already Connected with Wire, disconnect wire connection 1st.');

                                }

                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 8.h),
                      BlocProvider.value(
                        value: cameraWiBloc,
                        child: BlocBuilder<CameraWifiBloc, CameraWifiState>(
                          builder: (context, state) {
                            if (state is Loaded) {
                              withWire = cameraWiBloc.withWire!=null&&cameraWiBloc.withWire==true;

                              // bluetoothOn = state.isBluetooth;
                            } else if (cameraWiBloc.withWire != null) {
                              withWire = cameraWiBloc.withWire==true;

                              log('ios on emit withWire $withWire');
                            }
                            return _connectionCard(
                              context,
                              title: "Connection with wire",
                              subtitle: cameraWiBloc.withWire != null
                                  ? (cameraWiBloc.withWire == true?'Camera is connected via cable':"Connect camera via cable")
                                  : "Connect camera via cable",
                              icon: Icons.cable,
                              isConnected: withWire,
                              onTap: () async {
                                // if(cameraWiBloc.lastConnectedSsid != null){
                                //   slRtspStreamingBloc.add(
                                //       RtspStreamingEvent.setFovOptionsEvent('80'));}

                                if(cameraWiBloc.withWire != null){
                                  if(cameraWiBloc.withWire == true){
                                    cameraWiBloc.add(const ConnectWithWire());
                                  }else if(cameraWiBloc.lastConnectedSsid != null){
                                    // slRtspStreamingBloc.add(
                                    //     RtspStreamingEvent.setFovOptionsEvent('80'));
                                    // WiFiSettings.openWiFiSettings();
                                    cameraWiBloc.add(const DisconnectRtspCamera(true));
                                    cameraWiBloc.add(const ConnectWithWire());

                                  }else{
                                    cameraWiBloc.add(const ConnectWithWire());
                                  }
                                }else{
                                  cameraWiBloc.add(const ConnectWithWire());
                                }



                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "AimSync Connectivity",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.textPrimary(context),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      BlocProvider.value(
                        value: appBleDeviceBloc,
                        child:
                        BlocConsumer<bl.AppBleDeviceBloc, bl.AppBleDeviceState>(
                          listener: (context, state) {
                            log('is bluetooth state - -  $state');
                            bluetoothOn =
                                appBleDeviceBloc.deviceConn?.remoteId != null;

                            if (state is bl.Connected) {
                              bluetoothOn = true;
                            } else if (state is bl.DeviceIsDisconnected) {
                              bluetoothOn = false;
                              toast('✅ Device Disconnected ');
                            } else if (state is bl.ServicesDiscovered) {
                              bluetoothOn = true;
                            }
                          },
                          builder: (context, state) {
                            // bluetoothOn = state is bluetooth.Connected;
                            // log('bluetoothOn ============== $state');
                            log('builder is bluetooth state - -  $state');
                            // if (state is Connected) {
                            //   bluetoothOn = true;
                            // } else
                            if (state is bl.DeviceIsDisconnected) {
                              bluetoothOn = false;
                            } else if (state is bl.ServicesDiscovered) {
                              bluetoothOn = true;
                            }
                            bluetoothOn =
                                appBleDeviceBloc.deviceConn?.remoteId != null;

                            return _connectionCard(
                              context,
                              title: "Bluetooth (BLE)",
                              subtitle: bluetoothOn
                                  ? 'AimSync is connected'
                                  : 'AimSync is not connected',
                              icon: Icons.bluetooth_rounded,
                              isConnected: bluetoothOn,
                              onTap: () async {
                                if (await requestNecessaryPermissions()) {
                                  // if (bluetoothOn) {
                                  //   toast('Bluetooth is already connected');
                                  // } else {
                                  if (!bluetoothOn) {
                                    appBleDeviceBloc.add(
                                      bl.AppBleDeviceEvent
                                          .backgroundConnectToBLEDevice(),
                                    );

                                    locator<RoutesService>()
                                        .navigateTo(AppRoutes.bleList);
                                  } else {
                                    locator<RoutesService>()
                                        .navigateTo(AppRoutes.bleList);
                                    // toast('✅ Already Connected ');
                                  }
                                  // }
                                  // }:(){
                                } else {
                                  await Geolocator.requestPermission();
                                  bool serviceEnabled =
                                  await Geolocator.isLocationServiceEnabled();
                                  if (!serviceEnabled) {
                                    await Geolocator.openLocationSettings();
                                  } else {
                                    toast('⚠️Permissions Needed');
                                    await openAppSettings(); // From permission_handler
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
          floatingActionButton:         InkWell(
            onTap: () {
              locator<RoutesService>().goBack();
            },
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.background(context),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.primary(context),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: AppTheme.primary(context),
              ),
            ),
          ),

        );
      },
    );
  }

  Widget _connectionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isConnected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isConnected
              ? AppTheme.primary(context).withOpacity(0.2)
              : AppTheme.background(context),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.primary(context).withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppTheme.primary(context).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppTheme.primary(context),
                size: 28,
              ),
            ),
            SizedBox(width: 20.w),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary(context),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      height: 1.4,
                      color: AppTheme.textSecondary(context),
                    ),
                  ),
                ],
              ),
            ),

            // Connection icon
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isConnected
                  ? Icon(
                      Icons.check_circle,
                      key: const ValueKey('connected'),
                      color: AppTheme.primary(context),
                      size: 28,
                    )
                  : Icon(
                      Icons.arrow_forward_ios_rounded,
                      key: const ValueKey('not_connected'),
                      color: AppTheme.textSecondary(context),
                      size: 22,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackButtonWithTitle extends StatelessWidget {
  final String? title;
  final bool isShowRefreshIcon;
  final VoidCallback? onRefresh;

  const BackButtonWithTitle({
    Key? key,
    this.title,
    this.isShowRefreshIcon = false,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            locator<RoutesService>().goBack();
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppTheme.background(context),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppTheme.primary(context),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: AppTheme.primary(context),
            ),
          ),
        ),
        if (title != null) ...[
          const SizedBox(width: 16),
          Text(
            title!,
            style: TextStyle(
              color: AppTheme.primary(context),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        if (isShowRefreshIcon) ...[
          const Spacer(),
          GestureDetector(
            onTap:  onRefresh,
            child: Image.asset(
              'assets/images/refresh.png',
              height: 32.h,
              width: 32.w,
            ),
          )

        ],
      ],
    );
  }
}
