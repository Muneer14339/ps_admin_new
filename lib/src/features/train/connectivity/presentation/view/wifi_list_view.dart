import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/helper/native_bindings.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/bottom_sheet_.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/orange_button.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/core/widgets/signin_textfield.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/widgets/ios_wifi_item.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../auth_new/signup_cubit.dart';

final cameraWiBloc = locator<CameraWifiBloc>();

class WifiListView extends StatefulWidget {
  const WifiListView({super.key});

  @override
  _WifiListViewState createState() => _WifiListViewState();
}

class _WifiListViewState extends State<WifiListView>
    with WidgetsBindingObserver {
  // Sample dynamic list of WiFi names
  // List<String> wifiList = ['Camera WiFi', 'Camera WiFi', 'Camera WiFi'];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // String? connectedSSID;
    return CustomPaint(
      painter: TrainBackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(
            ctx: context,
            title: 'PulseAim Camera WiFi Wizard',
            hideBack: false),
        body: ModifiedContainer(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 24.h),
          color: Theme
              .of(context)
              .cardColor,
          borderRadius: 20,
          child: BlocProvider.value(
            value: cameraWiBloc,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // WiFi Title Row with Refresh Button
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'WiFi Connections',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: AppFontFamily.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cameraWiBloc.add(const GetConnectedSSID());
                          if (Platform.isAndroid) {
                            // if( cameraWiBloc.lastConnectedSsid==null){
                            // cameraWiBloc.add(ConnectToWifiBackGround());
                            if (cameraWiBloc.lastConnectedSsid == null) {
                              WiFiForIoTPlugin.connect(
                                "fire_fly",
                                security: NetworkSecurity.WPA,
                                password: '12345678',
                                withInternet: false,
                                joinOnce: true,
                                timeoutInSeconds: 5,
                              );
                            }
                            // cameraWiBloc.add(ConnectToWifiBackGround());

                            // }

                            WiFiSettings.scanWiFi();

                            cameraWiBloc.add(const LoadWifiNetworks());
                          }
                        },
                        child: Image.asset(
                          'assets/images/refresh.png',
                          height: 32.h,
                          width: 32.w,
                        ),
                      )
                    ]),
                // SizedBox(height: 12.h),
                const Divider(),
                Text(
                  'Favourite Network',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: AppFontFamily.bold,
                  ),
                ),
                const SizedBox(height: 10),
                locator<LocalStorageService>().getFavNetworkSsid != null
                    ? BlocBuilder<CameraWifiBloc, CameraWifiState>(
                    builder: (context, state) {
                      print("check_fav___${state}");
                      if (state is Loaded) {
                        return wifiCardView(
                            networkSsid: locator<LocalStorageService>()
                                .getFavNetworkSsid,
                            connectedSSID: cameraWiBloc.lastConnectedSsid,
                            password: locator<LocalStorageService>()
                                .getFavNetworkPass,
                            isFav: true);
                      } else {
                        return wifiCardView(
                            networkSsid: locator<LocalStorageService>()
                                .getFavNetworkSsid,
                            connectedSSID: cameraWiBloc.lastConnectedSsid,
                            password: locator<LocalStorageService>()
                                .getFavNetworkPass,
                            isFav: true);
                      }
                    })
                // wifiCardView(
                //     networkSsid:
                //     locator<LocalStorageService>().getFavNetworkSsid,
                //     connectedSSID: connectedSSID,
                //     password:
                //     locator<LocalStorageService>().getFavNetworkPass,
                //     isFav: true)

                    : Center(
                  child: Text(
                    'No Favourite Network',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: AppFontFamily.regular,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                const Divider(),

                const SizedBox(height: 10),

                Text(
                  'Available Networks',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: AppFontFamily.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Expanded(
                  child: BlocBuilder<CameraWifiBloc, CameraWifiState>(
                      builder: (context, state) {
                        // if (state is ConnectedSSID) {
                        //   if (state.ssid != '') {
                        //     connectedSSID = state.ssid;
                        //     log("Connect $connectedSSID");
                        //   }
                        // }
                        // log(' wifilist state $state');
                        if (state is Connected && Platform.isIOS) {
                          return IosWifiItem(ssid: state.ssid);
                        } else if (state is Error) {
                          return Center(child: Text(state.message));
                        } else if (state is Connected) {
                          return Center(child: Text(
                              'Connected to ${state.ssid}'));
                        }
                        // else if (state is ConnectedSSID) {
                        //
                        //   return Center(child: Text('Connected to ${state.ssid}'));
                        // }
                        else if (state is Loaded && Platform.isAndroid) {
                          Map<String, WiFiAccessPoint?> uniqueNetworksMap = {};
                          for (WiFiAccessPoint? network in state.networks) {
                            if (network != null) {
                              uniqueNetworksMap[network.ssid] = network;
                            }
                          }
                          List<WiFiAccessPoint?> networks =
                          uniqueNetworksMap.values.toList();
                          return SizedBox(
                            height: 355.h,
                            child: networks.isEmpty
                                ? Center(child: Text('No networks found'))
                                : ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: networks.length,
                              itemBuilder: (context, index) {
                                final network = networks[index];

                                // bool isConnected =
                                //     network?.ssid == connectedSSID;
                                return wifiCardView(
                                    networkSsid: network?.ssid,
                                    connectedSSID:
                                    cameraWiBloc.lastConnectedSsid,
                                    isFav: false);
                              },
                            ),
                          );
                        } else {
                          // return Center(child: Text('Connected to ${state}'));
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ),
                // Add Network Button
                ModifiedContainer(
                  // margin: EdgeInsets.only(top: 8.h),
                  padding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  color: Theme
                      .of(context)
                      .canvasColor,
                  borderRadius: 12.sp,
                  onTap: () {
                    WiFiSettings.openWiFiSettings();
                  },
                  child: Row(
                    children: [
                      Container(
                          height: 48.h,
                          width: 48.w,
                          padding: EdgeInsets.all(15.h),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme
                                  .of(context)
                                  .cardColor),
                          child: Image.asset('assets/icons/add_net.png')),
                      SizedBox(width: 14.w),
                      Text(
                        'Add Camera',
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelMedium,
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Note text at the bottom
                Row(
                  children: [
                    Icon(Icons.info_outline, color: AppColors.kPrimaryColor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'If Camera WiFi name is not listed here, you need to turn on your camera and tap on Add Network button',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFontFamily.regular,
                            color: AppColors.greyTextColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(10.h),
            OrangeButton(
                text: 'Back', onTap: () => Navigator.pop(context, true)),
            Gap(25.h)
          ],
        ),
      ),
    );
  }

  Future<bool> isNetworkAvailable(String networkSsid) async {
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

  ModifiedContainer wifiCardView({String? password,
    String? networkSsid,
    String? connectedSSID,
    required bool isFav}) {
    log('is_Android connected to WiFi: $connectedSSID');

    return ModifiedContainer(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 8.h),
      color: Theme
          .of(context)
          .canvasColor,
      borderRadius: 12.sp,
      onTap: !isFav
          ? () async {
        if (connectedSSID != null && networkSsid == connectedSSID) {} else {
          controller.clear();
          await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) =>
                  _buildWifiBottomSheet(
                      context, controller, networkSsid, false));
          setState(() {});
        }
      }
          : () async {
        if (cameraWiBloc.lastConnectedSsid == null) {
          final found = await isNetworkAvailable(networkSsid!);
          if (found) {
            cameraWiBloc.add(
                ConnectToWifi(networkSsid ?? '', passphrase: password));
            cameraWiBloc..add(const GetConnectedSSID())..add(
                const LoadWifiNetworks());
            setState(() {});
          } else {
            toast("Camera ${cameraWiBloc.lastConnectedSsid} is not  available");
          }
        } else {
          toast("✅ Already connected to ${cameraWiBloc.lastConnectedSsid}");
        }
      },
      child: Row(
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 9.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.greyTextColor),
            child: Image.asset(
              'assets/icons/wifi_list.png',
            ),
          ),
          SizedBox(width: 14.w),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              networkSsid ?? 'Unknown Network',
              style:
              TextStyle(fontFamily: AppFontFamily.regular, fontSize: 14.sp),
            ),
            Text(
              connectedSSID != null && networkSsid == connectedSSID
                  ? 'Connected'
                  : 'Tap to connect',
              style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontFamily: AppFontFamily.regular,
                  fontSize: 12.sp),
            )
          ]),
          const Spacer(),
          isFav
              ? GestureDetector(
              onTap: () {
                locator<LocalStorageService>().saveNetwork('', '');
                cameraWiBloc..add(const GetConnectedSSID())..add(
                    const LoadWifiNetworks());
                setState(() {});
              },
              child: const Icon(Icons.remove_circle_outline,
                  color: Colors.red))
              : SizedBox(),
          connectedSSID != null && networkSsid == connectedSSID
              ? const Icon(Icons.check_circle, color: Colors.green)
              : SizedBox.shrink(),

          // : GestureDetector(
          // onTap: () async {
          //   if (networkSsid == connectedSSID) {
          //   } else {
          //     controller.clear();
          //     await showModalBottomSheet(
          //     isScrollControlled: true,
          //     backgroundColor: Colors.transparent,
          //     context: context,
          //     builder: (context) => _buildWifiBottomSheet(
          //         context, controller, networkSsid , true));
          //     setState(() {
          //     });
          //   }
          //   // locator<LocalStorageService>().saveNetwork('', '');
          //   // cameraWiBloc
          //   //   ..add(const GetConnectedSSID())
          //   //   ..add(const LoadWifiNetworks());
          //   // setState(() {
          //   //
          //   // });
          // },
          // child: const Icon(Icons.favorite_outline,
          //     color: Colors.orange)),
          // isConnected
          //     ? const Icon(Icons.check_circle,
          //         color: Colors.green)
          //     : const SizedBox(),
          // BlocBuilder<CameraWifiBloc, CameraWifiState>(
          //      builder: (context, state) {
          //        // if (state is ConnectedSSID && networkSsid == state.ssid) {
          //        //   connectedSSID = state.ssid;
          //        //   return const Icon(Icons.check_circle, color: Colors.green);
          //        // }else
          //        if (state is Connected && networkSsid == state.ssid) {
          //          connectedSSID = state.ssid;
          //        }
          //        return const SizedBox.shrink();
          //      },
          //  )
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    cameraWiBloc.add(const GetConnectedSSID());
    if (Platform.isAndroid) {
      cameraWiBloc.add(const LoadWifiNetworks());
    }
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // This is called when the app comes back to the foreground
      cameraWiBloc.add(const GetConnectedSSID());
      if (Platform.isAndroid) {
        cameraWiBloc.add(const LoadWifiNetworks());
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

// void openWiFiSettings() async {
//   if (Platform.isAndroid) {
//     const intent = AndroidIntent(
//       action: 'android.settings.WIFI_SETTINGS',
//     );
//     await intent.launch();
//   } else if (Platform.isIOS) {
//     const url = 'App-Prefs:root=WIFI';
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     } else {
//       print('Could not open Wi-Fi settings.');
//     }
//   } else {
//     print('This feature is not supported on this platform.');
//   }
// }
}

Widget _buildWifiBottomSheet(BuildContext context,
    TextEditingController controller, String? networkSsid, bool favRequest) {
  return BlocProvider(
    create: (context) => NewPasswordCubit(),
    child: BlocBuilder<NewPasswordCubit, bool>(
      builder: (context, state) {
        return BlocConsumer<CameraWifiBloc, CameraWifiState>(
          listener: (context, state) {
            if (state is Connected) {
              Navigator.pop(context, true);
              cameraWiBloc..add(const GetConnectedSSID())..add(
                  const LoadWifiNetworks());
            } else if (state is Error) {
              toast(state.message);
              cameraWiBloc..add(const GetConnectedSSID())..add(
                  const LoadWifiNetworks());
            }
          },
          builder: (context, stateWifi) {
            if (stateWifi is Loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return AppBottomSheet(
              height: 0.7,
              initialHeight: 0.36,
              scrollWidget: SigninTextfield(
                  hintText: '',
                  icon: '',
                  controller: TextEditingController(),
                  preIconHeight: 1),
              children: [
                SizedBox(height: 18.h),
                Center(child: Image.asset('assets/icons/wifi_logo.png')),
                SizedBox(height: 8.h),
                Center(
                  child: Text('Camera WiFi',
                      style: TextStyle(
                          color: AppColors.black,
                          fontFamily: AppFontFamily.bold,
                          fontSize: 20.sp)),
                ),
                SizedBox(height: 20.h),
                SigninTextfield(
                    hintText: 'Password',
                    icon: 'assets/icons/pass2.png',
                    preIconHeight: 18.h,
                    isObscure: state,
                    visibility: context
                        .read<NewPasswordCubit>()
                        .togglePasswordVisibility,
                    controller: controller),
                SizedBox(height: 26.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    favRequest
                        ? PrimaryButton(
                        title: 'Favourite',
                        onTap: () {
                          if (controller.text
                              .trim()
                              .isNotEmpty &&
                              networkSsid != null) {
                            locator<LocalStorageService>()
                                .saveNetwork(controller.text, networkSsid);
                            // cameraWiBloc.add(ConnectToWifi(
                            //     networkSsid ?? '',
                            //     passphrase: controller.text));
                            Navigator.pop(context, true);
                          } else {
                            toast('Please enter password');
                          }
                        })
                        : PrimaryButton(
                        title: 'Connect',
                        onTap: () {
                          if (controller.text
                              .trim()
                              .isNotEmpty &&
                              networkSsid != null) {
                            // locator<LocalStorageService>().saveNetwork(controller.text, networkSsid);
                            cameraWiBloc.add(ConnectToWifi(
                                networkSsid ?? '',
                                passphrase: controller.text));
                            Navigator.pop(context, true);
                          } else {
                            toast('Please enter password');
                          }
                        }),
                    SizedBox(width: 12.w),
                    PrimaryButton(
                        title: 'Add to Favourite\n& Connect',
                        onTap: () {
                          if (controller.text
                              .trim()
                              .isNotEmpty &&
                              networkSsid != null) {
                            locator<LocalStorageService>()
                                .saveNetwork(controller.text, networkSsid);
                            cameraWiBloc.add(ConnectToWifi(networkSsid ?? '',
                                passphrase: controller.text));
                            Navigator.pop(context, true);
                          } else {
                            toast('Please enter password');
                          }
                        }),
                  ],
                ),
                SizedBox(height: 16.h),
              ],
            );
          },
        );
      },
    ),
  );
}
