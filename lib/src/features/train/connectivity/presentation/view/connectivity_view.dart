import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/orange_button.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/view/bluetooth_view.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/view/wifi_list_view.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../core/widgets/modified_container.dart';
import '../bloc/bluetooth_bloc/app_ble_device_bloc.dart' as bl;

class ConnectivityView extends StatefulWidget {
  const ConnectivityView({super.key});

  @override
  State<ConnectivityView> createState() => _ConnectivityViewState();
}

class _ConnectivityViewState extends State<ConnectivityView> {
  bool wifiOn = false;
  bool bluetoothOn = false;

  // ConnectivityBloc connectivityBloc = ConnectivityBloc();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrainBackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'PulseAim Connection Wizard'),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 90.h, 24.w, 0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(24.w)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocProvider.value(
                      value: appBleDeviceBloc,
                      child: BlocConsumer<bl.AppBleDeviceBloc,
                          bl.AppBleDeviceState>(
                        listener: (context, state) {
                          log('is bluetooth state - -  $state');
                          bluetoothOn =
                              appBleDeviceBloc.deviceConn?.remoteId != null;

                          if (state is bl.Connected) {
                            bluetoothOn = true;
                          } else if (state is bl.DeviceIsDisconnected) {
                            bluetoothOn = false;
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
                            toast('✅ Device Disconnected ');

                          } else if (state is bl.ServicesDiscovered) {
                            bluetoothOn = true;
                          }
                          bluetoothOn =
                              appBleDeviceBloc.deviceConn?.remoteId != null;

                          return ModifiedContainer(
                            onTap:() async {
                              if(await requestNecessaryPermissions()){

                                // if (bluetoothOn) {
                                //   toast('Bluetooth is already connected');
                                // } else {
                                if(!bluetoothOn) {
                                  appBleDeviceBloc.add(
                                    bl.AppBleDeviceEvent.backgroundConnectToBLEDevice(),
                                  );

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const BluetoothView()));
                                }else{
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const BluetoothView()));
                                    // toast('✅ Already Connected ');

                                }
                                // }
                                // }:(){

                              }else{
                                await Geolocator.requestPermission();
                                bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
                                if (!serviceEnabled) {
                                  await Geolocator.openLocationSettings();
                                }else{
                                  toast('⚠️Permissions Needed');
                                  await openAppSettings(); // From permission_handler
                                }
                              }
                            },
                            margin: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 18.h),
                            color: Theme.of(context).canvasColor,
                            borderRadius: 12.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 14.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: bluetoothOn
                                              ? AppColors.kPrimaryColor
                                              : AppColors.white),
                                      height: 42.h,
                                      width: 42.w,
                                      child: bluetoothOn
                                          ? Image.asset(
                                              'assets/icons/bluetooth_w.png')
                                          : Image.asset(
                                              'assets/icons/bluetooth.png'),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 20.h,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Text('AimSync Bluetooth',
                                      style: TextStyle(
                                          // color: AppColors.blackTextColor,
                                          fontFamily: AppFontFamily.regular,
                                          fontSize: 14.sp)
                                      // Theme.of(context).textTheme.bodyLarge,
                                      ),
                                ),
                                bluetoothOn
                                    ? Text(
                                        'AimSync is connected',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontFamily: AppFontFamily.regular,
                                            fontSize: 12.sp),
                                      )
                                    : Text(
                                        'AimSync is not connected',
                                        style: TextStyle(
                                            color: AppColors.greyTextColor,
                                            fontFamily: AppFontFamily.regular,
                                            fontSize: 12.sp),
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
                                (
                                    cameraWiBloc.lastConnectedSsid!.toLowerCase().contains("firefly") ||
                                        cameraWiBloc.lastConnectedSsid!.toLowerCase().contains("pulseaim")
                                );
                            log('ios on emit connectedSSID $wifiOn');
                          }


                          return ModifiedContainer(
                            onTap: () async {
                              if(await requestNecessaryPermissions()){
                                if(!wifiOn){
                                  // cameraWiBloc.add(ConnectToWifiBackGround());
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const WifiListView())).then((v) {
                                  cameraWiBloc.add(const GetConnectedSSID());
                                });
                              }else{
                                toast('⚠️Permissions Needed');
                                await openAppSettings(); // From permission_handler

                              }



                            },
                            margin: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 12.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 18.h),
                            color: Theme.of(context).canvasColor,
                            borderRadius: 12.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 12.h),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: wifiOn
                                              ? AppColors.kPrimaryColor
                                              : AppColors.white),
                                      height: 42.h,
                                      width: 42.w,
                                      child: wifiOn
                                          ? Image.asset(
                                              'assets/icons/wifi_w.png')
                                          : Image.asset(
                                              'assets/icons/wifi.png'),
                                    ),
                                    Icon(Icons.arrow_forward_ios_rounded,
                                        size: 20.h)
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Text(
                                    'Camera WiFi',
                                    style: TextStyle(
                                        // color: AppColors.blackTextColor,
                                        fontFamily: AppFontFamily.regular,
                                        fontSize: 14.sp),
                                    //Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                                wifiOn
                                    ? Text(
                                  cameraWiBloc.lastConnectedSsid!=null?'${cameraWiBloc.lastConnectedSsid} is connected':"",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontFamily: AppFontFamily.regular,
                                            fontSize: 12.sp),
                                      )
                                    : Text(
                                        'WiFi is not connected',
                                        style: TextStyle(
                                            color: AppColors.greyTextColor,
                                            fontFamily: AppFontFamily.regular,
                                            fontSize: 12.sp),
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              OrangeButton(
                  text: 'Back to Main Menu',
                  onTap: () {
                    Navigator.pop(context);
                  }),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    cameraWiBloc.add(const GetConnectedSSID());
    // appBleDeviceBloc.add(const bl.GetConnectedDevice());
    // ..add(const LoadWifiNetworks());
    super.initState();
  }
}

Future<bool> requestNecessaryPermissions() async {
  // 1. Check if Location Services (GPS) are enabled
  await Geolocator.requestPermission();
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return false;
  }

  // 2. Request Location Permission
  final locationStatus = await Permission.location.request();
  if (!locationStatus.isGranted) return false;

  // 3. Request Nearby Wi-Fi permission (Android 13+ only)
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      final wifiStatus = await Permission.nearbyWifiDevices.request();
      if (!wifiStatus.isGranted) return false;
    }
  }

  return true; // All good
}

Widget _buildStorgaeAccessNoteBottomSheet(BuildContext context) {
  return SizedBox(
      height: 360.h,
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Container(
            width: 74.w,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.kPrimaryColor, width: 5.w),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 36.h,
          ),
          Icon(
            // size: 20.w,
            Icons.error_outline_rounded,
            color: AppColors.kPrimaryColor,
          ),
          SizedBox(height: 8.h),
          Text(
            'Note',
            style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontFamily: AppFontFamily.bold,
                fontSize: 20.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'PulseAim requires access to your storage to edit and download photos and videos.',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontFamily: AppFontFamily.regular),
          ),
          SizedBox(
            height: 26.h,
          ),
          OrangeButton(
              text: 'Ok',
              onTap: () {
                Navigator.of(context).pop();
              }),
        ],
      ));
}
