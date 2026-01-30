import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_usb_camera/flutter_usb_camera.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';

import 'package:pa_sreens/src/features/train/connectivity/presentation/view/connectivity_view.dart';
import 'package:pa_sreens/src/features/train/session/data/model/session_model.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/frams_streaming/socket_service.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/frams_streaming/test_bridge.dart';
import 'package:pa_sreens/src/features/train/session/presentation/view/session_start_view.dart';
import 'package:pa_sreens/src/features/train/session/presentation/view/session_start_view_updated.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/view/stage_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../test_stream/rtsp_batter_player.dart';
import '../test_stream/rtsp_vlc_player.dart';
import '../test_stream/session_start_view_test.dart';
import '../test_stream/usb_manager.dart';
import 'connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import 'connectivity/presentation/view/bluetooth_view.dart';
import 'connectivity/presentation/view/wifi_list_view.dart';
import 'stage/data/local/service/stage_db_helper.dart';

int? dis_glob = 1;
// final shoQdataBloc = locator<ShoQdataBloc>();

class TrainView extends StatefulWidget {
  const TrainView({super.key});

  @override
  State<TrainView> createState() => _TrainViewState();
}

class _TrainViewState extends State<TrainView> {
  late final CameraSocketHandler socketHandler;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrainBackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'Train', hideBack: true),
        // floatingActionButton: ElevatedButton(
        //   onPressed: () async {
        //      await runVideoProcessing();
        //   },
        //   child: const Text('Process Video'),
        // ),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.fromLTRB(14.w, 18.h, 14.w, 0),
          margin: EdgeInsets.fromLTRB(24.w, 121.h, 24.w, 0),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(24.w)),
          child: ListView(
            // mainAxisSize: MainAxisSize.min,
            children: [
              ModifiedContainer(
                padding: EdgeInsets.fromLTRB(6.w, 18.h, 6.w, 15.h),
                color: Theme.of(context).canvasColor,
                borderRadius: 12.sp,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConnectivityView()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.all(17.w),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isConnected
                                  ? AppColors.kPrimaryColor
                                  : AppColors.white),
                          height: 61.h,
                          width: 61.w,
                          child: Image.asset(isConnected
                              ? 'assets/icons/connect.png'
                              : 'assets/icons/connect_b.png')),
                    ),
                    Flexible(flex: 1, child: SizedBox(width: 16.w)),
                    Flexible(
                      flex: 5,
                      child: SizedBox(
                        height: 70.h,
                        width: 190.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                'Connect',
                                style:
                                    // Theme.of(context).textTheme.headlineMedium
                                    TextStyle(
                                        letterSpacing: 0.6,
                                        // color: AppColors.blackTextColor,
                                        fontSize: 16.sp,
                                        fontFamily: AppFontFamily.bold),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Flexible(
                              child: Text(
                                  'here will be the text for connect screen',
                                  style: TextStyle(
                                      letterSpacing: 0.6,
                                      color: AppColors.greyTextColor,
                                      fontFamily: AppFontFamily.regular,
                                      fontSize: 12.sp)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ModifiedContainer(
                padding: EdgeInsets.fromLTRB(6.w, 18.h, 6.w, 13.h),
                borderRadius: 12.w,
                color: Theme.of(context).canvasColor,
                margin: EdgeInsets.fromLTRB(0, 14.h, 0.w, 0),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const StageView()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(17.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isStage
                                ? AppColors.kPrimaryColor
                                : AppColors.white),
                        height: 61.h,
                        width: 61.w,
                        child: Image.asset(isStage
                            ? 'assets/icons/stage.png'
                            : 'assets/icons/stage_b.png'),
                      ),
                    ),
                    Flexible(flex: 1, child: SizedBox(width: 16.w)),
                    Flexible(
                      flex: 5,
                      child: SizedBox(
                        height: 72.h,
                        width: 190.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Stage',
                                textAlign: TextAlign.start,
                                style:
                                    // Theme.of(context).textTheme.headlineMedium,
                                    TextStyle(
                                        letterSpacing: 0.6,
                                        // color: AppColors.blackTextColor,
                                        fontSize: 16.sp,
                                        fontFamily: AppFontFamily.bold),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'here will be the text for stage screen',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    letterSpacing: 0.6,
                                    color: AppColors.greyTextColor,
                                    fontFamily: AppFontFamily.regular,
                                    fontSize: 12.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // ModifiedContainer(
              //   padding: EdgeInsets.fromLTRB(6.w, 18.h, 6.w, 13.h),
              //   borderRadius: 12.w,
              //   color: Theme.of(context).canvasColor,
              //   margin: EdgeInsets.fromLTRB(0, 14.h, 0.w, 0),
              //   onTap: () async {
              //    // await socketHandler.initSocket();
              //
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (_) =>  VlcRtspView(url: 'rtsp://192.168.42.1/live',)));
              //
              //     // Navigator.push(context,
              //     //     MaterialPageRoute(builder: (_) =>  RtspStreamPage()));
              //   },
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Flexible(
              //         flex: 2,
              //         child: Container(
              //           padding: EdgeInsets.all(17.w),
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: isStage
              //                   ? AppColors.kPrimaryColor
              //                   : AppColors.white),
              //           height: 61.h,
              //           width: 61.w,
              //           child: Image.asset(isStage
              //               ? 'assets/icons/stage.png'
              //               : 'assets/icons/stage_b.png'),
              //         ),
              //       ),
              //       Flexible(flex: 1, child: SizedBox(width: 16.w)),
              //       Flexible(
              //         flex: 5,
              //         child: SizedBox(
              //           height: 72.h,
              //           width: 190.w,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Flexible(
              //                 child: Text(
              //                   'Test stream',
              //                   textAlign: TextAlign.start,
              //                   style:
              //                       // Theme.of(context).textTheme.headlineMedium,
              //                       TextStyle(
              //                           letterSpacing: 0.6,
              //                           // color: AppColors.blackTextColor,
              //                           fontSize: 16.sp,
              //                           fontFamily: AppFontFamily.bold),
              //                 ),
              //               ),
              //               Flexible(
              //                 child: Text(
              //                   'Test simple stream  via Vlc',
              //                   textAlign: TextAlign.start,
              //                   style: TextStyle(
              //                       letterSpacing: 0.6,
              //                       color: AppColors.greyTextColor,
              //                       fontFamily: AppFontFamily.regular,
              //                       fontSize: 12.sp),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // ModifiedContainer(
              //   padding: EdgeInsets.fromLTRB(6.w, 18.h, 6.w, 13.h),
              //   borderRadius: 12.w,
              //   color: Theme.of(context).canvasColor,
              //   margin: EdgeInsets.fromLTRB(0, 14.h, 0.w, 0),
              //   onTap: () async {
              //    // await socketHandler.initSocket();
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (_) =>  FfmpegRtspView(url: 'rtsp://192.168.42.1/live',)));
              //     // Navigator.push(context,
              //     //     MaterialPageRoute(builder: (_) =>  RtspStreamPage()));
              //   },
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Flexible(
              //         flex: 2,
              //         child: Container(
              //           padding: EdgeInsets.all(17.w),
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: isStage
              //                   ? AppColors.kPrimaryColor
              //                   : AppColors.white),
              //           height: 61.h,
              //           width: 61.w,
              //           child: Image.asset(isStage
              //               ? 'assets/icons/stage.png'
              //               : 'assets/icons/stage_b.png'),
              //         ),
              //       ),
              //       Flexible(flex: 1, child: SizedBox(width: 16.w)),
              //       Flexible(
              //         flex: 5,
              //         child: SizedBox(
              //           height: 72.h,
              //           width: 190.w,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Flexible(
              //                 child: Text(
              //                   'Test stream ',
              //                   textAlign: TextAlign.start,
              //                   style:
              //                       // Theme.of(context).textTheme.headlineMedium,
              //                       TextStyle(
              //                           letterSpacing: 0.6,
              //                           // color: AppColors.blackTextColor,
              //                           fontSize: 16.sp,
              //                           fontFamily: AppFontFamily.bold),
              //                 ),
              //               ),
              //               Flexible(
              //                 child: Text(
              //                   'Test simple stream via (HLS and FFmpeg)',
              //                   textAlign: TextAlign.start,
              //                   style: TextStyle(
              //                       letterSpacing: 0.6,
              //                       color: AppColors.greyTextColor,
              //                       fontFamily: AppFontFamily.regular,
              //                       fontSize: 12.sp),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              ModifiedContainer(
                padding: EdgeInsets.fromLTRB(6.w, 18.h, 6.w, 13.h),
                borderRadius: 12.w,
                color: Theme.of(context).canvasColor,
                margin: EdgeInsets.fromLTRB(0, 14.h, 0.w, 0),
                onTap: () async {
                  // await socketHandler.initSocket();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UsbCameraPage()));

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) =>  RtspStreamPage()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(17.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isStage
                                ? AppColors.kPrimaryColor
                                : AppColors.white),
                        height: 61.h,
                        width: 61.w,
                        child: Image.asset(isStage
                            ? 'assets/icons/stage.png'
                            : 'assets/icons/stage_b.png'),
                      ),
                    ),
                    Flexible(flex: 1, child: SizedBox(width: 16.w)),
                    Flexible(
                      flex: 5,
                      child: SizedBox(
                        height: 72.h,
                        width: 190.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Session with cable',
                                textAlign: TextAlign.start,
                                style:
                                    // Theme.of(context).textTheme.headlineMedium,
                                    TextStyle(
                                        letterSpacing: 0.6,
                                        // color: AppColors.blackTextColor,
                                        fontSize: 16.sp,
                                        fontFamily: AppFontFamily.bold),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'Test simple stream via cable',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    letterSpacing: 0.6,
                                    color: AppColors.greyTextColor,
                                    fontFamily: AppFontFamily.regular,
                                    fontSize: 12.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // ModifiedContainer(
              //   padding: EdgeInsets.fromLTRB(6.w, 18.h, 6.w, 13.h),
              //   borderRadius: 12.w,
              //   color: Theme.of(context).canvasColor,
              //   margin: EdgeInsets.fromLTRB(0, 14.h, 0.w, 0),
              //   onTap: () async {
              //     final res = await exportAllInternalVideos(
              //       album: 'PA',
              //       mode: ExportMode.move,
              //     );
              //     if (!context.mounted) return;
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //           content: Text(
              //               'Saved: ${res.saved}, moved: ${res.moved}, failed: ${res.failed}')),
              //     );
              //   },
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Flexible(
              //         flex: 2,
              //         child: Container(
              //           padding: EdgeInsets.all(17.w),
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: isStage
              //                   ? AppColors.kPrimaryColor
              //                   : AppColors.white),
              //           height: 61.h,
              //           width: 61.w,
              //           child: Image.asset(isStage
              //               ? 'assets/icons/stage.png'
              //               : 'assets/icons/stage_b.png'),
              //         ),
              //       ),
              //       Flexible(flex: 1, child: SizedBox(width: 16.w)),
              //       Flexible(
              //         flex: 5,
              //         child: SizedBox(
              //           height: 72.h,
              //           width: 190.w,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Flexible(
              //                 child: Text(
              //                   'Debug',
              //                   textAlign: TextAlign.start,
              //                   style:
              //                       // Theme.of(context).textTheme.headlineMedium,
              //                       TextStyle(
              //                           letterSpacing: 0.6,
              //                           // color: AppColors.blackTextColor,
              //                           fontSize: 16.sp,
              //                           fontFamily: AppFontFamily.bold),
              //                 ),
              //               ),
              //               Flexible(
              //                 child: Text(
              //                   'Save videos for Debug',
              //                   textAlign: TextAlign.start,
              //                   style: TextStyle(
              //                       letterSpacing: 0.6,
              //                       color: AppColors.greyTextColor,
              //                       fontFamily: AppFontFamily.regular,
              //                       fontSize: 12.sp),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),

              BlocProvider.value(
                value: appBleDeviceBloc,
                child: BlocBuilder<AppBleDeviceBloc, AppBleDeviceState>(
                  builder: (context, stateBle) {
                    print("stateBle=== $stateBle");
                    bluetoothConnected =
                        appBleDeviceBloc.deviceConn?.remoteId != null;

                    // if (stateBle is Connected) {
                    //   bluetoothConnected = true;
                    // } else if (stateBle is ServicesDiscovered) {
                    //   bluetoothConnected = true;
                    // } else {
                    //   bluetoothConnected = false;
                    // }
                    return BlocProvider.value(
                      value: cameraWiBloc,
                      child: BlocBuilder<CameraWifiBloc, CameraWifiState>(
                        builder: (context, stateCam) {
                          // if (condition) {
                          // }
                          print("stateCam=== $stateCam");
                          wifiConnected =
                              cameraWiBloc.lastConnectedSsid != null &&
                                  cameraWiBloc.lastConnectedSsid != '';
                          bluetoothConnected =
                              appBleDeviceBloc.deviceConn?.remoteId != null;

                          // wifiConnected = (stateCam is cam.Connected) &&
                          //     stateCam.ssid.isNotEmpty &&
                          //     stateCam.ssid != '<unknown ssid>';
                          return ModifiedContainer(
                            padding: EdgeInsets.fromLTRB(6.w, 18.h, 6.w, 15.h),
                            color: Theme.of(context).canvasColor,
                            borderRadius: 12.w,
                            margin: EdgeInsets.fromLTRB(0.w, 14.h, 0.w, 14.h),
                            onTap: () async {
                              // showSetupRequiredDialog(context);
                              wifiConnected =
                                  cameraWiBloc.lastConnectedSsid != null &&
                                      cameraWiBloc.lastConnectedSsid != '';
                              bluetoothConnected =
                                  appBleDeviceBloc.deviceConn?.remoteId != null;
                              if (bluetoothConnected && wifiConnected) {
                                BotToast.showLoading();
                                StageEntity stageEntity = await StageDbHelper()
                                    .getStageForUser(
                                        locator<LocalStorageService>()
                                            .userIdString);
                                print("stageEntity_distance =====3");

                                BotToast.closeAllLoading();
                                if (context.mounted) {
                                  print("stageEntity_distance =====2");

                                  context.read<SessionBloc>().add(ShootEvent(
                                        sessionModel: SessionModel(
                                            missingShots: 0,
                                            listShots: null,
                                            shootModel: null,
                                            totalTime: null,
                                            sessionCountDown: null,
                                            isSessionStart: false,
                                            isSessionPaused: false,
                                            playedShoots: 0,
                                            totalScores: 0,
                                            sessionId: sessionIdFun(),
                                            stageEntity: stageEntity),
                                      ));
                                  print("stageEntity_distance =====1");

                                  // int des = int.parse(stageEntity.distance??"1");
                                  final des = int.tryParse(
                                          (stageEntity.distance ?? '1 meter')
                                              .split(' ')
                                              .first) ??
                                      1;
                                  dis_glob = null;
                                  dis_glob = des;
                                  print("stageEntity_distance $des");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SessionStartViewUpdated(
                                                distance: des,
                                                withCable: false,
                                              ))).then((v) {
                                    // if (context.mounted) {
                                    //   final state =
                                    //       BlocProvider.of<AppBleDeviceBloc>(context)
                                    //           .state;
                                    //   if ((state is! Connected) ||
                                    //       state is! ServicesDiscovered) {
                                    appBleDeviceBloc
                                        .add(const GetConnectedDevice());
                                    //   }
                                    // }
                                  });
                                }
                              } else {
                                toast(
                                    'Connect both wifi and bluetooth to continue');
                              }
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            bluetoothConnected && wifiConnected
                                                ? AppColors.kPrimaryColor
                                                : AppColors.white),
                                    height: 61.h,
                                    width: 61.w,
                                    child: Image.asset(
                                        bluetoothConnected && wifiConnected
                                            ? 'assets/icons/session.png'
                                            : 'assets/icons/session_b.png'),
                                  ),
                                ),
                                Flexible(flex: 1, child: SizedBox(width: 16.w)),
                                Flexible(
                                  flex: 5,
                                  child: SizedBox(
                                    height: 70.h,
                                    width: 190.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Session',
                                            // style: Theme.of(context)
                                            //     .textTheme
                                            //     .headlineMedium,
                                            style: TextStyle(
                                                letterSpacing: 0.6,
                                                // color: AppColors.blackTextColor,
                                                fontSize: 16.sp,
                                                fontFamily: AppFontFamily.bold),
                                          ),
                                        ),
                                        SizedBox(height: 3.h),
                                        Flexible(
                                          child: Text(
                                            'here will be the text for session screen',
                                            style: TextStyle(
                                                letterSpacing: 0.6,
                                                color: AppColors.greyTextColor,
                                                fontFamily:
                                                    AppFontFamily.regular,
                                                fontSize: 12.sp),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isStage = true;
  bool bluetoothConnected = false;
  bool wifiConnected = false;
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    // socketHandler = CameraSocketHandler(
    //   cameraIp: '192.168.42.1',
    //   commandPort: 7878,
    //   onSessionStarted: (int token) async {
    //     socketHandler.resetLiveView('55');
    //     // await socketHandler.setLowResolution();
    //   },
    // );
    appBleDeviceBloc.add(const GetConnectedDevice());
    cameraWiBloc.add(const GetConnectedSSID());

    getStageData();
    // _requestPermission();
    // _requestCameraPermission();
  }

  /// Requests camera permission and starts the USB camera stream
  Future<void> _requestCameraPermission() async {
    try {
      PermissionStatus status = await Permission.camera.status;

      if (status.isDenied) {
        status = await Permission.camera.request();
      }

      if (status.isGranted) {
        // await _startCameraStream();
      } else {}
    } finally {}
  }

  /// Starts the USB camera stream
  // Future<void> _startCameraStream() async {
  //   try {
  //     // Configure and start the camera stream
  //     // _imageStream = FlutterUsbCamera.frames()
  //     //     .asyncMap<ui.Image?>(_decodeFrame)
  //     //     .where((image) => image != null)
  //     //     .cast<ui.Image>();
  //
  //     setState(() {
  //     });
  //   } catch (e) {
  //     debugPrint('Failed to start camera stream: $e');
  //
  //   }
  // }

  Future<void> _requestPermission() async {
    // Use scoped storage permissions for Android 13+
    if (await Permission.photos.request().isGranted ||
        await Permission.videos.request().isGranted) {
    } else {
      await Permission.photos.request();
      await Permission.videos.request();
      // if (mounted) {
      //   showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: const Text('Permission Denied'),
      //       content:
      //           const Text('Please grant storage permission to use this app.'),
      //       actions: [
      //         TextButton(
      //           onPressed: () => Navigator.pop(context),
      //           child: const Text('OK'),
      //         ),
      //       ],
      //     ),
      //   );
      // }
    }
  }

  // this is working for stage page / fetching latest data from local on restart
  void getStageData() async {
    StageEntity stageEntity = await StageDbHelper()
        .getStageForUser(locator<LocalStorageService>().userIdString);
    if (mounted) {
      context.read<StageBloc>().add(StageUpdateEvent(stageEntity: stageEntity));
    }
  }

  late final ExpansibleController controller;

  void showSetupRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E212C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          titlePadding: EdgeInsets.only(top: 24.h),
          title: Center(
            child: Row(
              children: [
                Text(
                  'Setup Connectivity',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.cancel)))
              ],
            ),
          ),
          content: Text(
            'Please select any option which is compatible for you do you want to continue with cable or with wifi.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.sp,
              color: const Color(0xFFB0B3BA),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: EdgeInsets.only(bottom: 20.h),
          actions: [
            SizedBox(
              width: 0.20.sw,
              height: 44.h,
              child: ElevatedButton(
                onPressed: () {
                  _requestCameraPermission2(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'with cable',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 0.20.sw,
              height: 44.h,
              child: ElevatedButton(
                onPressed: () async {
                  wifiConnected = cameraWiBloc.lastConnectedSsid != null &&
                      cameraWiBloc.lastConnectedSsid != '';
                  bluetoothConnected =
                      appBleDeviceBloc.deviceConn?.remoteId != null;
                  if (bluetoothConnected && wifiConnected) {
                    BotToast.showLoading();
                    StageEntity stageEntity = await StageDbHelper()
                        .getStageForUser(
                            locator<LocalStorageService>().userIdString);
                    print("stageEntity_distance =====3");

                    BotToast.closeAllLoading();
                    if (context.mounted) {
                      print("stageEntity_distance =====2");

                      context.read<SessionBloc>().add(ShootEvent(
                            sessionModel: SessionModel(
                                missingShots: 0,
                                listShots: null,
                                shootModel: null,
                                totalTime: null,
                                sessionCountDown: null,
                                isSessionStart: false,
                                isSessionPaused: false,
                                playedShoots: 0,
                                totalScores: 0,
                                sessionId: sessionIdFun(),
                                stageEntity: stageEntity),
                          ));
                      print("stageEntity_distance =====1");

                      // int des = int.parse(stageEntity.distance??"1");
                      final des = int.tryParse(
                              (stageEntity.distance ?? '1 meter')
                                  .split(' ')
                                  .first) ??
                          1;
                      dis_glob = null;
                      dis_glob = des;
                      print("stageEntity_distance $des");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SessionStartViewUpdated(
                                  distance: des, withCable: false))).then((v) {
                        // if (context.mounted) {
                        //   final state =
                        //       BlocProvider.of<AppBleDeviceBloc>(context)
                        //           .state;
                        //   if ((state is! Connected) ||
                        //       state is! ServicesDiscovered) {
                        appBleDeviceBloc.add(const GetConnectedDevice());
                        //   }
                        // }
                      });
                    }
                  } else {
                    toast('Connect both wifi and bluetooth to continue');
                  }
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'with wifi',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _requestCameraPermission2(BuildContext context) async {
    try {
      PermissionStatus status = await Permission.camera.status;

      if (status.isDenied) {
        status = await Permission.camera.request();
      }

      if (status.isGranted) {
        // await _startCameraStream();
        BotToast.showLoading();
        StageEntity stageEntity = await StageDbHelper()
            .getStageForUser(locator<LocalStorageService>().userIdString);
        print("stageEntity_distance =====3");

        BotToast.closeAllLoading();
        if (context.mounted) {
          print("stageEntity_distance =====2");

          context.read<SessionBloc>().add(ShootEvent(
                sessionModel: SessionModel(
                    missingShots: 0,
                    listShots: null,
                    shootModel: null,
                    totalTime: null,
                    sessionCountDown: null,
                    isSessionStart: false,
                    isSessionPaused: false,
                    playedShoots: 0,
                    totalScores: 0,
                    sessionId: sessionIdFun(),
                    stageEntity: stageEntity),
              ));
          print("stageEntity_distance =====1");

          // int des = int.parse(stageEntity.distance??"1");
          final des = int.tryParse(
                  (stageEntity.distance ?? '1 meter').split(' ').first) ??
              1;
          dis_glob = null;
          dis_glob = des;
          print("stageEntity_distance $des");
          Navigator.of(context).pop();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SessionStartViewUpdated(
                      distance: des, withCable: true))).then((v) {
            // if (context.mounted) {
            //   final state =
            //       BlocProvider.of<AppBleDeviceBloc>(context)
            //           .state;
            //   if ((state is! Connected) ||
            //       state is! ServicesDiscovered) {
            appBleDeviceBloc.add(const GetConnectedDevice());
            //   }
            // }
          });
        }
        // setState(() {
        //   _permissionStatus = "Camera Permission Granted ✅";
        // });

        toast('Camera Permission Granted ✅');
      } else {
        // setState(() {
        //   _permissionStatus = "Camera Permission Denied ❌";
        // });
        toast('Camera Permission Denied ❌');
      }
    } catch (e) {
      toast('Error requesting permission: $e');
    } finally {}
  }
}

int sessionIdFun() {
  DateTime now = DateTime.now();
  int lastGeneratedTimestamp = 0;
  int baseTimestamp = int.parse(
      "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}"
      "${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}");
  if (locator<LocalStorageService>().getSessionId != null) {
    lastGeneratedTimestamp = locator<LocalStorageService>().getSessionId!;
  }
  int lastSessionCount = (lastGeneratedTimestamp == 0)
      ? 0
      : int.parse(lastGeneratedTimestamp.toString().substring(12));
  int newSessionCount = lastSessionCount + 1;
  lastGeneratedTimestamp = int.parse("$baseTimestamp$newSessionCount");
  // print('lastGeneratedTimestamp $lastGeneratedTimestamp');
  // sessionID = lastGeneratedTimestamp;
  return lastGeneratedTimestamp;
}

enum ExportMode { copy, move }

class ExportResult {
  final int total;
  final int saved;
  final int moved; // equals saved when mode == move and deletion succeeded
  final int failed;

  ExportResult(
      {required this.total,
      required this.saved,
      required this.moved,
      required this.failed});

  @override
  String toString() =>
      'ExportResult(total:$total, saved:$saved, moved:$moved, failed:$failed)';
}

Future<ExportResult> exportAllInternalVideos({
  String album = 'PA',
  ExportMode mode = ExportMode.move,
}) async {
  final docs =
      await getApplicationDocumentsDirectory(); // /data/user/0/<pkg>/app_flutter
  final files = Directory(docs.path)
      .listSync()
      .whereType<File>()
      .where((f) => f.path.toLowerCase().endsWith('.mp4'))
      .toList();

  int saved = 0, moved = 0, failed = 0;

  for (final f in files) {
    try {
      final ok =
          await GallerySaver.saveVideo(f.path, albumName: album) ?? false;
      if (!ok) {
        failed++;
        continue;
      }
      saved++;

      if (mode == ExportMode.move) {
        // Delete the source ONLY after a confirmed save.
        try {
          await f.delete();
          moved++;
        } catch (_) {
          // Saved to gallery but couldn't delete local copy; count as saved, not moved.
        }
      }
    } catch (_) {
      failed++;
    }
  }

  return ExportResult(
    total: files.length,
    saved: saved,
    moved: moved,
    failed: failed,
  );
}
