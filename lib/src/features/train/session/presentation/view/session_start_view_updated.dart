import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'dart:ui' as ui;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_usb_camera/flutter_usb_camera.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:pa_sreens/src/core/helper/helper_methods.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/custom_slider.dart';
import 'package:pa_sreens/src/core/widgets/toast.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/timer_bloc/listning_timer_bloc.dart';
import 'package:pa_sreens/src/features/train/session/data/model/session_model.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/view/session_completed_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/enum/session_enum.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes_services.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_switch.dart';
import '../../../../../core/widgets/dialog_new.dart';
import '../../../../test_stream/usb_manager.dart';
import '../../../../training_new/presentation/widgets/view/training_layout_view.dart';
import '../../../connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../../../connectivity/presentation/view/bluetooth_view.dart';
import '../../../connectivity/presentation/view/wifi_list_view.dart';
import '../../../stage/data/model/stage_entity.dart';
import '../component/fram_streaming_widget.dart';
import '../component/frams_streaming/native_opencv.dart';
import '../component/frams_streaming/stream_manager.dart';
import '../component/stop_watch.dart';
import 'package:path_provider/path_provider.dart';

import '../widgets/caliberate_dialoge.dart';
import 'session_start_view.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:flutter/rendering.dart';

DateTime? startTime;
DateTime? startTimeCheck;
Uint8List? frameBytesMissingShot;

class SessionStartViewUpdated extends StatefulWidget {
  const SessionStartViewUpdated(
      {super.key, required this.distance, required this.withCable});

  final int distance;
  final bool withCable;

  @override
  State<SessionStartViewUpdated> createState() =>
      _SessionStartViewUpdatedState();
}

class _SessionStartViewUpdatedState extends State<SessionStartViewUpdated> {
  final GlobalKey _repaintBoundaryKey = GlobalKey();
  Timer? _timer;
  int? distance_new;
  int currentShootNew = 0;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    checkD = false;
    audioPlayer = AudioPlayer();
    if (widget.withCable) {
      _requestCameraPermission();
      // UsbCameraManager.initializeCallbacks();
    }
    distance_new = widget.distance;
    print("distance_new==$distance_new");
    slRtspStreamingBloc.add(
        RtspStreamingEvent.started(1, distance_new ?? 1, widget.withCable));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    _requestPermission();
    KeepScreenOn.turnOn();
  }

  @override
  void dispose() {
    _timer?.cancel();
    checkD = false;
    stopBeepTimer();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown
    // ]);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);

    widget.withCable ? UsbCameraManager.dispose() : null;

    super.dispose();
  }

  Future<void> _captureAndSave(BuildContext context) async {
    // Small delay so the IconButton ripple isn't captured
    await Future.delayed(const Duration(milliseconds: 150));

    try {
      final boundary = _repaintBoundaryKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) {
        toast('Capture failed: boundary not ready.');
        return;
      }

      final dpr = MediaQuery.of(context).devicePixelRatio;
      final ui.Image image = await boundary.toImage(pixelRatio: dpr);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      final name = 'screenshot_${DateTime.now().millisecondsSinceEpoch}';
      final res = await ImageGallerySaverPlus.saveImage(
        pngBytes,
        quality: 100,
        name: name,
        isReturnImagePathOfIOS: true, // iOS returns a local path when true
      );
      final ok = res is Map &&
          (res['isSuccess'] == true ||
              res['filePath'] != null ||
              res['filePath'] is String);
      toast(ok ? 'Screenshot saved to gallery.' : 'Failed to save screenshot.');
    } catch (e) {
      toast('Error: $e');
    }
  }

  Future<void> _requestCameraPermission() async {
    try {
      PermissionStatus status = await Permission.camera.status;

      if (status.isDenied) {
        status = await Permission.camera.request();
      }

      if (status.isGranted) {
        FlutterUsbCamera.startStream(
          fps: 10,
          croppedWidth: 680,
          croppedHeight: 680,
        );
      } else {}
    } finally {}
  }

  /// Starts the USB camera stream
  Future<ui.Image?> _decodeFrame(Uint8List frameBytes) async {
    try {
      final codec = await ui.instantiateImageCodec(
        frameBytes,
        // Optional: Add target dimensions for performance
        // targetWidth: 360,
        // targetHeight: 360,
      );

      final frameInfo = await codec.getNextFrame();
      return frameInfo.image;
    } catch (e) {
      // Silently ignore decode errors - common with MJPEG streams
      return null;
    }
  }

  Future<void> _requestPermission() async {
    // Use scoped storage permissions for Android 13+
    if (await Permission.photos.request().isGranted ||
        await Permission.videos.request().isGranted) {
      dir = await getApplicationDocumentsDirectory();
      uuid = const Uuid();
    } else {
      await Permission.photos.request();
      await Permission.videos.request();
    }
  }

  late Directory dir;
  var uuid = const Uuid();

  String? getImagePath(int? sessionId) {
    if (frameBytesMissingShot != null) {
      String imgPath = '${dir.path}/${uuid.v4()}$sessionId$currentShootNew.png';
      File(imgPath).writeAsBytesSync(frameBytesMissingShot!);
      return imgPath;
    } else {
      return null;
    }
  }

  // void showGenericDialog(BuildContext context, String title, String content) {
  //   showDialog(
  //     context: context,
  //
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  //         child: Container(
  //           color: AppTheme.background(context),
  //           constraints: BoxConstraints(
  //               maxHeight: MediaQuery.of(context).size.height * 0.50),
  //           padding: EdgeInsets.all(20.0),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 title,
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary(context),),
  //               ),
  //               SizedBox(height: 10.h),
  //               Expanded(
  //                 child: SingleChildScrollView(
  //                   child: RichText(
  //                     text: _parseText(content),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 5.h),
  //               TextButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 style: TextButton.styleFrom(
  //                   padding: EdgeInsets.all(8),
  //                   minimumSize: Size.zero,
  //                   // fixedSize: Size(50.w, 36.h),
  //                   backgroundColor: AppColors.kPrimaryColor,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(6.h),
  //                   ),
  //                 ),
  //                 child: Text(
  //                   'OK',
  //                   style: TextStyle(
  //                       color: AppColors.white,
  //                       fontSize: 18.sp,
  //                       fontFamily: AppFontFamily.bold),
  //                 ),
  //               ),
  //
  //               // Padding(
  //               //   padding: const EdgeInsets.symmetric(vertical: 10),
  //               //   child: Align(
  //               //     alignment: Alignment.center,
  //               //     child: ElevatedButton(
  //               //       style: ElevatedButton.styleFrom(
  //               //         backgroundColor: Colors.orange,
  //               //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //               //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
  //               //       ),
  //               //       onPressed: () {
  //               //         Navigator.of(context).pop();
  //               //       },
  //               //       child: Text("OK", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  //               //     ),
  //               //   ),
  //               // ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  void showGenericDialog(
    BuildContext context, {
    required String title,
    required String content,
    Widget? icon,
    String okLabel = 'OK',
    VoidCallback? onOk,
    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: GenericDialogCard(
          title: title,
          content: content,
          icon: icon,
          okLabel: okLabel,
          onOk: onOk,
        ),
      ),
    );
  }

  Future<void> playBeep() async {
    audioPlayer.play(AssetSource('audio/sharp_beep_1s_1.mp3'));
    // await audioPlayer.play(AssetSource('audio/sharp_beep_100ms.wav'));
  }

  Timer? _beepTimer;

  void startBeepTimer(int seconds) {
    // var st = context.read<SessionBloc>().state;
    _beepTimer?.cancel();
    _beepTimer = Timer.periodic(
      Duration(seconds: seconds),
      (timer) {
        // if (st is ShootState) {
        //   if(st.sessionModel.isSessionPaused!=null && st.sessionModel.isSessionPaused!){
        //   }
        //   playBeep();
        // }
        playBeep();
      },
    );
  }

  void stopBeepTimer() {
    _beepTimer?.cancel();
    _beepTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sliderDotsColor,
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, statesession) {
          if (statesession is ShootState) {
            return BlocProvider.value(
              value: cameraWiBloc,
              child:
                BlocConsumer<CameraWifiBloc, CameraWifiState>(
                  listenWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
                  listener: (context, stateCam) {
                    if (stateCam is DisConnectedCam) {
                      final isConnected =
                          ((cameraWiBloc.lastConnectedSsid != null &&
                              cameraWiBloc.lastConnectedSsid != '') ||
                              (cameraWiBloc.withWire != null &&
                                  cameraWiBloc.withWire == true)) &&
                              appBleDeviceBloc.deviceConn?.remoteId != null;
                      if (isConnected == false) {
                        final page = SessionPage.setup;
                        final route = AppRoutes.setupView;
                        pageSes = SessionPage.setup;
                        // blocTr.add(NavigateToEvent(page, route));
                        // locator<RoutesService>().navigateTo(route);
                        if (listShoots.length > 0) {
                          pause();
                          showGenericDialog(
                            context,
                            title: titleDisconnectedCam,
                            content: dDisconnectedCam,
                            icon: const Text('⚠️',
                                style: TextStyle(fontSize: 28)),
                          );
                        }
                        else {
                          log('Device Disconnected----');
                          /// Reset Global Variables
                          stateBle_counter = 0;
                          totalScores = 0;
                          listShoots = [];

                          /// Reset Session Model
                          SessionModel model = SessionModel(
                            isSessionStart: false,
                            makeScoreVisible: null,
                            shootModel: null,
                            listShots: null,
                            numberOfShots: null,
                            playedShoots: 0,
                            totalScores: 0,
                            totalTime: null,
                            isSessionPaused: false,
                          );

                          /// Dispatch Reset Event
                          context
                              .read<SessionBloc>()
                              .add(ShootEvent(sessionModel: model));
                          if (statesession.sessionModel.isSessionStart !=
                              true) {
                            slRtspStreamingBloc.add(
                                const RtspStreamingEvent.disposeBloc(true));
                          } else {
                            slRtspStreamingBloc.add(
                                const RtspStreamingEvent.disposeBloc(false));
                          }
                          Navigator.pop(context);

                          /// Show Toast & Navigate if Possible
                          // if (Navigator.canPop(context)) {
                          //   // Toast.show(context,
                          //   //     message: 'BLE device is disconnected');
                          //   Navigator.pop(context);
                          // } else {
                          //   log('Device Disconnected Else Case');
                          // }
                        }

                      }
                    }

                  },
                builder: (context, stateCam) {
                  return BlocProvider.value(
                    value: appBleDeviceBloc,
                    child: BlocListener<AppBleDeviceBloc, AppBleDeviceState>(
                      listenWhen: (_, __) =>
                          (ModalRoute.of(context)?.isCurrent ?? false),
                      listener: (context, stateBle) async {
                        if (stateBle is DeviceIsDisconnected) {
                          if (listShoots.length > 0) {
                            pause();
                          }
                          else {
                            log('Device Disconnected----');
                            /// Reset Global Variables
                            stateBle_counter = 0;
                            totalScores = 0;
                            listShoots = [];

                            /// Reset Session Model
                            SessionModel model = SessionModel(
                              isSessionStart: false,
                              makeScoreVisible: null,
                              shootModel: null,
                              listShots: null,
                              numberOfShots: null,
                              playedShoots: 0,
                              totalScores: 0,
                              totalTime: null,
                              isSessionPaused: false,
                            );

                            /// Dispatch Reset Event
                            context
                                .read<SessionBloc>()
                                .add(ShootEvent(sessionModel: model));
                            if (statesession.sessionModel.isSessionStart !=
                                true) {
                              slRtspStreamingBloc.add(
                                  const RtspStreamingEvent.disposeBloc(true));
                            } else {
                              slRtspStreamingBloc.add(
                                  const RtspStreamingEvent.disposeBloc(false));
                            }

                            /// Show Toast & Navigate if Possible
                            if (Navigator.canPop(context)) {
                              Toast.show(context,
                                  message: 'BLE device is disconnected');
                              Navigator.pop(context);
                            } else {
                              log('Device Disconnected Else Case');
                            }
                          }
                        }
                      },
                      child: PopScope(
                        canPop:
                            statesession.sessionModel.isSessionStart != true,
                        child: Stack(
                          children: [
                            RepaintBoundary(
                              key: _repaintBoundaryKey,
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: ScreenUtil().screenHeight,
                                      width: ScreenUtil().screenHeight,
                                      child: FrameStreamingWidget(
                                        streamMode: 1,
                                        distance: widget.distance,
                                        withCable: widget.withCable,
                                      )),
                                  Expanded(
                                    child:
                                        // Stack(
                                        //   children: [
                                        Container(
                                      color: AppTheme.background(context),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                7.w, 15.h, 7.w, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                statesession.sessionModel
                                                            .isSessionStart ==
                                                        true
                                                    ? SizedBox()
                                                    : InkWell(
                                                        onTap: () {
                                                          if (widget
                                                              .withCable) {
                                                            UsbCameraManager
                                                                .dispose();
                                                            Navigator.pop(
                                                                context);
                                                          } else {
                                                            slRtspStreamingBloc.add(
                                                                RtspStreamingEvent
                                                                    .setFovOptionsEvent(
                                                                        '85',
                                                                        true));

                                                            if (statesession
                                                                    .sessionModel
                                                                    .isSessionStart !=
                                                                true) {
                                                              slRtspStreamingBloc.add(
                                                                  const RtspStreamingEvent
                                                                      .disposeBloc(
                                                                      true));
                                                            }
                                                          }
                                                          //   if (
                                                          //   slRtspStreamingBloc
                                                          //       .isStreamStarted) {
                                                          //     slRtspStreamingBloc.add(
                                                          //         const RtspStreamingEvent
                                                          //             .disposeBloc());
                                                          //     Navigator.pop(context);
                                                          //
                                                          //   } else {
                                                          //     slRtspStreamingBloc.add(
                                                          //         const RtspStreamingEvent
                                                          //             .disposeBloc());
                                                          //   }
                                                          // }
                                                          // slRtspStreamingBloc.add(
                                                          //     const RtspStreamingEvent
                                                          //         .disposeBloc(true));
                                                          // else if (statesession.sessionModel
                                                          //         .isSessionStart !=
                                                          //     true) {
                                                          //   context.read<SessionBloc>().add(
                                                          //       ShootEvent(
                                                          //           sessionModel: statesession
                                                          //               .sessionModel
                                                          //               .copyWith(
                                                          //                   isSessionStart:
                                                          //                       false)));
                                                          // }
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .arrow_back_ios_new_rounded,
                                                          color:
                                                              AppColors.white,
                                                          size: 20,
                                                        ),
                                                      ),
                                                Spacer(),
                                                Text('${slRtspStreamingBloc.btry}' , style: TextStyle(color: AppColors.white),),
                                                // Image.asset('assets/icons/calibration.png',
                                                //     color: AppColors.kPrimaryColor,
                                                //     height: 20.h),
                                                // statesession.sessionModel
                                                //             .makeScoreVisible ==
                                                //         false
                                                //     ? SizedBox()
                                                //     : Text(
                                                //         (statesession.sessionModel
                                                //                         .isSessionAuto ==
                                                //                     null
                                                //                 ? false
                                                //                 : statesession.sessionModel
                                                //                     .isSessionAuto!)
                                                //             ? 'Auto mode'
                                                //             : 'Manual mode',
                                                //         style: TextStyle(
                                                //             fontFamily:
                                                //                 AppFontFamily.regular,
                                                //             color: AppTheme.textPrimary(context),
                                                //             fontSize: 14.sp),
                                                //       ),
                                                //
                                                // SizedBox(
                                                //   width: 3.w,
                                                // ),
                                                // ClickPositionTooltip(
                                                //   message:
                                                //       'Auto: System automatically calculates scores\nManual: You input scores manually',
                                                //   offset: const Offset(-150, 20),
                                                //   // shift it up 30px from where you tapped
                                                //   child:  Icon(
                                                //       Icons.info_outline_rounded , color: AppTheme.textPrimary(context)),
                                                // ),
                                                // SizedBox(
                                                //   width: 3.w,
                                                // ),
                                                // statesession.sessionModel
                                                //             .makeScoreVisible ==
                                                //         false
                                                //     ? SizedBox()
                                                //     : CustomSwitch(
                                                //         value: statesession.sessionModel
                                                //                     .isSessionAuto ==
                                                //                 null
                                                //             ? false
                                                //             : statesession.sessionModel
                                                //                 .isSessionAuto!,
                                                //         border: Border.all(
                                                //             color: AppTheme.primary(context),
                                                //             width: 0.5),
                                                //         onChanged: (value) {
                                                //           SessionModel model =
                                                //               statesession.sessionModel;
                                                //
                                                //           context.read<SessionBloc>().add(
                                                //               ShootEvent(
                                                //                   sessionModel:
                                                //                       model.copyWith(
                                                //                           isSessionAuto:
                                                //                               value)));
                                                //         },
                                                //         disableColor:
                                                //         AppTheme.primary(context).withOpacity(0.2),
                                                //         enableColor:
                                                //         AppTheme.primary(context),
                                                //         height: 20,
                                                //         switchHeight: 19,
                                                //         radius: 100,
                                                //         disable: statesession.sessionModel
                                                //                 .isSessionStart ==
                                                //             true,
                                                //       ),
                                                statesession.sessionModel
                                                            .isSessionStart ==
                                                        true
                                                    ? IconButton(
                                                        icon: Icon(
                                                          Icons.download,
                                                          size: 26,
                                                          color:
                                                              AppTheme.primary(
                                                                  context),
                                                        ),
                                                        onPressed: () async {
                                                          await _captureAndSave(
                                                              context);
                                                        },
                                                      )
                                                    : SizedBox(),
                                                GestureDetector(
                                                  onDoubleTap: () {
                                                    // slRtspStreamingBloc.add(
                                                    //     RtspStreamingEvent.setIsoOptionsEvent('a'));
                                                  },
                                                  child: Icon(
                                                    widget.withCable
                                                        ? Icons.cable
                                                        : Icons.wifi,
                                                    size: 20,
                                                    color: AppTheme.primary(
                                                        context),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Icon(
                                                  appBleDeviceBloc.deviceConn
                                                              ?.remoteId !=
                                                          null
                                                      ? Icons
                                                          .bluetooth_audio_outlined
                                                      : Icons
                                                          .bluetooth_disabled_rounded,
                                                  size: 20,
                                                  color:
                                                      AppTheme.primary(context),
                                                ),
                                                // SizedBox(
                                                //   width: 8.w,
                                                // ),
                                                // Image.asset('assets/icons/Battery.png',
                                                //     height: 20),
                                                SizedBox(
                                                  width: 16.w,
                                                ),
                                                // statesession.sessionModel.makeScoreVisible !=
                                                //         true
                                                //     ? ResolutionDropdown()
                                                //     :
                                                // InkWell(
                                                //     onTap: () => '',
                                                //     child: Image.asset(
                                                //       'assets/icons/session_setting.png',
                                                //       height: 20,
                                                //     )),
                                              ],
                                            ),
                                          ),
                                          // Visibility(
                                          //     visible:
                                          //         statesession.sessionModel.isSessionStart !=
                                          //             true,
                                          //     child: CameraSettingsScreen()),
                                          statesession.sessionModel
                                                      .makeScoreVisible ==
                                                  true
                                              ? Expanded(
                                                  child: sessionScoreView())
                                              : Expanded(
                                                  child: CalibirateDialoge(
                                                  isSessionAuto: true,
                                                  // isSessionAuto: statesession
                                                  //             .sessionModel
                                                  //             .isSessionAuto ==
                                                  //         null
                                                  //     ? true
                                                  //     : statesession.sessionModel
                                                  //         .isSessionAuto!
                                                )),

                                          Visibility(
                                            visible: statesession.sessionModel
                                                    .isSessionStart !=
                                                true,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w,
                                                  vertical: 10.h),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: BlocBuilder<
                                                    RtspStreamingBloc,
                                                    RtspStreamingState>(
                                                  builder: (context, state) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        state.streamState ==
                                                                'open_stream'
                                                            ? TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              16,
                                                                          vertical:
                                                                              8),
                                                                  minimumSize:
                                                                      Size.zero,
                                                                  // fixedSize:
                                                                  //     Size(100.w, 36.h),
                                                                  backgroundColor:
                                                                      AppColors
                                                                          .kRedColor,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.h)),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  print(state
                                                                      .streamState);
                                                                  slRtspStreamingBloc.add(
                                                                      const RtspStreamingEvent
                                                                          .stopCircleDetection());
                                                                },
                                                                child: Text(
                                                                    state.isLoading ||
                                                                            state
                                                                                .isFovLoading
                                                                        ? "Loading..."
                                                                        : state.error ==
                                                                                "404"
                                                                            ? "Reconnect"
                                                                            : (state.streamState == 'detect_circles'
                                                                                ? 'Frame Target'
                                                                                : 'Stop'),
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .white,
                                                                        fontSize: 14
                                                                            .sp,
                                                                        fontFamily:
                                                                            AppFontFamily.bold)))
                                                            : SizedBox(),
                                                        SizedBox(
                                                          width: 14.w,
                                                        ),
                                                        StreamBuilder<int>(
                                                          stream:
                                                              StreamManager()
                                                                  .ringsStream,
                                                          initialData: 0,
                                                          builder: (context,
                                                              snapshot) {
                                                            final frameIndex =
                                                                snapshot.data!;
                                                            return TextButton(
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  minimumSize:
                                                                      Size.zero,
                                                                  // fixedSize: Size(100.w, 36.h),
                                                                  backgroundColor:
                                                                      AppColors
                                                                          .kPrimaryColor,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.h)),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  print(state
                                                                      .streamState);
                                                                  if (state
                                                                          .streamState ==
                                                                      'detect_circles') {
                                                                    slRtspStreamingBloc.add(
                                                                        const RtspStreamingEvent
                                                                            .detectCircleProcessingEvent());
                                                                  } else if (state
                                                                          .streamState ==
                                                                      'open_stream') {
                                                                    if (frameIndex ==
                                                                        6) {
                                                                      stateBle_counter =
                                                                          0;
                                                                      totalScores =
                                                                          0;
                                                                      listShoots =
                                                                          [];
                                                                      slRtspStreamingBloc.add(
                                                                          const RtspStreamingEvent
                                                                              .startFrameProcessing());
                                                                      toast(
                                                                          'Mode: ${statesession.sessionModel.stageEntity?.mode?.name}');
                                                                      log(' isSessionStart =-=-=-= ${statesession.sessionModel.isSessionStart}');
                                                                      log(' isSessionPaused =-=-=-= ${statesession.sessionModel.isSessionPaused}');
                                                                      modeHandler(statesession
                                                                          .sessionModel
                                                                          .copyWith(
                                                                              makeScoreVisible: true));
                                                                    }
                                                                  } else {
                                                                    slRtspStreamingBloc.add(
                                                                        RtspStreamingEvent.startStreaming(
                                                                            widget.withCable));
                                                                  }
                                                                },
                                                                child: Text(
                                                                    state.isLoading ||
                                                                            state
                                                                                .isFovLoading
                                                                        ? "Loading..."
                                                                        : state.error ==
                                                                                "404"
                                                                            ? "Reconnect"
                                                                            : (state.streamState == 'detect_circles'
                                                                                ? 'Frame Target'
                                                                                : 'Start Scoring'),
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .white,
                                                                        fontSize: 14
                                                                            .sp,
                                                                        fontFamily:
                                                                            AppFontFamily.bold)));
                                                          },
                                                        ),
                                                      ],
                                                    );

                                                    // return InkWell(
                                                    //   onTap: () async {
                                                    //     print(state.streamState);
                                                    //     if (state.streamState ==
                                                    //         'detect_circles') {
                                                    //       slRtspStreamingBloc.add(
                                                    //           const RtspStreamingEvent
                                                    //               .detectCircleProcessingEvent());
                                                    //     } else if (state.streamState ==
                                                    //         'open_stream') {
                                                    //       slRtspStreamingBloc.add(
                                                    //           const RtspStreamingEvent
                                                    //               .startFrameProcessing());
                                                    //       toast(
                                                    //           'Mode: ${statesession.sessionModel.stageEntity?.mode?.name}');
                                                    //       log(' isSessionStart =-=-=-= ${statesession.sessionModel.isSessionStart}');
                                                    //       log(' isSessionPaused =-=-=-= ${statesession.sessionModel.isSessionPaused}');
                                                    //       modeHandler(statesession.sessionModel
                                                    //           .copyWith(
                                                    //               makeScoreVisible: true));
                                                    //
                                                    //       context
                                                    //           .read<AppBleDeviceBloc>()
                                                    //           .add(const StartListening());
                                                    //     } else {
                                                    //       slRtspStreamingBloc.add(
                                                    //           const RtspStreamingEvent
                                                    //               .startStreaming());
                                                    //     }
                                                    //   },
                                                    //   child: Container(
                                                    //     alignment: Alignment.center,
                                                    //     decoration: BoxDecoration(
                                                    //         color: AppColors.kPrimaryColor,
                                                    //         shape: BoxShape.circle),
                                                    //     height: 72.h,
                                                    //     width: 72.h,
                                                    //     child: Text(
                                                    //       'Start',
                                                    //       style: TextStyle(
                                                    //           color: AppColors.white,
                                                    //           fontFamily: AppFontFamily.regular,
                                                    //           fontSize: 16.h),
                                                    //     ),
                                                    //   ),
                                                    // );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          widget.withCable
                                              ? SizedBox()
                                              : BlocBuilder<RtspStreamingBloc,
                                                  RtspStreamingState>(
                                                  builder: (context, state) {
                                                    return Visibility(
                                                      visible: statesession
                                                                  .sessionModel
                                                                  .isSessionStart !=
                                                              true &&
                                                          state.streamState ==
                                                              'detect_circles',
                                                      child: ShotStopsDemo(),
                                                    );
                                                  },
                                                ),
                                        ],
                                      ),
                                    ),
                                    //     Positioned(
                                    //         top: 100.h, right: 7.w, child: NoticeDialoge()),
                                    //     Positioned(
                                    //         top: 100.h, right: 7.w, child: CalibirateDialoge()),
                                    //   ],
                                    // ),
                                  )
                                ],
                              ),
                            ),
                            (statesession.sessionModel.makeScoreVisible == true)
                                ? statesession.sessionModel.isSessionStart ==
                                            true &&
                                        statesession.sessionModel.playBeep ==
                                            false
                                    ? Positioned(
                                        bottom: 3.h,
                                        // or 0 if you want flush to bottom
                                        right: 0,
                                        // start from left edge
                                        left: ScreenUtil().screenHeight + 15,
                                        // leave 0.5.sw empty on the right
                                        // stick to bottom
                                        child: Row(
                                          children: [
                                            '$stateBle_counter' !=
                                                        statesession
                                                            .sessionModel
                                                            .stageEntity
                                                            ?.drill
                                                            ?.drill
                                                            ?.noOfShots &&
                                                    appBleDeviceBloc.deviceConn
                                                            ?.remoteId !=
                                                        null
                                                ? (statesession.sessionModel
                                                            .isSessionAuto ==
                                                        null
                                                    ? TextButton(
                                                        // label: const Text(''),
                                                        onPressed: () {
                                                          SessionModel model =
                                                              statesession
                                                                  .sessionModel;
                                                          appBleDeviceBloc.add(
                                                              const StopListening(
                                                                  false));
                                                          if (model
                                                                  .isSessionPaused ==
                                                              true) {
                                                            // context
                                                            //     .read<AppBleDeviceBloc>()
                                                            //     .add(const StartListening());
                                                            resume();

                                                            // appBleDeviceBloc
                                                            //     .add(const StartListening());
                                                            context
                                                                .read<
                                                                    SessionBloc>()
                                                                .add(ShootEvent(
                                                                    sessionModel:
                                                                        model.copyWith(
                                                                            isSessionPaused:
                                                                                false)));
                                                          } else {
                                                            pause();
                                                            // appBleDeviceBloc
                                                            //     .add(const StopListening());
                                                            // showGenericDialog(context, testingInstructionsTitle,
                                                            //     testingInstructionsContent);
                                                            context
                                                                .read<
                                                                    SessionBloc>()
                                                                .add(ShootEvent(
                                                                    sessionModel:
                                                                        model.copyWith(
                                                                            isSessionPaused:
                                                                                true)));
                                                          }
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      16,
                                                                  vertical: 10),
                                                          minimumSize:
                                                              Size.zero,
                                                          backgroundColor:
                                                              AppColors
                                                                  .kRedColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6)),
                                                        ),
                                                        child: Wrap(children: [
                                                          Icon(
                                                              statesession.sessionModel
                                                                          .isSessionPaused ==
                                                                      false
                                                                  ? Icons
                                                                      .pause_rounded
                                                                  : Icons
                                                                      .play_arrow_rounded,
                                                              size: 19,
                                                              color: AppColors
                                                                  .white),
                                                          Text(
                                                            statesession.sessionModel
                                                                        .isSessionPaused ==
                                                                    false
                                                                ? 'Pause'
                                                                : 'Start',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .white,
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    AppFontFamily
                                                                        .bold),
                                                          ),
                                                        ]),
                                                      )
                                                    : statesession.sessionModel
                                                                .isSessionAuto ==
                                                            true
                                                        ? SizedBox()
                                                        : TextButton.icon(
                                                            icon: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          12.0,
                                                                      vertical:
                                                                          12),
                                                              child: Wrap(
                                                                  children: [
                                                                    Icon(
                                                                        statesession.sessionModel.isSessionPaused == false
                                                                            ? Icons
                                                                                .pause_rounded
                                                                            : Icons
                                                                                .play_arrow_rounded,
                                                                        size:
                                                                            19,
                                                                        color: AppColors
                                                                            .white),
                                                                    Text(
                                                                      statesession.sessionModel.isSessionPaused ==
                                                                              false
                                                                          ? 'Pause'
                                                                          : 'Start',
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .white,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFontFamily.bold),
                                                                    ),
                                                                  ]),
                                                            ),
                                                            label:
                                                                const Text(''),
                                                            onPressed: () {
                                                              SessionModel
                                                                  model =
                                                                  statesession
                                                                      .sessionModel;
                                                              appBleDeviceBloc.add(
                                                                  const StopListening(
                                                                      false));
                                                              if (model
                                                                      .isSessionPaused ==
                                                                  true) {
                                                                // context
                                                                //     .read<AppBleDeviceBloc>()
                                                                //     .add(const StartListening());

                                                                appBleDeviceBloc
                                                                    .add(
                                                                        const StartListening());
                                                                resume();
                                                                context
                                                                    .read<
                                                                        SessionBloc>()
                                                                    .add(ShootEvent(
                                                                        sessionModel:
                                                                            model.copyWith(isSessionPaused: false)));
                                                              } else {
                                                                pause();
                                                                // showGenericDialog(context, testingInstructionsTitle,
                                                                //     testingInstructionsContent);
                                                                appBleDeviceBloc.add(
                                                                    const StopListening(
                                                                        true));
                                                                context
                                                                    .read<
                                                                        SessionBloc>()
                                                                    .add(ShootEvent(
                                                                        sessionModel:
                                                                            model.copyWith(isSessionPaused: true)));
                                                              }
                                                            },
                                                            style: TextButton
                                                                .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1),
                                                              minimumSize:
                                                                  Size.zero,
                                                              fixedSize:
                                                                  Size(100, 36),
                                                              backgroundColor:
                                                                  AppColors
                                                                      .kRedColor,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                            ),
                                                          ))
                                                : SizedBox(),
                                            const Spacer(),
                                            // TextButton(
                                            //   style: TextButton.styleFrom(
                                            //     padding: EdgeInsets.zero,
                                            //     minimumSize: Size.zero,
                                            //     // fixedSize: Size(50.w, 36.h),
                                            //     backgroundColor: AppColors.kPrimaryColor,
                                            //     shape: RoundedRectangleBorder(
                                            //       borderRadius: BorderRadius.circular(6.h),
                                            //     ),
                                            //   ),
                                            //   child: Padding(
                                            //     padding: EdgeInsets.symmetric(
                                            //         horizontal: 12.0.w, vertical: 12.h),
                                            //     child: Text(
                                            //       'End Session',
                                            //       style: TextStyle(
                                            //           color: AppColors.white,
                                            //           fontSize: 14.h,
                                            //           fontFamily: AppFontFamily.bold),
                                            //     ),
                                            //   ),
                                            // ),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 10),
                                                  minimumSize: Size.zero,
                                                  // fixedSize: Size(48.w, 36.h),
                                                  backgroundColor:
                                                      AppColors.kPrimaryColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.h)),
                                                ),
                                                onPressed: () async {
                                                  // releaseD();
                                                  checkD = false;
                                                  pause();
                                                  stopBeepTimer();
                                                  stop();
                                                  slRtspStreamingBloc.add(
                                                      const RtspStreamingEvent
                                                          .disposeBloc(false));

                                                  if (appBleDeviceBloc
                                                          .deviceConn
                                                          ?.remoteId !=
                                                      null)
                                                    appBleDeviceBloc.add(
                                                        const StopListening(
                                                            true));
                                                  if (statesession.sessionModel
                                                          .playedShoots !=
                                                      0) {
                                                    if (listShoots.length > 0) {
                                                      if (listShoots[listShoots
                                                                      .length -
                                                                  1]
                                                              .shotDirection ==
                                                          '⏳') {
                                                        DateTime currentTime =
                                                            DateTime.now();
                                                        double timeDifference =
                                                            startTime != null
                                                                ? currentTime
                                                                        .difference(
                                                                            startTime!)
                                                                        .inMilliseconds /
                                                                    1000.0
                                                                : 0.000;
                                                        String? imgPath =
                                                            getImagePath(
                                                                statesession
                                                                    .sessionModel
                                                                    .sessionId);
                                                        shootModel = ShootModel(
                                                            parTime: 0,
                                                            shootImagePath:
                                                                imgPath ??
                                                                    "imgPath",
                                                            shootNumber:
                                                                stateBle_counter,
                                                            shootScore: 0,
                                                            splitTime:
                                                                timeDifference
                                                                    .toStringAsFixed(
                                                                        2),
                                                            shotDirection:
                                                                '🔴');

                                                        listShoots[
                                                            listShoots.length -
                                                                1] = shootModel;
                                                        frameBytesMissingShot =
                                                            null;

                                                        startTime = currentTime;
                                                        context
                                                            .read<SessionBloc>()
                                                            .add(ShootEvent(
                                                                sessionModel:
                                                                    statesession
                                                                        .sessionModel
                                                                        .copyWith(
                                                              playedShoots:
                                                                  stateBle_counter,
                                                              totalScores:
                                                                  totalScores,
                                                              isSessionStart:
                                                                  false,
                                                              listShots:
                                                                  listShoots,
                                                            )));
                                                      } else {
                                                        context
                                                            .read<SessionBloc>()
                                                            .add(ShootEvent(
                                                                sessionModel:
                                                                    statesession
                                                                        .sessionModel
                                                                        .copyWith(
                                                              playedShoots:
                                                                  stateBle_counter,
                                                              totalScores:
                                                                  totalScores,
                                                              isSessionStart:
                                                                  false,
                                                            )));
                                                      }
                                                    }

                                                    // List<ShootModel> filtered2 = sessionBlocstate
                                                    //             .sessionModel.listShots ==
                                                    //         null
                                                    //     ? []
                                                    //     : sessionBlocstate.sessionModel.listShots!
                                                    //         .where((s) => !(sessionBlocstate
                                                    //                     .sessionModel.listShots!
                                                    //                     .where((x) =>
                                                    //                         x.shootNumber ==
                                                    //                         s.shootNumber)
                                                    //                     .length >
                                                    //                 1 &&
                                                    //             (s.splitTime?.isEmpty ?? true)))
                                                    //         .toList();
                                                    // if (filtered2.isNotEmpty) {
                                                    //   totalScores = filtered2.fold<int>(
                                                    //     0,
                                                    //     (sum, s) => sum + s.shootScore!,
                                                    //   );
                                                    //
                                                    //   // final totalSplitTime = filtered.fold<double>(
                                                    //   //   0.0,
                                                    //   //       (sum, s) => sum + (double.tryParse(s.splitTime ?? '') ?? 0.0),
                                                    //   // );
                                                    // }
                                                    stateBle_counter = 0;
                                                    totalScores = 0;
                                                    listShoots = [];
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SessionCompletedView(
                                                                  model: statesession
                                                                      .sessionModel,
                                                                ))).then((v) {
                                                      if (context.mounted) {
                                                        SessionModel model =
                                                            statesession
                                                                .sessionModel;
                                                        model.isSessionStart =
                                                            false;
                                                        model.makeScoreVisible =
                                                            null;
                                                        model.shootModel = null;
                                                        model.listShots = null;
                                                        model.numberOfShots =
                                                            null;
                                                        model.playedShoots = 0;
                                                        model.totalScores = 0;
                                                        model.totalTime = null;
                                                        model.isSessionPaused =
                                                            false;
                                                        context
                                                            .read<SessionBloc>()
                                                            .add(ShootEvent(
                                                                sessionModel:
                                                                    model));
                                                      } else {
                                                        toast(null);
                                                      }
                                                    });
                                                  } else {
                                                    print('in else end');
                                                    statesession.sessionModel
                                                            .makeScoreVisible =
                                                        null;
                                                    context
                                                        .read<SessionBloc>()
                                                        .add(ShootEvent(
                                                            sessionModel: statesession
                                                                .sessionModel
                                                                .copyWith(
                                                                    isSessionStart:
                                                                        false,
                                                                    isSessionPaused:
                                                                        false)));
                                                  }
                                                },
                                                child: Text('End Session',
                                                    style: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 14.sp,
                                                        fontFamily:
                                                            AppFontFamily
                                                                .bold)))
                                          ],
                                        ),
                                      )
                                    : SizedBox()
                                : SizedBox()
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (statesession is CountDownState) {
            return Center(
              child: Text(
                '${statesession.sessionModel.sessionCountDown ?? 0}',
                style:
                    TextStyle(fontFamily: AppFontFamily.bold, fontSize: 26.sp),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void logFullSessionJson(StageEntity sessionModel) {
    // 1. Encode your model map to JSON (preserves int, double, String)
    final jsonString = jsonEncode(sessionModel.toJson());

    // 2. Emit the full JSON with a custom name / level if you like
    developer.log(
      jsonString,
      name: 'SessionModel',
      level: 0, // 0 = FINEST; use 1000 for INFO, etc.
    );
  }

  void debugPrintFullSessionJson(StageEntity sessionModel) {
    final jsonString = jsonEncode(sessionModel.toJson());
    // First try: bump wrapWidth so high it effectively never wraps
    debugPrint(jsonString, wrapWidth: 10000);

    // If you still see truncation, fall back to manual chunking:
    const chunkSize = 800; // safe below typical limits
    for (var i = 0; i < jsonString.length; i += chunkSize) {
      final end = (i + chunkSize < jsonString.length)
          ? i + chunkSize
          : jsonString.length;
      debugPrint(jsonString.substring(i, end));
    }
  }

  void modeHandler(SessionModel model) {
    startTimeCheck = DateTime.now();

    int modeId = model.stageEntity?.mode?.id ?? 1;
    log('mode id is $modeId');
    if (modeId == 1) {
      // sessionModel.stageEntity = stageEn;
      model.playBeep = true;
      model.isSessionStart = true;
      context.read<SessionBloc>().add(ShootEvent(sessionModel: model));
      startTime = DateTime.now();
      listeningTimerBloc.add(const ListningTimerEvent.stopTimer());

      appBleDeviceBloc.add(const StartListening());
      if (model.isCadOrOpen != null && model.isCadOrOpen == 1)
        startBeepTimer(model.cadenceValues ?? 2);
    } else if (modeId == 2) {
      int randomMode = getRandomValue();
      context.read<SessionBloc>().add(CountDownEvent(
          sessionModel: model.copyWith(sessionCountDown: randomMode)));
      startTimer(randomMode, model);
    } else if (modeId == 3) {
      int randomMode =
          miliSecondsToSecs(model.stageEntity?.mode?.seconds ?? 100);

      context.read<SessionBloc>().add(CountDownEvent(
          sessionModel: model.copyWith(sessionCountDown: randomMode)));
      startTimer(randomMode, model);
    } else if (modeId == 4) {
      context.read<SessionBloc>().add(ShootEvent(
          sessionModel: model.copyWith(playBeep: true, isSessionStart: true)));
      startTime = DateTime.now();
      listeningTimerBloc.add(const ListningTimerEvent.stopTimer());

      appBleDeviceBloc.add(const StartListening());
      if (model.isCadOrOpen != null && model.isCadOrOpen == 1)
        startBeepTimer(model.cadenceValues ?? 2);
    } else if (modeId == 5) {
      context.read<SessionBloc>().add(ShootEvent(
          sessionModel: model.copyWith(playBeep: true, isSessionStart: true)));
      startTime = DateTime.now();
      listeningTimerBloc.add(const ListningTimerEvent.stopTimer());

      appBleDeviceBloc.add(const StartListening());
      if (model.isCadOrOpen != null && model.isCadOrOpen == 1)
        startBeepTimer(model.cadenceValues ?? 2);
    } else if (modeId == 6) {
      context.read<SessionBloc>().add(ShootEvent(
          sessionModel: model.copyWith(playBeep: true, isSessionStart: true)));
      startTime = DateTime.now();
      listeningTimerBloc.add(const ListningTimerEvent.stopTimer());

      appBleDeviceBloc.add(const StartListening());
      if (model.isCadOrOpen != null && model.isCadOrOpen == 1)
        startBeepTimer(model.cadenceValues ?? 2);
    } else {}
  }

  void startTimer(int count, SessionModel model) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (count > 0) {
        count = count - 1;
        context.read<SessionBloc>().add(CountDownEvent(
            sessionModel: model.copyWith(sessionCountDown: count)));
      } else {
        _timer?.cancel();
        context.read<SessionBloc>().add(ShootEvent(
            sessionModel: model.copyWith(
                playBeep: true, isSessionStart: true, isSessionPaused: false)));
        startTime = DateTime.now();
        listeningTimerBloc.add(const ListningTimerEvent.stopTimer());

        appBleDeviceBloc.add(const StartListening());
        if (model.isCadOrOpen != null && model.isCadOrOpen == 1)
          startBeepTimer(model.cadenceValues ?? 2);
      }
    });
  }

  sessionScoreView() {
    bool isMessage = true;

    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, sessionBlocstate) {
        if (sessionBlocstate is ShootState) {
          // final filtered = sessionBlocstate.sessionModel.listShots ==null? []:sessionBlocstate.sessionModel.listShots!.where((s) =>
          // sessionBlocstate.sessionModel.listShots!.where((x) => x.shootNumber == s.shootNumber).length == 1
          //     || (s.splitTime?.isNotEmpty ?? false)
          // ).toList();

          List<ShootModel> filtered2 =
              sessionBlocstate.sessionModel.listShots == null
                  ? []
                  : sessionBlocstate.sessionModel.listShots!
                      .where((s) => !(sessionBlocstate.sessionModel.listShots!
                                  .where((x) => x.shootNumber == s.shootNumber)
                                  .length >
                              1 &&
                          (s.splitTime?.isEmpty ?? true)))
                      .toList();
          if (filtered2.isNotEmpty) {
            totalScores = filtered2.fold<int>(
              0,
              (sum, s) => sum + s.shootScore!,
            );
            // final totalSplitTime = filtered.fold<double>(
            //   0.0,
            //       (sum, s) => sum + (double.tryParse(s.splitTime ?? '') ?? 0.0),
            // );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            child: Column(
              children: [
                const SizedBox(
                  width: 50,
                ),
                if (sessionBlocstate.sessionModel.isSessionStart == true)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Table(
                        border: TableBorder.all(color: AppColors.white),
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(5.w, 6.h, 0.w, 6.h),
                                  child: Text(
                                    'Shot #',
                                    style: TextStyle(
                                        fontFamily: AppFontFamily.bold,
                                        color: AppColors.white,
                                        fontSize: 14.sp),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(6.0.h),
                                  child: Text('Score',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: AppFontFamily.bold,
                                          color: AppColors.white,
                                          fontSize: 14.sp))),
                              Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(5.w, 6.h, 0.w, 6.h),
                                  child: Text(
                                    'Split Time',
                                    style: TextStyle(
                                        fontFamily: AppFontFamily.bold,
                                        color: AppColors.white,
                                        fontSize: 12.sp),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(6.0.h),
                                  child: Text('Direction',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: AppFontFamily.bold,
                                          color: AppColors.white,
                                          fontSize: 12.sp))),
                            ],
                          ),
                          for (ShootModel shot in filtered2)
                            TableRow(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(5.w, 6.h, 6.w, 6.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${shot.shootNumber ?? ''}',
                                        style: TextStyle(
                                          fontFamily: AppFontFamily.bold,
                                          color: AppColors.white,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      if (sessionBlocstate.sessionModel
                                                  .lowestSplitTime ==
                                              miliSecondsToSecsSplitTime(
                                                  shot.splitTimeInt ?? 1) &&
                                          (sessionBlocstate.sessionModel
                                                      .listShots?.length ??
                                                  0) >
                                              2)
                                        Image.asset(
                                            'assets/icons/shoot_max.png',
                                            width: 15),
                                      if (sessionBlocstate.sessionModel
                                                  .highestSplitTime ==
                                              miliSecondsToSecsSplitTime(
                                                  shot.splitTimeInt ?? 1) &&
                                          (sessionBlocstate.sessionModel
                                                      .listShots?.length ??
                                                  0) >
                                              2)
                                        Image.asset(
                                            'assets/icons/shoot_min.png',
                                            width: 15),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(6.0.h),
                                  child: Text(
                                    shot.shotDirection == '⏳'
                                        ? "⏳"
                                        : '${shot.shootScore ?? ''}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppFontFamily.bold,
                                      color: AppColors.greenColor,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(6.0.h),
                                  child: Text(
                                    shot.shotDirection == '⏳'
                                        ? "⏳"
                                        : shot.shootNumber == 1
                                            ? '--'
                                            : shot.splitTime ?? '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppFontFamily.bold,
                                      color: AppColors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Text(
                                    shot.shotDirection ?? '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppFontFamily.bold,
                                      color: AppColors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                if (sessionBlocstate.sessionModel.isSessionStart == true)
                  TotalScoreBanner(score: totalScores),
                // Tex(
                //   'Total Score: $totalScores',
                //   style: TextStyle(
                //     fontFamily: AppFontFamily.bold,
                //     color: AppColors.white,
                //     fontSize: 14.sp,
                //   ),
                // ),
                if (sessionBlocstate.sessionModel.isSessionStart == true)
                  StopwatchApp(
                    sessionModel: sessionBlocstate.sessionModel,
                    startNow:
                        sessionBlocstate.sessionModel.isSessionPaused == false,
                    countDownTime: sessionBlocstate
                                .sessionModel.stageEntity?.mode?.id ==
                            4
                        ? '00:${miliSecondsToSecs(sessionBlocstate.sessionModel.stageEntity?.mode?.seconds ?? 100)}'
                        : null,
                    isCountdown:
                        sessionBlocstate.sessionModel.stageEntity?.mode?.id ==
                            4,
                    beepStopedCallback: (p0) {
                      context.read<SessionBloc>().add(ShootEvent(
                          sessionModel: sessionBlocstate.sessionModel
                              .copyWith(playBeep: false)));
                      // context
                      //     .read<AppBleDeviceBloc>()
                      //     .add(const StartListening());
                    },
                    callBackCallback: (p0) {
                      print('callBackCallback=====$p0');
                      SessionModel model = sessionBlocstate.sessionModel;
                      if (model.listShots != null &&
                          model.listShots!.length > 0) {
                        // model.listShots?.last.splitTime = p0;
                      }
                      // if ('${model.shootModel?.shootNumber}' ==
                      //     model.stageEntity?.drill?.drill?.noOfShots) {
                      //   context.read<SessionBloc>().add(ShootEvent(
                      //       sessionModel: model.copyWith(isSessionStart: false)));
                      // }
                    },
                    callBackContinuous: (p0) {
                      //This is for ending session automatically if timer ends with no shots
                      // if (p0 == '0' &&
                      //     state.sessionModel.stageEntity?.mode?.id == 4 &&
                      //     state.sessionModel.playedShoots != 0 &&
                      //     state.sessionModel.isSessionStart == true) {
                      //   // Must do globals empty in order to properly end session
                      //   stateBle_counter = 0;
                      //   totalScores = 0;
                      //   listShoots = [];
                      //   // SessionModel model = state.sessionModel;
                      //   // model.isSessionStart = false;
                      //   context.read<SessionBloc>().add(ShootEvent(
                      //       sessionModel: state.sessionModel
                      //           .copyWith(isSessionStart: false)));
                      //   WidgetsBinding.instance.addPostFrameCallback((f) {
                      //     slRtspStreamingBloc
                      //         .add(const RtspStreamingEvent.disposeBloc());
                      //
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (_) =>
                      //                 const SessionCompletedView())).then((v) {
                      //       if (context.mounted) {
                      //         SessionModel model = state.sessionModel;
                      //         model.isSessionStart = false;
                      //         model.makeScoreVisible = null;
                      //         model.shootModel = null;
                      //         model.listShots = null;
                      //         model.numberOfShots = null;
                      //         model.playedShoots = 0;
                      //         model.totalScores = 0;
                      //         model.totalTime = null;
                      //         context
                      //             .read<SessionBloc>()
                      //             .add(ShootEvent(sessionModel: model));
                      //       } else {
                      //         toast(null);
                      //       }
                      //     });
                      //   });
                      // } else if (p0 == '0' &&
                      //     state.sessionModel.stageEntity?.mode?.id == 4 &&
                      //     state.sessionModel.isSessionStart == true) {
                      //   state.sessionModel.makeScoreVisible = null;
                      //   context.read<SessionBloc>().add(ShootEvent(
                      //       sessionModel: state.sessionModel
                      //           .copyWith(isSessionStart: false)));
                      // }
                    },
                    child: sessionBlocstate.sessionModel.isSessionStart == true
                        ? MultiBlocListener(
                            listeners: [
                              BlocListener<AppBleDeviceBloc, AppBleDeviceState>(
                                listenWhen: (_, __) =>
                                    (ModalRoute.of(context)?.isCurrent ??
                                        false),
                                listener: (context, stateBle) async {
                                  if (stateBle is DeviceIsDisconnected) {
                                    if (listShoots.length > 0) {
                                      pause();

                                      showGenericDialog(
                                        context,
                                        title: titleDisconnected,
                                        content: dDisconnected,
                                        icon: const Text('⚠️',
                                            style: TextStyle(fontSize: 28)),
                                      );
                                    } else {
                                      log('Device Disconnected----');

                                      /// Reset Global Variables
                                      stateBle_counter = 0;
                                      totalScores = 0;
                                      listShoots = [];

                                      /// Reset Session Model
                                      SessionModel model = sessionBlocstate
                                          .sessionModel
                                          .copyWith(
                                        isSessionStart: false,
                                        makeScoreVisible: null,
                                        shootModel: null,
                                        listShots: null,
                                        numberOfShots: null,
                                        playedShoots: 0,
                                        totalScores: 0,
                                        totalTime: null,
                                        isSessionPaused: false,
                                      );

                                      /// Dispatch Reset Event
                                      context
                                          .read<SessionBloc>()
                                          .add(ShootEvent(sessionModel: model));

                                      /// Show Toast & Navigate if Possible
                                      if (Navigator.canPop(context)) {
                                        Toast.show(context,
                                            message:
                                                'BLE device is disconnected');
                                        Navigator.pop(context);
                                      } else {
                                        log('Device Disconnected Else Case');
                                      }
                                    }
                                  } else if (stateBle is CounterUpdated) {
                                    startTime ??= DateTime.now();

                                    isMessage = false;
                                    if ('$stateBle_counter' !=
                                        sessionBlocstate
                                            .sessionModel
                                            .stageEntity
                                            ?.drill
                                            ?.drill
                                            ?.noOfShots) {
                                      // stateBle_counter = stateBle.counter;
                                      stateBle_counter++;
                                      if (listShoots.length > 0) {
                                        if (listShoots[listShoots.length - 1]
                                                .shotDirection ==
                                            '⏳') {
                                          DateTime currentTime = DateTime.now();
                                          double timeDifference = startTime !=
                                                  null
                                              ? currentTime
                                                      .difference(startTime!)
                                                      .inMilliseconds /
                                                  1000.0
                                              : 0.000;
                                          String? imgPath = getImagePath(
                                              sessionBlocstate
                                                  .sessionModel.sessionId);
                                          shootModel = ShootModel(
                                              parTime: 0,
                                              shootImagePath:
                                                  imgPath ?? "imgPath",
                                              shootNumber: stateBle_counter - 1,
                                              shootScore: 0,
                                              splitTime: timeDifference
                                                  .toStringAsFixed(2),
                                              shotDirection: '🔴');
                                          listShoots[listShoots.length - 1] =
                                              shootModel;
                                          frameBytesMissingShot = null;
                                          startTime = currentTime;
                                        }
                                      }

                                      shootModel = ShootModel(
                                          parTime: 0,
                                          shootImagePath: "imgPath",
                                          shootNumber: stateBle_counter,
                                          shootScore: 0,
                                          splitTime: '0.00',
                                          shotDirection: '⏳');
                                      listShoots.add(shootModel);
                                      listeningTimerBloc.add(
                                          const ListningTimerEvent
                                              .onShotDetectedEvent(true));
                                    }

                                    // if (stateBle_counter == listShoots.length) {
                                    //
                                    //
                                    // }else{
                                    //   String imgPath = getImagePath(
                                    //       sessionBlocstate
                                    //           .sessionModel.sessionId);
                                    //   shootModel = ShootModel(
                                    //       parTime: 0,
                                    //       shootImagePath: imgPath,
                                    //       shootNumber: stateBle_counter,
                                    //       shootScore: 0,
                                    //       shotDirection: '');
                                    //   listShoots.add(shootModel);
                                    //
                                    //   listeningTimerBloc.add(
                                    //       const ListningTimerEvent
                                    //           .onShotDetectedEvent());
                                    //   stateBle_counter = stateBle.counter;
                                    //
                                    // }
                                    // if(listShoots.length < stateBle_counter){
                                    //   print('===== Counter Updated_IF_: ${stateBle_counter}');
                                    //   print('===== Counter Updated_IF: ${listShoots.length}');
                                    //
                                    //   String imgPath = getImagePath(
                                    //       sessionBlocstate
                                    //           .sessionModel.sessionId);
                                    //   shootModel = ShootModel(
                                    //       parTime: 0,
                                    //       shootImagePath: imgPath,
                                    //       shootNumber: stateBle_counter,
                                    //       shootScore: 0,
                                    //       shotDirection: '');
                                    //   listShoots.add(shootModel);
                                    //
                                    //   listeningTimerBloc.add(
                                    //       const ListningTimerEvent
                                    //           .onShotDetectedEvent());
                                    //   stateBle_counter = stateBle.counter;
                                    //
                                    // }else{
                                    //   print('===== Counter Updated_ELSE: ${stateBle.counter}');
                                    //
                                    //   stateBle_counter = stateBle.counter;
                                    // }
                                  }
                                },
                              ),
                              BlocListener<ListningTimerBloc,
                                  ListningTimerState>(
                                listener: (context, stateTimer) async {
                                  // print(
                                  //     "chech_listeningTimerBloc=====${listeningTimerBloc.state}");
                                  if (stateTimer is OnShotDetected) {
                                    if (!stateTimer.isOk) {
                                      if (sessionBlocstate
                                                  .sessionModel.isCadOrOpen ==
                                              null ||
                                          sessionBlocstate
                                                  .sessionModel.isCadOrOpen ==
                                              0) {
                                        playBeep();
                                      }

                                      listeningTimerBloc.add(
                                          const ListningTimerEvent.stopTimer());
                                      DateTime currentTime = DateTime.now();

                                      double timeDifference = startTime != null
                                          ? currentTime
                                                  .difference(startTime!)
                                                  .inMilliseconds /
                                              1000.0
                                          : 0.000;
                                      listShoots[listShoots.length - 1]
                                              .splitTime =
                                          timeDifference.toStringAsFixed(2);
                                      print(
                                          "=====Checking timeDifference: $timeDifference");
                                      startTime = currentTime;
                                      if ('$stateBle_counter' ==
                                          sessionBlocstate
                                              .sessionModel
                                              .stageEntity
                                              ?.drill
                                              ?.drill
                                              ?.noOfShots) {
                                        print("OnShotDetected===== 4");
                                        stopBeepTimer();

                                        Future.delayed(
                                            const Duration(milliseconds: 700),
                                            () {
                                          pause();
                                        });
                                        context.read<SessionBloc>().add(
                                            ShootEvent(
                                                sessionModel: sessionBlocstate
                                                    .sessionModel
                                                    .copyWith(
                                                        isSessionPaused:
                                                            true)));
                                      }
                                    }
                                    // print("=====Checking timeDifference: ${listShoots.length}");
                                    currentShootNew = stateBle_counter;
                                    if (sessionBlocstate
                                                .sessionModel.isSessionStart ==
                                            true &&
                                        sessionBlocstate
                                                .sessionModel.playBeep ==
                                            false) {
                                      /// Show Loading Indicator
                                      BotToast.showLoading();
                                      BotToast.closeAllLoading();

                                      context
                                          .read<SessionBloc>()
                                          .add(ShootEvent(
                                            sessionModel: sessionBlocstate
                                                .sessionModel
                                                .copyWith(
                                              stageEntity: sessionBlocstate
                                                  .sessionModel.stageEntity,
                                              listShots: listShoots,
                                              shootModel: shootModel,
                                              isSessionStart: true,
                                              playBeep: false,
                                              playedShoots:
                                                  stateBle_counter + 1,
                                              numberOfShots: int.parse(
                                                  sessionBlocstate
                                                          .sessionModel
                                                          .stageEntity
                                                          ?.drill
                                                          ?.drill
                                                          ?.noOfShots ??
                                                      '0'),
                                              sessionId: sessionBlocstate
                                                  .sessionModel.sessionId,
                                              totalScores: totalScores,
                                            ),
                                          ));

                                      print("OnShotDetected===== 5");
                                      isMessage = true;
                                      if (context.mounted) {
                                        /// Check if Session is Completed
                                        if ('$stateBle_counter' ==
                                            sessionBlocstate
                                                .sessionModel
                                                .stageEntity
                                                ?.drill
                                                ?.drill
                                                ?.noOfShots) {
                                          // slRtspStreamingBloc.add(
                                          //     const RtspStreamingEvent
                                          //         .disposeBloc(false));
                                          // pause();
                                          // context.read<SessionBloc>().add(
                                          //     ShootEvent(
                                          //         sessionModel:
                                          //             sessionBlocstate
                                          //                 .sessionModel
                                          //                 .copyWith(
                                          //                     isSessionPaused:
                                          //                         true)));
                                          stopBeepTimer();
                                          appBleDeviceBloc
                                              .add(const StopListening(true));
                                          Future.delayed(
                                              const Duration(seconds: 4), () {
                                            // slRtspStreamingBloc.add(
                                            //     const RtspStreamingEvent
                                            //         .disposeBloc(false));
                                            // Add safety check before accessing listShoots
                                            if (listShoots.isNotEmpty &&
                                                listShoots[listShoots.length -
                                                            1]
                                                        .shotDirection ==
                                                    '⏳') {
                                              DateTime currentTime =
                                                  DateTime.now();
                                              double timeDifference =
                                                  startTime != null
                                                      ? currentTime
                                                              .difference(
                                                                  startTime!)
                                                              .inMilliseconds /
                                                          1000.0
                                                      : 0.000;
                                              String? imgPath = getImagePath(
                                                  sessionBlocstate
                                                      .sessionModel.sessionId);
                                              shootModel = ShootModel(
                                                  parTime: 0,
                                                  shootImagePath:
                                                      imgPath ?? "imgPath",
                                                  shootNumber: stateBle_counter,
                                                  shootScore: 0,
                                                  splitTime: timeDifference
                                                      .toStringAsFixed(2),
                                                  shotDirection: '🔴');

                                              listShoots[listShoots.length -
                                                  1] = shootModel;
                                              startTime = currentTime;
                                              frameBytesMissingShot = null;

                                              context.read<SessionBloc>().add(
                                                      ShootEvent(
                                                          sessionModel:
                                                              sessionBlocstate
                                                                  .sessionModel
                                                                  .copyWith(
                                                    playedShoots:
                                                        stateBle_counter,
                                                    // isSessionStart: false,
                                                    totalScores: totalScores,

                                                    listShots: listShoots,
                                                  )));
                                            } else {
                                              // Handle case when listShoots is empty or condition not met
                                              context.read<SessionBloc>().add(
                                                      ShootEvent(
                                                          sessionModel:
                                                              sessionBlocstate
                                                                  .sessionModel
                                                                  .copyWith(
                                                    playedShoots:
                                                        stateBle_counter,
                                                    totalScores: totalScores,
                                                  )));
                                            }

                                            // stateBle_counter = 0;
                                            // totalScores = 0;
                                            // listShoots = [];
                                            // Future.delayed(
                                            // const Duration(seconds: 1), () {
                                            pause();
                                            if (!checkD) {
                                              checkD = true;
                                              showGenericDialog(
                                                context,
                                                title: titleSessionCompleted,
                                                content: dSessionCompleted,
                                                icon: const Text('🎯',
                                                    style: TextStyle(
                                                        fontSize: 28)),
                                              );
                                            }

                                            // });

                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             SessionCompletedView(
                                            //               model:
                                            //                   sessionBlocstate
                                            //                       .sessionModel,
                                            //             ))).then((v)
                                            // {
                                            //   if (context.mounted) {
                                            //     SessionModel model =
                                            //         sessionBlocstate
                                            //             .sessionModel;
                                            //     model.isSessionStart = false;
                                            //     model.makeScoreVisible = null;
                                            //     model.shootModel = null;
                                            //     model.listShots = null;
                                            //     model.numberOfShots = null;
                                            //     model.playedShoots = 0;
                                            //     model.totalScores = 0;
                                            //     model.totalTime = null;
                                            //     model.isSessionPaused = false;
                                            //     context.read<SessionBloc>().add(
                                            //         ShootEvent(
                                            //             sessionModel: model));
                                            //   } else {
                                            //     toast(null);
                                            //   }
                                            // });
                                          }); // totalScores = 0;
                                          // listShoots = [];
                                          // print("OnShotDetected===== 3");
                                          //
                                          // context.read<SessionBloc>().add(
                                          //     ShootEvent(
                                          //         sessionModel:
                                          //             sessionBlocstate
                                          //                 .sessionModel
                                          //                 .copyWith(
                                          //                     isSessionStart:
                                          //                         false)));
                                          // startTime = null;

                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             SessionCompletedView(
                                          //                 model: sessionBlocstate
                                          //                     .sessionModel)));
                                          //     .then((v) {
                                          //   if (context.mounted) {
                                          //     print("OnShotDetected===== 1");
                                          //
                                          //     SessionModel model = sessionBlocstate.sessionModel;
                                          //     model.isSessionStart = false;
                                          //     model.makeScoreVisible = null;
                                          //     model.shootModel = null;
                                          //     model.listShots = null;
                                          //     model.numberOfShots = null;
                                          //     model.playedShoots = 0;
                                          //     model.totalScores = 0;
                                          //     model.totalTime = null;
                                          //     model.isSessionPaused = false;
                                          //     context
                                          //         .read<SessionBloc>()
                                          //         .add(ShootEvent(sessionModel: model));
                                          //   } else {
                                          //     toast(null);
                                          //   }
                                          // });
                                        } else {
                                          // showGenericDialog(
                                          //     context,
                                          //     continuingTitle,
                                          //     continuingContent);
                                        }

                                        // listeningTimerBloc.add(
                                        //     const ListningTimerEvent
                                        //         .stopTimer());
                                      } else {
                                        toast(
                                            "Try again, couldn't capture screenshot");
                                      }
                                    }
                                  }

                                  if (stateTimer is TimerRunning) {
                                    print(
                                        "chech_listeningTimerBloc_1=====${stateTimer.secondsLeft}");

                                    // if (stateTimer.secondsLeft == 0) {
                                    //   // DateTime currentTime = DateTime.now();
                                    //   // double timeDifference = startTime !=
                                    //   //     null
                                    //   //     ? currentTime
                                    //   //     .difference(startTime!)
                                    //   //     .inMilliseconds /
                                    //   //     1000.0
                                    //   //     : 0.000;
                                    //   String? imgPath = getImagePath(
                                    //       sessionBlocstate
                                    //           .sessionModel.sessionId);
                                    //    shootModel = ShootModel(
                                    //     parTime: 0,
                                    //      shootImagePath: imgPath??"imgPath",
                                    //     shootNumber: stateBle_counter,
                                    //     shootScore: 0,
                                    //     shotDirection: '🔴',
                                    //   );
                                    //
                                    //   listShoots[listShoots.length - 1] =
                                    //       shootModel;
                                    //
                                    //   frameBytesMissingShot = null;
                                    //
                                    //   // startTime = currentTime;
                                    //   listeningTimerBloc
                                    //       .add(const ListningTimerEvent.onShotDetectedEvent(false));
                                    // }
                                  }
                                },
                              ),
                            ],
                            child: BlocBuilder<ListningTimerBloc,
                                ListningTimerState>(
                              builder: (context, state) {
                                return SizedBox();
                                // return state.when(
                                //   initial: () => Text(
                                //     "",
                                //     // "Ready for Shot\n ${sessionBlocstate.sessionModel.isSessionPaused == true && isMessage?'Make a hole on paper and  press BLE device button':''}",
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .titleSmall!
                                //         .copyWith(color: AppColors.white),
                                //   ),
                                //   onShotDetected: (b) => Text(
                                //     "",
                                //     // "Ready for Shot\n ${sessionBlocstate.sessionModel.isSessionPaused == true && isMessage?'Make a hole on paper and  press BLE device button':''}",
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .titleSmall!
                                //         .copyWith(color: AppColors.white),
                                //   ),
                                //   running: (secondsLeft) => Text(
                                //     "",
                                //     // "Ready for Shot\n ${sessionBlocstate.sessionModel.isSessionPaused == true && isMessage?'Make a hole on paper and  press BLE device button':''}",
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .titleSmall!
                                //         .copyWith(color: AppColors.white),
                                //   ),
                                //   //     Text(
                                //   //   secondsLeft > 6 &&
                                //   //           sessionBlocstate.sessionModel
                                //   //                   .isSessionPaused ==
                                //   //               true
                                //   //       ? "Start your session after ${secondsLeft - 5} seconds"
                                //   //       : sessionBlocstate.sessionModel
                                //   //                   .isSessionPaused ==
                                //   //               true
                                //   //           ? "Now start your session(if your fired bullet hole will not detect in $secondsLeft seconds ,  After $secondsLeft seconds, shot considered as a missing shot)"
                                //   //           : "if your fired bullet hole will not detect in $secondsLeft seconds ,  After $secondsLeft seconds, shot considered as a missing shot",
                                //   //   style: Theme.of(context)
                                //   //       .textTheme
                                //   //       .titleSmall!
                                //   //       .copyWith(color: AppColors.white),
                                //   // ),
                                // );
                              },
                            ),
                          )
                        : const SizedBox(),
                  ),

                // sessionBlocstate.sessionModel.isSessionPaused == true &&
                //         isMessage
                //     ? Text(
                //         "Make a hole on paper and  press BLE device button",
                //         style: Theme.of(context)
                //             .textTheme
                //             .titleSmall!
                //             .copyWith(color: AppColors.white),
                //       )
                //     : SizedBox(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class ClickPositionTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  final Duration showDuration;
  final Offset offset;

  const ClickPositionTooltip({
    super.key,
    required this.child,
    required this.message,
    this.showDuration = const Duration(seconds: 3),
    this.offset = const Offset(0, -40),
  });

  @override
  _ClickPositionTooltipState createState() => _ClickPositionTooltipState();
}

class _ClickPositionTooltipState extends State<ClickPositionTooltip> {
  OverlayEntry? _overlayEntry;
  Timer? _timer;

  void _showOverlay(Offset globalPosition) {
    // remove any existing tooltip
    _hideOverlay();

    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        // position it relative to tap location + your offset
        left: globalPosition.dx + widget.offset.dx,
        top: globalPosition.dy + widget.offset.dy,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              widget.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    });

    // insert into the Overlay
    Overlay.of(context)!.insert(_overlayEntry!);

    // auto‐dismiss after the duration
    _timer = Timer(widget.showDuration, _hideOverlay);
  }

  void _hideOverlay() {
    _timer?.cancel();
    _timer = null;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTapDown: (details) {
        // details.globalPosition is the tap coordinate in the screen
        _showOverlay(details.globalPosition);
      },
      child: widget.child,
    );
  }
}

class TotalScoreBanner extends StatelessWidget {
  const TotalScoreBanner({
    super.key,
    required this.score,
    this.height = 120,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
  });

  final int score;
  final double height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    Color navy = AppTheme.primary(context).withOpacity(0.2); // panel
    Color topLine = AppTheme.primary(context); // thin top border
    Color label = AppTheme.textPrimary(context); // small "TOTAL SCORE"
    Color number = AppTheme.textPrimary(context); // big number

    return Container(
      width: double.infinity,
      padding: padding,
      margin: padding,
      decoration: BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.circular(4),
        // square like the screenshot edges
        border: Border(
          top: BorderSide(color: topLine, width: 2),
        ),
      ),
      child: Stack(
        children: [
          // soft radial glow behind the number
          Positioned(
            left: 8,
            top: 30,
            child: Container(
              width: 180,
              height: 90,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: Alignment.centerLeft,
                  radius: 0.85,
                  colors: [
                    Color(0x334B78FF), // light, transparent center
                    Color(0x001E3553), // fade to panel color
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          // content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TOTAL SCORE',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: label,
                ),
              ),
              SizedBox(height: 4.h),
              // Big number with a subtle glow via text shadows
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w800,
                  color: number,
                  height: 1.0,
                  shadows: [
                    Shadow(
                        blurRadius: 20,
                        color: Color(0x5589AFFF),
                        offset: Offset(0, 2)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
