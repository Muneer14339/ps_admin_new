import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';
import '../../../../../core/helper/native_bindings.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/color/app_colors_new.dart';
import '../../../../../core/theme/font/app_fonts.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/bottom_sheet_.dart';
import '../../../../../core/widgets/modified_container.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../../core/widgets/signin_textfield.dart';
import '../../../../auth_new/signup_cubit.dart';
import '../../../../train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../../../../train/connectivity/presentation/view/wifi_list_view.dart';
import '../../../../train/connectivity/presentation/widgets/ios_wifi_item.dart';
import '../../../data/models/wifi_device_model.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import 'choose_wifi_ble.dart';

class WifiList extends StatefulWidget {
  static const String routeName = '/wifiList';

  const WifiList({super.key});

  @override
  State<WifiList> createState() => _WifiListState();
}

class _WifiListState extends State<WifiList> with WidgetsBindingObserver {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    cameraWiBloc.add(const GetConnectedSSID());
    if (Platform.isAndroid) {
      // cameraWiBloc.add(const LoadWifiNetworks());

    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocProvider.value(
          value: cameraWiBloc,
          child: Container(
            color: AppTheme.background(context),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: BackButtonWithTitle(
                      title: 'Wi-Fi Connections',
                      isShowRefreshIcon: true,
                      onRefresh: () {
                        cameraWiBloc.add(const GetConnectedSSID());
                        if (Platform.isAndroid) {
                          // if( cameraWiBloc.lastConnectedSsid==null){
                          // cameraWiBloc.add(ConnectToWifiBackGround());
                          // if (cameraWiBloc.lastConnectedSsid == null) {
                          //   WiFiForIoTPlugin.connect(
                          //     "fire_fly",
                          //     security: NetworkSecurity.WPA,
                          //     password: '12345678',
                          //     withInternet: false,
                          //     joinOnce: true,
                          //     timeoutInSeconds: 5,
                          //   );
                          // }
                          // cameraWiBloc.add(ConnectToWifiBackGround());

                          // }

                          WiFiSettings.scanWiFi();

                          cameraWiBloc.add(const LoadWifiNetworks());
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),

                  const SectionHeader(
                      title: 'Favourite Network', icon: Icons.wifi),
                  SizedBox(height: 10.h),

                  BlocBuilder<CameraWifiBloc, CameraWifiState>(
                          builder: (context, state)  {
                          print("check_fav___${state}");
                          if(locator<LocalStorageService>().getFavNetworkSsid != null){
                            if (state is Loaded) {
                              Map<String, WiFiAccessPoint?> uniqueNetworksMap = {};
                              for (WiFiAccessPoint? network in state.networks) {
                                if (network != null) {
                                  uniqueNetworksMap[network.ssid] = network;
                                }
                              }
                              List<WiFiAccessPoint?> networks =
                              uniqueNetworksMap.values.toList();
                              if(isFavSsidAvailable(networks)){
                                return wifiCardView(
                                    networkSsid: locator<LocalStorageService>()
                                        .getFavNetworkSsid,
                                    connectedSSID: cameraWiBloc.lastConnectedSsid,
                                    password: locator<LocalStorageService>()
                                        .getFavNetworkPass,
                                    isFav: true);
                              }else{
                                return Center(
                                  child: Text(
                                    'No Favourite Network Available',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: AppFontFamily.regular,
                                      color: AppTheme.textPrimary(context),
                                    ),
                                  ),
                                );
                              }

                            }
                            else if (state is Loading)  {
                              return Center(
                                child: Text(
                                  'Loading...',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: AppFontFamily.regular,
                                    color: AppTheme.textPrimary(context),
                                  ),
                                ),
                              );
                              // return wifiCardView(
                              //     networkSsid: locator<LocalStorageService>()
                              //         .getFavNetworkSsid,
                              //     connectedSSID: cameraWiBloc.lastConnectedSsid,
                              //     password: locator<LocalStorageService>()
                              //         .getFavNetworkPass,
                              //     isFav: true);
                            }else{
                              return SizedBox();
                            }
                          }else{
                           return Center(
                              child: Text(
                                'No Favourite Network Available',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: AppFontFamily.regular,
                                  color: AppTheme.textPrimary(context),
                                ),
                              ),
                            );
                          }

                        }),
                  SizedBox(height: 20.h),

                  const SectionHeader(
                      title: 'Available Devices', icon: Icons.wifi),

                  SizedBox(height: 8.h),
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
                        return Center(
                            child: Text('Connected to ${state.ssid}'));
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
                        networks.removeWhere((ap) => ap?.ssid == locator<LocalStorageService>().getFavNetworkSsid);

                        return SizedBox(
                          height: 355.h,
                          child: networks.isEmpty
                              ? Center(
                                  child: Text(
                                    'No networks found',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: AppFontFamily.regular,
                                      color: AppTheme.textPrimary(context),
                                    ),
                                  ),
                                )
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
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
                  ),

                  // ...availableDevices.map(
                  //   (d) => DeviceTile(
                  //     device: d,
                  //     connected: false,
                  //     onTapConnect: () {
                  //       _toggleConnection(context, d);
                  //     },
                  //   ),
                  // ),

                  SizedBox(height: 20.h),

                  // FIXED: IntrinsicHeight ensures both widgets have same height
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _AddNetworkButton(),
                        SizedBox(width: 20.w),
                        Expanded(child: const _WarningCard()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleConnection(BuildContext context, WifiDeviceModel device) {
    // Dispatch event to BLoC
    context.read<TrainingBloc>().add(ToggleWifiConnectionEvent(device));

    // Navigate back after connection (optional)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // You can choose to navigate back immediately or stay on the screen
      // If you want to navigate back:
      // if (Navigator.of(context).canPop()) {
      //   Navigator.of(context).pop();
      // }
    });
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
  bool isFavSsidAvailable(List<WiFiAccessPoint?> networks) {
    final favSsid = locator<LocalStorageService>().getFavNetworkSsid;

    if (favSsid == null || favSsid.isEmpty) return false;

    return networks.any((ap) => ap?.ssid == favSsid);
  }

  ModifiedContainer wifiCardView(
      {String? password,
      String? networkSsid,
      String? connectedSSID,
      required bool isFav}) {
    // log('is_Android connected to WiFi: $connectedSSID');

    return ModifiedContainer(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 8.h),
      color: connectedSSID != null && networkSsid == connectedSSID
          ? AppTheme.primary(context).withOpacity(0.2)
          : AppTheme.background(context),
      borderRadius: 12.sp,
      borderColor: AppTheme.primary(context).withOpacity(0.2),
      onTap: !isFav
          ? () async {
              if (connectedSSID != null && networkSsid == connectedSSID) {
              } else {
                controller.clear();
                await _showWifiDialog(
                  context,
                  controller, // e.g. TextEditingController()
                  networkSsid, // your WiFi SSID string
                  false, // true or false
                );
                // await showModalBottomSheet(
                //     isScrollControlled: true,
                //     useRootNavigator: true, // 👈 this makes it appear above the bottom bar
                //     backgroundColor: Colors.transparent,
                //     context: context,
                //     builder: (context) => _buildWifiBottomSheet(
                //         context, controller, networkSsid, false));
                setState(() {});
                cameraWiBloc.add(const GetConnectedSSID());
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
            toast("Camera $networkSsid is not  available");
          }
        } else {
          toast("✅ Already connected to ${cameraWiBloc.lastConnectedSsid}");
        }
      },
          // : () {
          //     if (cameraWiBloc.lastConnectedSsid == null) {
          //       cameraWiBloc.add(
          //           ConnectToWifi(networkSsid ?? '', passphrase: password));
          //       cameraWiBloc
          //         ..add(const GetConnectedSSID())
          //         ..add(const LoadWifiNetworks());
          //       setState(() {});
          //     } else {
          //       toast(
          //           "✅ Already connected to ${cameraWiBloc.lastConnectedSsid}");
          //     }
          //   },
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
              style: TextStyle(
                fontFamily: AppFontFamily.regular,
                fontSize: 14.sp,
                color: AppTheme.textPrimary(context),
              ),
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
                    cameraWiBloc
                      ..add(const GetConnectedSSID())
                      ..add(const LoadWifiNetworks());
                    setState(() {});
                  },
                  child: const Icon(Icons.remove_circle_outline,
                      color: Colors.red))
              : SizedBox(),
          SizedBox(width: 10,),
          // connectedSSID != null && networkSsid == connectedSSID
          //     ? const Icon(Icons.check_circle, color: Colors.green)
          //     : SizedBox.shrink(),
          connectedSSID != null && networkSsid == connectedSSID
              ? TextButton(
                  onPressed: () async {
                    cameraWiBloc.add( DisconnectRtspCamera(false));
                    // WiFiSettings.openWiFiSettings();

                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppTheme.primary(context),
                    foregroundColor: AppTheme.background(context),
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.h),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 10.h),
                    child: Text(
                      'Disconnect',
                      style: TextStyle(
                          color: AppTheme.background(context),
                          fontSize: 14.sp,
                          fontFamily: AppFontFamily.bold),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  // Widget wifiCardView(
  //     {String? password,
  //       String? networkSsid,
  //       String? connectedSSID,
  //       required bool isFav}) {
  //   return GestureDetector(
  //     onTap: !isFav
  //         ? () async {
  //       if (connectedSSID != null && networkSsid == connectedSSID) {
  //       } else {
  //         controller.clear();
  //         await showModalBottomSheet(
  //             isScrollControlled: true,
  //             backgroundColor: Colors.transparent,
  //             context: context,
  //             builder: (context) => _buildWifiBottomSheet(
  //                 context, controller, networkSsid, false));
  //         setState(() {});
  //       }
  //     }
  //         : () {
  //       if (cameraWiBloc.lastConnectedSsid == null) {
  //         cameraWiBloc.add(
  //             ConnectToWifi(networkSsid ?? '', passphrase: password));
  //         cameraWiBloc
  //           ..add(const GetConnectedSSID())
  //           ..add(const LoadWifiNetworks());
  //         setState(() {});
  //       } else {
  //         toast(
  //             "✅ Already connected to ${cameraWiBloc.lastConnectedSsid}");
  //       }
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(vertical: 6),
  //       decoration: BoxDecoration(
  //         color: connectedSSID != null && networkSsid == connectedSSID
  //             ? AppTheme.primary(context).withOpacity(0.2)
  //             : AppTheme.background(context),
  //         borderRadius: BorderRadius.circular(8),
  //         border: Border.all(color: AppTheme.primary(context).withOpacity(0.2)),
  //       ),
  //       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
  //       child: Row(
  //         children: [
  //           Icon(Icons.wifi, color: AppTheme.textSecondary(context), size: 26),
  //           SizedBox(width: 12.w),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   networkSsid ?? 'Unknown Network',
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: 14.sp,
  //                     color: AppTheme.textPrimary(context),
  //                   ),
  //                 ),
  //                 // SizedBox(height: 4.h),
  //                 // Text(
  //                 //   device.subtitle,
  //                 //   style: TextStyle(
  //                 //     color: AppTheme.textSecondary(context),
  //                 //     fontSize: 12.sp,
  //                 //   ),
  //                 // ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(width: 10.w),
  //           const Spacer(),
  //           isFav
  //               ? GestureDetector(
  //               onTap: () {
  //                 locator<LocalStorageService>().saveNetwork('', '');
  //                 cameraWiBloc
  //                   ..add(const GetConnectedSSID())
  //                   ..add(const LoadWifiNetworks());
  //                 setState(() {});
  //               },
  //               child: const Icon(Icons.remove_circle_outline,
  //                   color: Colors.red))
  //               : SizedBox(),
  //           connectedSSID != null && networkSsid == connectedSSID
  //               ? const Icon(Icons.check_circle, color: Colors.green)
  //               : SizedBox.shrink(),
  //           AnimatedSwitcher(
  //             duration: const Duration(milliseconds: 250),
  //             child: connectedSSID != null && networkSsid == connectedSSID
  //                 ? TextButton.icon(
  //               key: const ValueKey('connected'),
  //               onPressed: onTapConnect,
  //               icon: Icon(
  //                 Icons.check,
  //                 size: 18,
  //                 color: AppTheme.background(context),
  //               ),
  //               label: Text(
  //                 'Connected',
  //                 style: TextStyle(color: AppTheme.background(context) , fontSize: 14.sp),
  //               ),
  //               style: TextButton.styleFrom(
  //                 backgroundColor: AppTheme.primary(context),
  //                 foregroundColor: AppTheme.background(context),
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 12,
  //                   vertical: 8,
  //                 ),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(8),
  //                 ),
  //               ),
  //             )
  //                 : OutlinedButton(
  //               key: const ValueKey('connect'),
  //               onPressed: onTapConnect,
  //               style: OutlinedButton.styleFrom(
  //                 foregroundColor: AppTheme.primary(context),
  //                 side: BorderSide(color: AppTheme.primary(context)),
  //                 padding:  EdgeInsets.symmetric(
  //                   horizontal: 12.w,
  //                   vertical: 8.h,
  //                 ),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(8),
  //                 ),
  //               ),
  //               child: Text(
  //                 'Connect',
  //                 style: TextStyle(color: AppTheme.primary(context), fontSize: 14.sp),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
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
                cameraWiBloc
                  ..add(const GetConnectedSSID())
                  ..add(const LoadWifiNetworks());
              } else if (state is Error) {
                toast(state.message);
                cameraWiBloc
                  ..add(const GetConnectedSSID())
                  ..add(const LoadWifiNetworks());
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
                                if (controller.text.trim().isNotEmpty &&
                                    networkSsid != null) {
                                  locator<LocalStorageService>().saveNetwork(
                                      controller.text, networkSsid);
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
                                if (controller.text.trim().isNotEmpty &&
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
                            if (controller.text.trim().isNotEmpty &&
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

  Future<void> _showWifiDialog(
    BuildContext context,
    TextEditingController controller,
    String? networkSsid,
    bool favRequest,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: AppTheme.background(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: BlocProvider(
            create: (context) => NewPasswordCubit(),
            child: BlocBuilder<NewPasswordCubit, bool>(
              builder: (context, state) {
                return BlocConsumer<CameraWifiBloc, CameraWifiState>(
                  listener: (context, state) {
                    if (state is Connected) {
                      Navigator.pop(dialogContext, true);
                      cameraWiBloc
                        ..add(const GetConnectedSSID())
                        ..add(const LoadWifiNetworks());
                    } else if (state is Error) {
                      toast(state.message);
                      cameraWiBloc
                        ..add(const GetConnectedSSID())
                        ..add(const LoadWifiNetworks());
                    }
                  },
                  builder: (context, stateWifi) {
                    if (stateWifi is Loading) {
                      return const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 24.h,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/icons/wifi_logo.png',
                                height: 60.h,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Camera WiFi',
                              style: TextStyle(
                                color: AppTheme.primary(context),
                                fontFamily: AppFontFamily.bold,
                                fontSize: 20.sp,
                              ),
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
                              controller: controller,
                            ),
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
                                                .saveNetwork(
                                              controller.text,
                                              networkSsid,
                                            );
                                            Navigator.pop(dialogContext, true);
                                          } else {
                                            toast('Please enter password');
                                          }
                                        },
                                      )
                                    : PrimaryButton(
                                        title: 'Connect',
                                        onTap: () {
                                          if (controller.text
                                                  .trim()
                                                  .isNotEmpty &&
                                              networkSsid != null) {
                                            cameraWiBloc.add(
                                              ConnectToWifi(
                                                networkSsid,
                                                passphrase: controller.text,
                                              ),
                                            );
                                            Navigator.pop(dialogContext, true);
                                          } else {
                                            toast('Please enter password');
                                          }
                                        },
                                      ),
                                SizedBox(width: 12.w),
                                PrimaryButton(
                                  title: 'Add to Favourite\n& Connect',
                                  onTap: () {
                                    if (controller.text.trim().isNotEmpty &&
                                        networkSsid != null) {
                                      locator<LocalStorageService>()
                                          .saveNetwork(
                                        controller.text,
                                        networkSsid,
                                      );
                                      cameraWiBloc.add(
                                        ConnectToWifi(
                                          networkSsid,
                                          passphrase: controller.text,
                                        ),
                                      );
                                      Navigator.pop(dialogContext, true);
                                    } else {
                                      toast('Please enter password');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionHeader({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary(context),
          ),
        ),
      ],
    );
  }
}

class _AddNetworkButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.orangeAccent,
        side: const BorderSide(color: Colors.orangeAccent),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        WiFiSettings.openWiFiSettings();
      },
      icon: const Icon(Icons.add),
      label: Text(
        'Add Camera',
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: AppFontFamily.regular,
          color: AppTheme.primary(context),
        ),
      ),
    );
  }
}

class _WarningCard extends StatelessWidget {
  const _WarningCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orangeAccent.withOpacity(0.6)),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded,
            color: Colors.orangeAccent,
            size: 20.sp,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              'If Camera Wi-Fi name is not listed here, you need to turn on your camera and tap on Add Network button',
              style: TextStyle(
                color: Colors.orangeAccent.withOpacity(0.9),
                fontSize: 14.sp,
                fontFamily: AppFontFamily.regular,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
