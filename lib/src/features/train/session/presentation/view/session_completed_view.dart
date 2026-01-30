import 'dart:convert';
import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'dart:developer' as developer;
import 'package:intl/intl.dart';

import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/theme/text_styles/app_text_style.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/border_button.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import 'package:pa_sreens/src/features/train/session/data/local/service/session_db_helper.dart';
import 'package:pa_sreens/src/features/train/session/data/model/save_session_model.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/sess_album.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/sess_summary.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/shot_count_screen.dart';
import 'package:pa_sreens/src/features/train/session/presentation/view/session_start_view.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:wifi_iot/wifi_iot.dart';

import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/toast.dart';
import '../../../../home/home_tab.dart';
import '../../../../test_stream/usb_manager.dart';
import '../../../../training_new/presentation/widgets/components/loadout_list.dart';
import '../../../connectivity/presentation/view/bluetooth_view.dart';
import '../../../connectivity/presentation/view/wifi_list_view.dart';
import '../../../train_view.dart';
import '../../data/model/session_model.dart';
import '../bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import '../bloc/shoQ_data/sho_qdata_bloc.dart';
import '../component/fram_streaming_widget.dart';
import '../component/shot_q_review.dart';

const double fsHeading = 16.0;
const double fsSubheading = 14.0;
const double fsBody = 12.0;

class SessionCompletedView extends StatelessWidget {
  final SessionModel model;

  const SessionCompletedView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    stateBle_counter = 0;
    totalScores = 0;
    listShoots = [];
    final now = DateTime.now();
    final formatter = DateFormat('MMMM d, y – h:mm a');
    String formatted = formatter.format(now);
    final currentDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    return DefaultTabController(
      length: 4,
      child: BlocListener<AppBleDeviceBloc, AppBleDeviceState>(
        listener: (context, state) {
          // if (state is DeviceIsDisconnected) {
          //   // if (Navigator.canPop(context)) {
          //   //   Navigator.pop(context);
          //   // } else {
          //   //   log(' = = = = = = = = = = = = DeviceIsDisconnected SessionCompletedView');
          //   // }
          // }
        },
        child: Scaffold(
          backgroundColor: AppColors.blackTextColor.withOpacity(0.7),
          body: Column(
            children: [
              BlocBuilder<SessionBloc, SessionState>(
                builder: (context, state) {
                  if (state is ShootState) {
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                      decoration: r8Decoration,
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 55,
                            color: AppColors.greyColor,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${state.sessionModel.sessionId} 📝',
                                style: TextStyle(
                                  fontSize: fsHeading.sp,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                formatted,
                                style: TextStyle(
                                    fontSize: fsSubheading.sp,
                                    color: AppColors.greyColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
                      decoration: r8Decoration,
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 55,
                            color: AppColors.greyColor,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PA_2025-05-05_1210 📝',
                                style: TextStyle(
                                    fontSize: fsHeading.sp,
                                    color: AppColors.white),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                formatted,
                                style: TextStyle(
                                    fontSize: fsSubheading.sp,
                                    color: AppColors.greyColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              ModifiedContainer(
                // margin: EdgeInsets.fromLTRB(0, 25.h, 0, 0),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                // padding:  EdgeInsets.symmetric(horizontal: 5.w , vertical: 2.h),
                height: 35.h,
                // width: 250.w,
                borderRadius: 6.r,
                color: AppColors.white.withOpacity(0.07),
                child: TabBar(
                  tabAlignment: TabAlignment.fill,
                  dividerColor: Colors.transparent,
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  indicator: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(2.h),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Text(
                      'Shot Count',
                      style: TextStyle(
                          color: AppTheme.textPrimary(context),
                          fontFamily: AppFontFamily.bold,
                          fontSize: 16.sp),
                    ),
                    Text(
                      'Session Summary',
                      style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppFontFamily.bold,
                          fontSize: 16.sp),
                    ),
                    Text(
                      'Session Album',
                      style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppFontFamily.bold,
                          fontSize: 16.sp),
                    ),
                    Text(
                      'ShoQ® Review',
                      style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppFontFamily.bold,
                          fontSize: 16.sp),
                    )
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    PerShotAnalysisTab(),
                    // ShotCountScreen(),
                    PerformanceSessionPage(),
                    SessionAlbumScreen(),
                    ShotQReview()
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: () async {
                    // BotToast.showLoading();
                    locator<LocalStorageService>()
                        .saveSessionId(model.sessionId ?? 0);
                    List<SaveShootModel> saveShootList =
                        (model.listShots ?? []).map((shoot) {
                      return SaveShootModel(
                          shootImagePath: shoot.shootImagePath,
                          shootNumber: shoot.shootNumber,
                          shootScore: shoot.shootScore,
                          splitTime: shoot.splitTimeInt,
                          shotDirection: shoot.shotDirection);
                    }).toList();
                    SaveSessionModel sessionModel = SaveSessionModel(
                        userId: locator<LocalStorageService>().userIdString,
                        missingShots: model.missingShots,
                        dateTime: currentDateTime,
                        playedShots: model.playedShoots,
                        sessionId: model.sessionId,
                        shotsList: saveShootList,
                        loadoutId: loadoutArm?.id,
                        firearmId: armoryFirearmA?.id,
                        ammunitionId: armoryAmmunitionA?.id,
                        saveStageEntity: SessionSaveStageEntity(
                          distance: model.stageEntity?.distance,
                          drill: model.stageEntity?.drill,
                          dominantHand: model.stageEntity?.dominantHand,
                          firearm: model.stageEntity?.firearm,
                          mode: model.stageEntity?.mode,
                          mountLocation: model.stageEntity?.mountLocation,
                          sensitivity: model.stageEntity?.sensitivity,
                          venue: model.stageEntity?.venue,
                        ));
                    // logFullSessionJson(sessionModel);

                    await SessionDbHelper().saveSession(
                      sessionModel,
                      locator<LocalStorageService>().userId!,
                    );
                    // BotToast.closeAllLoading();
                    // sessionSaveToast();
                    // Future.delayed(const Duration(milliseconds: 600), () {
                    //   if (context.mounted) {
                    //     // sessEndDialog(context, false);
                    //   }
                    // });

                    final isConnected =
                        ((cameraWiBloc.lastConnectedSsid != null &&
                                    cameraWiBloc.lastConnectedSsid != '') ||
                                (cameraWiBloc.withWire != null &&
                                    cameraWiBloc.withWire == true)) &&
                            appBleDeviceBloc.deviceConn?.remoteId != null;
                    if (isConnected) {
                      await WiFiForIoTPlugin.forceWifiUsage(
                          true); // Unpin from RTSP AP

                      shoQdataBloc.add(const ShoQdataEvent.clearData());

                      if (context.mounted) {
                        print("OnShotDetected===== 1");

                        SessionModel modelNew = model;
                        modelNew.isSessionStart = false;
                        modelNew.makeScoreVisible = null;
                        modelNew.shootModel = null;
                        modelNew.listShots = null;
                        modelNew.numberOfShots = null;
                        modelNew.playedShoots = 0;
                        modelNew.totalScores = 0;
                        modelNew.totalTime = null;
                        modelNew.isSessionPaused = false;
                        modelNew.sessionId = sessionIdFun();

                        context
                            .read<SessionBloc>()
                            .add(ShootEvent(sessionModel: modelNew));
                      } else {
                        toast(null);
                      }
                      Navigator.pop(context);
                    } else {
                      if (context.mounted) {
                        print("OnShotDetected===== 1");

                        SessionModel modelNew = model;
                        modelNew.isSessionStart = false;
                        modelNew.makeScoreVisible = null;
                        modelNew.shootModel = null;
                        modelNew.listShots = null;
                        modelNew.numberOfShots = null;
                        modelNew.playedShoots = 0;
                        modelNew.totalScores = 0;
                        modelNew.totalTime = null;
                        modelNew.isSessionPaused = false;
                        modelNew.sessionId = sessionIdFun();

                        context
                            .read<SessionBloc>()
                            .add(ShootEvent(sessionModel: modelNew));
                      } else {
                        toast(null);
                      }

                      if (cameraWiBloc.withWire != null &&
                          cameraWiBloc.withWire == true) {
                        UsbCameraManager.dispose();
                        Navigator.pop(context);
                      } else {
                        slRtspStreamingBloc.add(
                            RtspStreamingEvent.setFovOptionsEvent('72', true));

                        slRtspStreamingBloc
                            .add(const RtspStreamingEvent.disposeBloc(true));
                      }

                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                  // onPressed: () {
                  //   // _showCustomItemDialog(context);
                  //   sessEndDialog(context, true);
                  // },
                  style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 33),
                      minimumSize: Size.zero,
                      // fixedSize: Size(48.w, 36.h),
                      backgroundColor: AppColors.lightGry,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.white),
                        borderRadius: BorderRadius.circular(6),
                      )),
                  child: Text('Start new session',
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                          fontFamily: AppFontFamily.bold))),
              Gap(12),
              BlocBuilder<SessionBloc, SessionState>(
                builder: (context, state) {
                  if (state is ShootState) {
                    return TextButton(
                        onPressed: () async {
                          if (Navigator.canPop(context)) {
                            Toast.show(context, message: 'Session closing...');
                          }
                          // BotToast.showLoading();
                          locator<LocalStorageService>()
                              .saveSessionId(state.sessionModel.sessionId ?? 0);
                          List<SaveShootModel> saveShootList =
                              (state.sessionModel.listShots ?? []).map((shoot) {
                            return SaveShootModel(
                                shootImagePath: shoot.shootImagePath,
                                shootNumber: shoot.shootNumber,
                                shootScore: shoot.shootScore,
                                splitTime: shoot.splitTimeInt,
                                shotDirection: shoot.shotDirection);
                          }).toList();
                          SaveSessionModel sessionModel = SaveSessionModel(
                              userId:
                                  locator<LocalStorageService>().userIdString,
                              missingShots: state.sessionModel.missingShots,
                              dateTime: currentDateTime,
                              playedShots: state.sessionModel.playedShoots,
                              sessionId: state.sessionModel.sessionId,
                              shotsList: saveShootList,
                              loadoutId: loadoutArm?.id,
                              firearmId: armoryFirearmA?.id,
                              ammunitionId: armoryAmmunitionA?.id,
                              saveStageEntity: SessionSaveStageEntity(
                                distance:
                                    state.sessionModel.stageEntity?.distance,
                                drill: state.sessionModel.stageEntity?.drill,
                                dominantHand: state
                                    .sessionModel.stageEntity?.dominantHand,
                                firearm:
                                    state.sessionModel.stageEntity?.firearm,
                                mode: state.sessionModel.stageEntity?.mode,
                                mountLocation: state
                                    .sessionModel.stageEntity?.mountLocation,
                                sensitivity:
                                    state.sessionModel.stageEntity?.sensitivity,
                                venue: state.sessionModel.stageEntity?.venue,
                              ));
                          // logFullSessionJson(sessionModel);

                          await SessionDbHelper().saveSession(
                            sessionModel,
                            locator<LocalStorageService>().userId!,
                          );
                          // BotToast.closeAllLoading();
                          // sessionSaveToast();

                          await WiFiForIoTPlugin.forceWifiUsage(true);

                          shoQdataBloc.add(const ShoQdataEvent.clearData());

                          if (context.mounted) {
                            print("OnShotDetected===== 1");

                            SessionModel modelNew = model;
                            modelNew.isSessionStart = false;
                            modelNew.makeScoreVisible = null;
                            modelNew.shootModel = null;
                            modelNew.listShots = null;
                            modelNew.numberOfShots = null;
                            modelNew.playedShoots = 0;
                            modelNew.totalScores = 0;
                            modelNew.totalTime = null;
                            modelNew.isSessionPaused = false;
                            modelNew.sessionId = sessionIdFun();

                            context
                                .read<SessionBloc>()
                                .add(ShootEvent(sessionModel: modelNew));
                          } else {
                            toast(null);
                          }

                          if (cameraWiBloc.withWire != null &&
                              cameraWiBloc.withWire == true) {
                            UsbCameraManager.dispose();
                            Navigator.pop(context);
                          } else {
                            slRtspStreamingBloc.add(
                                RtspStreamingEvent.setFovOptionsEvent(
                                    '72', true));

                            slRtspStreamingBloc.add(
                                const RtspStreamingEvent.disposeBloc(true));
                          }
                          if (context.mounted) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                        },
                        style: TextButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 33),
                          minimumSize: Size.zero,
                          // fixedSize: Size(48.w, 36.h),
                          backgroundColor: AppColors.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        child: Text('Exit',
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                                fontFamily: AppFontFamily.bold)));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logFullSessionJson(SaveSessionModel sessionModel) {
    // 1. Encode your model map to JSON (preserves int, double, String)
    final jsonString = jsonEncode(sessionModel.toJson());

    // 2. Emit the full JSON with a custom name / level if you like
    developer.log(
      jsonString,
      name: 'SessionModel',
      level: 0, // 0 = FINEST; use 1000 for INFO, etc.
    );
  }

  void debugPrintFullSessionJson(SaveSessionModel sessionModel) {
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

  void sessionSaveToast() {
    BotToast.showCustomText(
      align: Alignment.topRight,
      toastBuilder: (cancelFunc) {
        return Padding(
          padding: const EdgeInsets.all(26.0),
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ModifiedContainer(
                  width: 60.h,
                  height: 60.h,
                  isBorderOnly: true,
                  borderRadiusOnly: const BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      topLeft: Radius.circular(6)),
                  color: AppColors.greenColor,
                  child: Center(
                      child: Icon(Icons.save_rounded, color: AppColors.white)),
                ),
                SizedBox(
                    width: 230.h,
                    height: 60.h,
                    child: Center(
                        child: Text(
                      'Session saved successfully',
                      style: s14w400regularFont(),
                    )))
              ],
            ),
          ),
        );
      },
    );
  }

  void sessEndDialog(BuildContext context, bool isDiscard) {
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.w),
          ),
          // shadowColor: Theme.of(context).cardColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isDiscard) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close))
                  ],
                ),
                Icon(Icons.info_outline_rounded, color: AppColors.deepOrange),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Text('Do you want to start a new session?',
                        style: s16w400regularFont(
                            color: AppColors.greyTextColor))),
                Gap(10.h)
              ],
              PrimaryButton(
                  title: isDiscard
                      ? 'Yes, Start New Session'
                      : 'Start New Session',
                  style: s16w700regularFont(color: AppColors.white),
                  buttonColor: AppColors.kPrimaryColor,
                  onTap: () async {
                    final isConnected =
                        ((cameraWiBloc.lastConnectedSsid != null &&
                                    cameraWiBloc.lastConnectedSsid != '') ||
                                (cameraWiBloc.withWire != null &&
                                    cameraWiBloc.withWire == true)) &&
                            appBleDeviceBloc.deviceConn?.remoteId != null;
                    if (isConnected) {
                      await WiFiForIoTPlugin.forceWifiUsage(
                          true); // Unpin from RTSP AP

                      shoQdataBloc.add(const ShoQdataEvent.clearData());

                      if (context.mounted) {
                        print("OnShotDetected===== 1");

                        SessionModel modelNew = model;
                        modelNew.isSessionStart = false;
                        modelNew.makeScoreVisible = null;
                        modelNew.shootModel = null;
                        modelNew.listShots = null;
                        modelNew.numberOfShots = null;
                        modelNew.playedShoots = 0;
                        modelNew.totalScores = 0;
                        modelNew.totalTime = null;
                        modelNew.isSessionPaused = false;
                        modelNew.sessionId = sessionIdFun();

                        context
                            .read<SessionBloc>()
                            .add(ShootEvent(sessionModel: modelNew));
                      } else {
                        toast(null);
                      }
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } else {
                      if (context.mounted) {
                        print("OnShotDetected===== 1");

                        SessionModel modelNew = model;
                        modelNew.isSessionStart = false;
                        modelNew.makeScoreVisible = null;
                        modelNew.shootModel = null;
                        modelNew.listShots = null;
                        modelNew.numberOfShots = null;
                        modelNew.playedShoots = 0;
                        modelNew.totalScores = 0;
                        modelNew.totalTime = null;
                        modelNew.isSessionPaused = false;
                        modelNew.sessionId = sessionIdFun();

                        context
                            .read<SessionBloc>()
                            .add(ShootEvent(sessionModel: modelNew));
                      } else {
                        toast(null);
                      }

                      if (cameraWiBloc.withWire != null &&
                          cameraWiBloc.withWire == true) {
                        UsbCameraManager.dispose();
                        Navigator.pop(context);
                      } else {
                        slRtspStreamingBloc.add(
                            RtspStreamingEvent.setFovOptionsEvent('72', true));

                        slRtspStreamingBloc
                            .add(const RtspStreamingEvent.disposeBloc(true));
                      }

                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  }),
              Gap(12.h),
              // isDiscard?
              // BorderButton(
              //     title: isDiscard ? 'No, Return Home' : 'View Saved Session',
              //     style: s16w700regularFont(),
              //     color: Theme.of(context).iconTheme.color,
              //     onTap: () async {
              //       if (isDiscard) {
              //         await WiFiForIoTPlugin.forceWifiUsage(true);
              //
              //         shoQdataBloc.add(const ShoQdataEvent.clearData());
              //
              //         if (context.mounted) {
              //           print("OnShotDetected===== 1");
              //
              //           SessionModel modelNew = model;
              //           modelNew.isSessionStart = false;
              //           modelNew.makeScoreVisible = null;
              //           modelNew.shootModel = null;
              //           modelNew.listShots = null;
              //           modelNew.numberOfShots = null;
              //           modelNew.playedShoots = 0;
              //           modelNew.totalScores = 0;
              //           modelNew.totalTime = null;
              //           modelNew.isSessionPaused = false;
              //           modelNew.sessionId = sessionIdFun();
              //
              //           context
              //               .read<SessionBloc>()
              //               .add(ShootEvent(sessionModel: modelNew));
              //         } else {
              //           toast(null);
              //         }
              //
              //         if (cameraWiBloc.withWire != null &&
              //             cameraWiBloc.withWire == true) {
              //           UsbCameraManager.dispose();
              //           Navigator.pop(context);
              //         } else {
              //           slRtspStreamingBloc.add(
              //               RtspStreamingEvent
              //                   .setFovOptionsEvent(
              //                   '72', true));
              //
              //           slRtspStreamingBloc.add(
              //               const RtspStreamingEvent
              //                   .disposeBloc(true));
              //
              //         }
              //
              //
              //         Navigator.pop(context);
              //         Navigator.pop(context);
              //         Navigator.pop(context);
              //       }
              //       else {
              //         toast(null);
              //       }
              //     }):SizedBox(),
              Gap(12.h),
              // if (!isDiscard)
//                 BlocListener<RtspStreamingBloc, RtspStreamingState>(
//                   bloc: slRtspStreamingBloc,
//                   listener: (context, state) {
//                     if (state.onDisposeSessions == true) {
//                       Navigator.pop(context);
//                       Navigator.pop(context);
//                       Navigator.pop(context);
//                     }
//                   },
//   child: GestureDetector(
//                     onTap: () {
//                       if (context.mounted) {
//                         print("OnShotDetected===== 1");
//
//                         SessionModel modelNew = model;
//                         modelNew.isSessionStart = false;
//                         modelNew.makeScoreVisible = null;
//                         modelNew.shootModel = null;
//                         modelNew.listShots = null;
//                         modelNew.numberOfShots = null;
//                         modelNew.playedShoots = 0;
//                         modelNew.totalScores = 0;
//                         modelNew.totalTime = null;
//                         modelNew.isSessionPaused = false;
//                         modelNew.sessionId = sessionIdFun();
//
//                         context
//                             .read<SessionBloc>()
//                             .add(ShootEvent(sessionModel: modelNew));
//                       }
//                       else {
//                         toast(null);
//                       }
//                       if (cameraWiBloc.withWire != null &&
//                           cameraWiBloc.withWire == true) {
//                         UsbCameraManager.dispose();
//                         Navigator.pop(context);
//                       }
//                       else {
//                         slRtspStreamingBloc.add(
//                             RtspStreamingEvent
//                                 .setFovOptionsEvent(
//                                 '72', true));
//
//                           slRtspStreamingBloc.add(
//                               const RtspStreamingEvent
//                                   .disposeBloc(true));
//
//                       }
//                       //
//                       // Navigator.pop(context);
//                       // Navigator.pop(context);
//                       // Navigator.pop(context);
//                     },
//                     child: Text('Return Home',
//                         style: s16w700regularFont(
//                             color: AppColors.kPrimaryColor))),
// ),
            ],
          ),
        );
      },
    );
  }
}
