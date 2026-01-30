import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/widgets/summary_table_item.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:wifi_iot/wifi_iot.dart';

import '../../../../../core/helper/native_bindings.dart';
import '../../../../home/home_tab.dart';
import '../../data/model/session_model.dart';
import '../bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import '../bloc/shoQ_data/connectivity_check.dart';
import '../bloc/shoQ_data/sho_qdata_bloc.dart';
import 'fram_streaming_widget.dart';

class ShotQReview extends StatefulWidget {
  const ShotQReview({super.key});

  @override
  State<ShotQReview> createState() => _ShotQReviewState();
}

class _ShotQReviewState extends State<ShotQReview> {
  bool _noInternetDialogShown = false;


  void _showNoInternetDialogWithChoice(BuildContext context) {
    if (!context.mounted) return;

    // Live status + waiting flags
    final status = ValueNotifier<ReachStatus>(ReachStatus.offline);
    final waiting = ValueNotifier<bool>(true);
    bool canceled = false;

    // Start waiting immediately (updates status, then auto-close on server_up)
    Reachability.waitForServerUp(
      onStatus: (s) {
        status.value = s;
        if (s == ReachStatus.server_up) {
          waiting.value = false;  // Stop waiting when the server is reachable
        }
      },
    ).then((ready) {
      if (canceled || !context.mounted) return;
      if (ready) {
        Navigator.of(context, rootNavigator: true).maybePop();
        // Kick the BLoC connect just in case (your reach watcher may already do it)
        shoQdataBloc.add(const ShoQdataEvent.connect());
      } else {
        // Timeout branch (optional toast)
        waiting.value = false;
      }
    });

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: const Text('No Internet'),
            content: ValueListenableBuilder<ReachStatus>(
              valueListenable: status,
              builder: (_, s, __) {
                String msg;
                switch (s) {
                  case ReachStatus.offline:
                    msg = 'No network detected. You can switch to an Internet Wi-Fi to proceed.';
                    break;
                  case ReachStatus.captive:
                    msg = 'Connected to a network without Internet (likely the RTSP AP). Switch to an Internet Wi-Fi.';
                    break;
                  case ReachStatus.online_no_server:
                    msg = 'Internet is back. Waiting for server (port 8070)…';
                    break;
                  case ReachStatus.server_up:
                    msg = 'Server reachable. Connecting…';
                    break;
                  default:
                    msg = 'Unknown status.';
                }

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(msg),
                    const SizedBox(height: 12),
                    ValueListenableBuilder<bool>(
                      valueListenable: waiting,
                      builder: (_, isWaiting, __) => isWaiting
                          ? const Row(
                        children: [
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          SizedBox(width: 8),
                          Text('Waiting for Internet…'),
                        ],
                      )
                          : const SizedBox.shrink(),
                    ),
                  ],
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  canceled = true;
                  waiting.value = false;
                  Navigator.of(ctx, rootNavigator: true).pop();
                },
                child: const Text("Cancel", style: TextStyle(fontSize: 16)),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    await WiFiForIoTPlugin.forceWifiUsage(false); // Unpin from RTSP AP
                  } catch (_) {}
                  WiFiSettings.openWiFiSettings();
                },
                child: const Text("OK", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      // child: BlocProvider.value(
      //   value: shoQdataBloc..add(const ShoQdataEvent.connect()),
      //   // optional auto-connect
      //   child: BlocListener<ShoQdataBloc, ShoQdataState>(
      //     listenWhen: (prev, curr) =>
      //         curr.maybeWhen(error: (_) => true, orElse: () => false),
      //     listener: (context, state) {
      //       state.maybeWhen(
      //         error: (msg) {
      //           print("object_NO_InterNet---$msg");
      //           _showNoInternetDialog(context);
      //         },
      //         orElse: () {},
      //       );
      //     },
      //     child: BlocBuilder<SessionBloc, SessionState>(
      //       builder: (_, stateSession) {
      //         if (stateSession is ShootState) {
      //           List<ShootModel> filtered =
      //               stateSession.sessionModel.listShots == null
      //                   ? []
      //                   : stateSession.sessionModel.listShots!
      //                       .where((s) => !(stateSession.sessionModel.listShots!
      //                                   .where((x) =>
      //                                       x.shootNumber == s.shootNumber)
      //                                   .length >
      //                               1 &&
      //                           (s.splitTime?.isEmpty ?? true)))
      //                       .toList();
      //           return BlocBuilder<ShoQdataBloc, ShoQdataState>(
      //             builder: (context, state) {
      //               // Pull the latest accumulated data (or empty map for shimmers)
      //               final Map<String, dynamic> a = state.maybeWhen(
      //                 success: (m) => m,
      //                 orElse: () => const {},
      //               );
      //
      //               // Helper getters
      //               String? s(String key) => a[key]?.toString();
      //               int? i_(String key) =>
      //                   a[key] is num ? (a[key] as num).toInt() : null;
      //               final shotList = a['key_shot_analysis'] is List
      //                   ? (a['key_shot_analysis'] as List)
      //                   : null;
      ///
      //               return Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   SizedBox(height: 8.h),
      //
      //                   // Session & Shooter Info
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.end,
      //                     children: [
      //                       textOrShimmer(
      //                         value: 'Shooter: JohnD',
      //                         // static for now; wire from your own model if needed
      //                         style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: fsSubheading.sp),
      //                       ),
      //                       IconButton(
      //                         icon: Icon(Icons.refresh),
      //                         onPressed: () async {
      //                           context
      //                               .read<ShoQdataBloc>()
      //                               .add(const ShoQdataEvent.connect());
      //
      //                           final sessionData = {
      //                             "session_id": "PA_2025-08-02_19641",
      //                             "shooter": "DemoShooter01",
      //                             "total_shots": filtered.length,
      //                             "shot_data": filtered.map((shoot) {
      //                               return {
      //                                 "shot": shoot.shootNumber ?? 0,
      //                                 "score": shoot.shootScore ?? 0,
      //                                 "split_time": shoot.splitTimeInt?.toDouble() ?? 0.0,
      //                                 "direction": shoot.shotDirection ?? "Unknown",
      //                               };
      //                             }).toList(),
      //                           };
      //
      //                           shoQdataBloc.add(ShoQdataEvent.sendData(sessionData));
      //                         },
      //                       ),
      //                     ],
      //                   ),
      //                   SizedBox(height: 16.h),
      //
      //                   // Review Card (detailed narrative)
      //                   Container(
      //                     padding: EdgeInsets.all(16.r),
      //                     decoration: r8Decoration,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         // Use the live field for narrative if your backend sends it (detailed_shot_analysis)
      //                         textOrShimmer(
      //                           value: s('detailed_shot_analysis'),
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: fsBody.sp,
      //                               height: 1.5),
      //                           multiline: true,
      //                           shimmerWidth: 320,
      //                           shimmerLines: 4,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(height: 16.h),
      //
      //                   // Insight Card
      //                   Container(
      //                     padding: EdgeInsets.all(16.r),
      //                     decoration: r8Decoration,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Row(children: [
      //                           Text(
      //                             '🧠   ShotQ Insight',
      //                             style: TextStyle(
      //                                 color: Colors.orange,
      //                                 fontSize: fsHeading.sp,
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                         ]),
      //                         SizedBox(height: 8.h),
      //                         _insightRow('Strength', s('key_insights')),
      //                         _insightRow('Focus Area', s('primary_focus')),
      //                         _insightRow('Next Challenge',
      //                             s('key_opportunity') ?? s('next_drill')),
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(height: 16.h),
      //
      //                   // Metrics Row (each with value + small desc)
      //                   Row(
      //                     children: [
      //                       Expanded(
      //                           child: _metricCard(
      //                         title: 'Shot Consistency',
      //                         value: (i_('shot_consistency') ??
      //                                 s('shot_consistency'))
      //                             ?.toString(),
      //                         suffix: i_('shot_consistency') != null ? '%' : '',
      //                         desc: s('shot_consistency_detail'),
      //                       )),
      //                       SizedBox(width: 16.w),
      //                       Expanded(
      //                           child: _metricCard(
      //                         title: 'Trigger Control',
      //                         value: s('trigger_control'),
      //                         // if your backend later sends it
      //                         suffix: s('trigger_control') != null &&
      //                                 s('trigger_control')!.contains('%')
      //                             ? ''
      //                             : '%',
      //                         desc:
      //                             'Steady press & reset', // static hint until backend sends detail
      //                       )),
      //                       SizedBox(width: 16.w),
      //                       Expanded(
      //                           child: _metricCard(
      //                         title: 'Shot Placement',
      //                         value: s('shot_placement'),
      //                         suffix: s('shot_placement') != null &&
      //                                 s('shot_placement')!.contains('%')
      //                             ? ''
      //                             : '%',
      //                         desc: 'Centering impacts',
      //                       )),
      //                       SizedBox(width: 16.w),
      //                       Expanded(
      //                           child: _metricCard(
      //                         title: 'Split Time',
      //                         value: s('split_time_consistency'),
      //                         suffix: s('split_time_consistency') != null &&
      //                                 s('split_time_consistency')!.contains('%')
      //                             ? ''
      //                             : '%',
      //                         desc: 'Rhythm stability',
      //                       )),
      //                     ],
      //                   ),
      //                   SizedBox(height: 16.h),
      //
      //                   // Skill Focus Section
      //                   Container(
      //                     padding: EdgeInsets.all(16.r),
      //                     decoration: r8Decoration,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Row(children: [
      //                           Text(
      //                             '🎯   ShotQ Skill Focus',
      //                             style: TextStyle(
      //                                 color: Colors.orange,
      //                                 fontSize: fsHeading.sp,
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                         ]),
      //                         SizedBox(height: 8.h),
      //                         textOrShimmer(
      //                           value: s('primary_focus_detail') ??
      //                               s('primary_focus'),
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: fsSubheading.sp),
      //                           multiline: true,
      //                           shimmerWidth: 320,
      //                           shimmerLines: 3,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(height: 16.h),
      //
      //                   // Rating Section
      //                   Container(
      //                     padding: EdgeInsets.all(16.r),
      //                     decoration: r8Decoration,
      //                     child: Row(
      //                       children: [
      //                         Expanded(
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Text(
      //                                 'ShotQ Rating',
      //                                 style: TextStyle(
      //                                     color: Colors.orange,
      //                                     fontSize: fsHeading.sp,
      //                                     fontWeight: FontWeight.bold),
      //                               ),
      //                               SizedBox(height: 8.h),
      //                               textOrShimmer(
      //                                 value: s('shot_consistency_detail'),
      //                                 style: TextStyle(
      //                                     color: Colors.white,
      //                                     fontSize: fsSubheading.sp),
      //                                 multiline: true,
      //                                 shimmerWidth: 320,
      //                                 shimmerLines: 2,
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         // Big grade on the right
      //                         Builder(builder: (context) {
      //                           final grade = s('rating');
      //                           return grade != null && grade.isNotEmpty
      //                               ? Text(grade,
      //                                   style: TextStyle(
      //                                       color: Colors.orange,
      //                                       fontSize: fsRating.sp,
      //                                       fontWeight: FontWeight.bold))
      //                               : _shimmerLine(
      //                                   width: 48,
      //                                   height: fsRating.sp.toDouble());
      //                         }),
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(height: 16.h),
      //
      //                   // Human Coach CTA (static UI, keep as-is)
      //                   Container(
      //                     width: double.infinity,
      //                     padding: EdgeInsets.all(16.r),
      //                     decoration: r8Decoration,
      //                     child: Column(
      //                       children: [
      //                         Text(
      //                           coachTitle,
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: fsHeading.sp,
      //                               fontWeight: FontWeight.bold),
      //                         ),
      //                         SizedBox(height: 8.h),
      //                         Text(
      //                           coachDesc,
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: fsSubheading.sp),
      //                         ),
      //                         SizedBox(height: 16.h),
      //                         OutlinedButton(
      //                           onPressed: () {},
      //                           style: OutlinedButton.styleFrom(
      //                             side: const BorderSide(color: Colors.orange),
      //                             padding: EdgeInsets.symmetric(
      //                                 horizontal: 24.w, vertical: 12.h),
      //                           ),
      //                           child: Text(
      //                             coachButton,
      //                             style: TextStyle(
      //                                 color: Colors.orange,
      //                                 fontSize: fsSubheading.sp,
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //
      //                   // Optional: show number of analyzed shots (shimmer until list arrives)
      //                   SizedBox(height: 16.h),
      //                   Row(
      //                     children: [
      //                       Text(
      //                         'Analyzed shots:',
      //                         style: TextStyle(
      //                             color: Colors.white70,
      //                             fontSize: fsSubheading.sp),
      //                       ),
      //                       SizedBox(width: 8.w),
      //                       (shotList != null)
      //                           ? Text('${shotList.length}',
      //                               style: TextStyle(
      //                                   color: Colors.white,
      //                                   fontSize: fsSubheading.sp,
      //                                   fontWeight: FontWeight.w600))
      //                           : _shimmerLine(
      //                               width: 40,
      //                               height: fsSubheading.sp.toDouble()),
      //                     ],
      //                   ),
      //                 ],
      //               );
          //         },
          //       );
          //     } else {
          //       return const SizedBox.shrink();
          //     }
          //   },
          // ),
      ///
      //     // child: Column(
      //     //   crossAxisAlignment: CrossAxisAlignment.start,
      //     //   children: [
      //     //
      //     //     SizedBox(height: 8.h),
      //     //
      //     //     // Session & Shooter Info (Subheading)
      //     //     Row(
      //     //       mainAxisAlignment: MainAxisAlignment.end,
      //     //       children: [
      //     //         Text(
      //     //           'Shooter: JohnD',
      //     //           style:
      //     //               TextStyle(color: Colors.white, fontSize: fsSubheading.sp),
      //     //         ),
      //     //       ],
      //     //     ),
      //     //     SizedBox(height: 16.h),
      //     //
      //     //     // Review Card (Body)
      //     //     Container(
      //     //       padding: EdgeInsets.all(16.r),
      //     //       decoration: r8Decoration,
      //     //       child: Column(
      //     //         crossAxisAlignment: CrossAxisAlignment.start,
      //     //         children: [
      //     //           Text(reviewPara1,
      //     //               style: TextStyle(
      //     //                 color: Colors.white,
      //     //                 fontSize: fsBody.sp,
      //     //                 height: 1.5,
      //     //               )),
      //     //           SizedBox(height: 12.h),
      //     //           Text(reviewPara2,
      //     //               style: TextStyle(
      //     //                 color: Colors.white,
      //     //                 fontSize: fsBody.sp,
      //     //                 height: 1.5,
      //     //               )),
      //     //           SizedBox(height: 12.h),
      //     //           Text(reviewPara3,
      //     //               style: TextStyle(
      //     //                 color: Colors.white,
      //     //                 fontSize: fsBody.sp,
      //     //                 height: 1.5,
      //     //               )),
      //     //           SizedBox(height: 12.h),
      //     //           Text(reviewPara4,
      //     //               style: TextStyle(
      //     //                 color: Colors.white,
      //     //                 fontSize: fsBody.sp,
      //     //                 height: 1.5,
      //     //               )),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //     SizedBox(height: 16.h),
      //     //
      //     //     // Insight Card
      //     //     Container(
      //     //       padding: EdgeInsets.all(16.r),
      //     //       decoration: r8Decoration,
      //     //       child: Column(
      //     //         crossAxisAlignment: CrossAxisAlignment.start,
      //     //         children: [
      //     //           Row(
      //     //             children: [
      //     //               // Text('🎯', style: TextStyle(fontSize: fsHeading.sp)),
      //     //               // SizedBox(width: 8.w),
      //     //               Text(
      //     //                 '🧠   ShotQ Insight',
      //     //                 style: TextStyle(
      //     //                   color: Colors.orange,
      //     //                   fontSize: fsHeading.sp,
      //     //                   fontWeight: FontWeight.bold,
      //     //                 ),
      //     //               ),
      //     //             ],
      //     //           ),
      //     //           SizedBox(height: 8.h),
      //     //           InsightSection(label: 'Strength', value: insightStrength),
      //     //           InsightSection(label: 'Focus Area', value: insightFocusArea),
      //     //           InsightSection(
      //     //               label: 'Next Challenge', value: insightNextChallenge),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //     SizedBox(height: 16.h),
      //     //
      //     //     // Metrics Row
      //     //     Row(
      //     //       children: [
      //     //         Expanded(
      //     //           child: MetricCard(
      //     //             title: 'Shot Consistency',
      //     //             percent: '92%',
      //     //             description: metric1Desc,
      //     //           ),
      //     //         ),
      //     //         SizedBox(width: 16.w),
      //     //         Expanded(
      //     //           child: MetricCard(
      //     //             title: 'Trigger Control',
      //     //             percent: '83%',
      //     //             description: metric2Desc,
      //     //           ),
      //     //         ),
      //     //         SizedBox(width: 16.w),
      //     //         Expanded(
      //     //           child: MetricCard(
      //     //             title: 'Shot Placement',
      //     //             percent: '87%',
      //     //             description: metric3Desc,
      //     //           ),
      //     //         ),
      //     //         SizedBox(width: 16.w),
      //     //         Expanded(
      //     //           child: MetricCard(
      //     //             title: 'Split Time',
      //     //             percent: '91%',
      //     //             description: metric4Desc,
      //     //           ),
      //     //         ),
      //     //       ],
      //     //     ),
      //     //     SizedBox(height: 16.h),
      //     //
      //     //     // Skill Focus Section
      //     //     Container(
      //     //       padding: EdgeInsets.all(16.r),
      //     //       decoration: r8Decoration,
      //     //       child: Column(
      //     //         crossAxisAlignment: CrossAxisAlignment.start,
      //     //         children: [
      //     //           Row(
      //     //             children: [
      //     //               // Text('🎯', style: TextStyle(fontSize: fsHeading.sp)),
      //     //               // SizedBox(width: 8.w),
      //     //               Text(
      //     //                 '🎯   ShotQ Skill Focus',
      //     //                 style: TextStyle(
      //     //                   color: Colors.orange,
      //     //                   fontSize: fsHeading.sp,
      //     //                   fontWeight: FontWeight.bold,
      //     //                 ),
      //     //               ),
      //     //             ],
      //     //           ),
      //     //           SizedBox(height: 8.h),
      //     //           Text(
      //     //             skillFocusSubtitle,
      //     //             style:
      //     //                 TextStyle(color: Colors.white, fontSize: fsSubheading.sp),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //     SizedBox(height: 16.h),
      //     //
      //     //     // Rating Section
      //     //     Container(
      //     //       padding: EdgeInsets.all(16.r),
      //     //       decoration: r8Decoration,
      //     //       child: Row(
      //     //         children: [
      //     //           Expanded(
      //     //             child: Column(
      //     //               crossAxisAlignment: CrossAxisAlignment.start,
      //     //               children: [
      //     //                 Text(
      //     //                   'ShotQ Rating',
      //     //                   style: TextStyle(
      //     //                     color: Colors.orange,
      //     //                     fontSize: fsHeading.sp,
      //     //                     fontWeight: FontWeight.bold,
      //     //                   ),
      //     //                 ),
      //     //                 SizedBox(height: 8.h),
      //     //                 Text(
      //     //                   ratingDesc,
      //     //                   style: TextStyle(
      //     //                       color: Colors.white, fontSize: fsSubheading.sp),
      //     //                 ),
      //     //               ],
      //     //             ),
      //     //           ),
      //     //           Text(
      //     //             ratingGrade,
      //     //             style: TextStyle(
      //     //               color: Colors.orange,
      //     //               fontSize: fsRating.sp,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //     SizedBox(height: 16.h),
      //     //
      //     //     // Human Coach CTA Section
      //     //     Container(
      //     //       width: double.infinity,
      //     //       padding: EdgeInsets.all(16.r),
      //     //       decoration: r8Decoration,
      //     //       child: Column(
      //     //         children: [
      //     //           Text(
      //     //             coachTitle,
      //     //             style: TextStyle(
      //     //               color: Colors.white,
      //     //               fontSize: fsHeading.sp,
      //     //               fontWeight: FontWeight.bold,
      //     //             ),
      //     //           ),
      //     //           SizedBox(height: 8.h),
      //     //           Text(
      //     //             coachDesc,
      //     //             textAlign: TextAlign.center,
      //     //             style:
      //     //                 TextStyle(color: Colors.white, fontSize: fsSubheading.sp),
      //     //           ),
      //     //           SizedBox(height: 16.h),
      //     //           OutlinedButton(
      //     //             onPressed: () {},
      //     //             style: OutlinedButton.styleFrom(
      //     //               side: BorderSide(color: Colors.orange),
      //     //               padding:
      //     //                   EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      //     //             ),
      //     //             child: Text(
      //     //               coachButton,
      //     //               style: TextStyle(
      //     //                   color: Colors.orange,
      //     //                   fontSize: fsSubheading.sp,
      //     //                   fontWeight: FontWeight.bold),
      //     //             ),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //
      //     //   ],
      //     // ),
      //   ),
      // ),
      child: BlocProvider.value(
        value: shoQdataBloc..add(const ShoQdataEvent.connect()), // optional auto-connect
        // value: shoQdataBloc, // optional auto-connect
        child: MultiBlocListener(
          listeners: [
            // Show dialog only for the specific "No internet connection." error
            BlocListener<ShoQdataBloc, ShoQdataState>(
              listenWhen: (prev, curr) => curr.maybeWhen(error: (_) => true, orElse: () => false),
              listener: (context, state) {
                state.maybeWhen(

                  error: (msg) {
                    if (msg == 'No internet connection.') {
                      print("orIF_Check_state____ = ${state.toString()}");
                      _showNoInternetDialogWithChoice(context);
                    }
                  },
                  orElse: () {
                    print("orElse_Check_state____ = ${state.toString()}");
                  },
                );
              },
            ),
            // Close dialog if we get connected before waitForServerUp finishes
            BlocListener<ShoQdataBloc, ShoQdataState>(
              listenWhen: (p, c) => c.maybeWhen(connected: () => true, orElse: () => false),
              listener: (_, __) {
                if (_noInternetDialogShown && mounted) {
                  // Navigator.of(context, rootNavigator: true).pop();
                  _noInternetDialogShown = false;
                }
              },
            ),
          ],
          child: BlocBuilder<SessionBloc, SessionState>(
            builder: (_, stateSession) {
              if (stateSession is ShootState) {
                final filtered = (stateSession.sessionModel.listShots ?? [])
                    .where((s) =>
                !((stateSession.sessionModel.listShots ?? [])
                    .where((x) => x.shootNumber == s.shootNumber)
                    .length >
                    1 &&
                    (s.splitTime?.isEmpty ?? true)))
                    .toList();

                return BlocBuilder<ShoQdataBloc, ShoQdataState>(
                  builder: (context, state) {
                    // Latest accumulated data (or empty for shimmer)
                    if(state is Connected){
                      final sessionData = {
                        "session_id": "PA_2025-08-02_19641",
                        "shooter": "DemoShooter01",
                        "total_shots": filtered.length,
                        "shot_data": filtered.map((shoot) {
                          return {
                            "shot": shoot.shootNumber ?? 0,
                            "score": shoot.shootScore ?? 0,
                            "split_time": shoot.splitTimeInt?.toDouble() ?? 0.0,
                            "direction": shoot.shotDirection ?? "Unknown",
                          };
                        }).toList(),
                      };

                      shoQdataBloc.add(ShoQdataEvent.sendData(sessionData));
                    }
                    final Map<String, dynamic> a = state.maybeWhen(
                      success: (m) => m,
                      orElse: () => const {},
                    );

                    String? s(String key) => a[key]?.toString();
                    int? i_(String key) => a[key] is num ? (a[key] as num).toInt() : null;
                    final shotList = a['key_shot_analysis'] is List ? (a['key_shot_analysis'] as List) : null;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.h),

                        // Session & Shooter Info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            textOrShimmer(
                              value: 'Shooter: JohnD',
                              // static for now; wire from your own model if needed
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fsSubheading.sp),
                            ),
                            IconButton(
                              icon: Icon(Icons.refresh),
                              onPressed: () async {
                                // context
                                //     .read<ShoQdataBloc>()
                                //     .add(const ShoQdataEvent.connect());

                                final sessionData = {
                                  "session_id": "PA_2025-08-02_19641",
                                  "shooter": "DemoShooter01",
                                  "total_shots": filtered.length,
                                  "shot_data": filtered.map((shoot) {
                                    return {
                                      "shot": shoot.shootNumber ?? 0,
                                      "score": shoot.shootScore ?? 0,
                                      "split_time": shoot.splitTimeInt?.toDouble() ?? 0.0,
                                      "direction": shoot.shotDirection ?? "Unknown",
                                    };
                                  }).toList(),
                                };

                                shoQdataBloc.add(ShoQdataEvent.sendData(sessionData));
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // Review Card (detailed narrative)
                        Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: r8Decoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Use the live field for narrative if your backend sends it (detailed_shot_analysis)
                              textOrShimmer(
                                value: s('detailed_shot_analysis'),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fsBody.sp,
                                    height: 1.5),
                                multiline: true,
                                shimmerWidth: 320,
                                shimmerLines: 4,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Insight Card
                        Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: r8Decoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(
                                  '🧠   ShoQ® Insight',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: fsHeading.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                              SizedBox(height: 8.h),
                              _insightRow('Strength', s('key_insights')),
                              _insightRow('Focus Area', s('primary_focus')),
                              _insightRow('Next Challenge',
                                  s('key_opportunity') ?? s('next_drill')),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Metrics Row (each with value + small desc)
                        Row(
                          children: [
                            Expanded(
                                child: _metricCard(
                                  title: 'Shot Consistency',
                                  value: (i_('shot_consistency') ??
                                      s('shot_consistency'))
                                      ?.toString(),
                                  suffix: i_('shot_consistency') != null ? '%' : '',
                                  desc: s('shot_consistency_detail'),
                                )),
                            SizedBox(width: 16.w),
                            Expanded(
                                child: _metricCard(
                                  title: 'Trigger Control',
                                  value: s('trigger_control'),
                                  // if your backend later sends it
                                  suffix: s('trigger_control') != null &&
                                      s('trigger_control')!.contains('%')
                                      ? ''
                                      : '%',
                                  desc:
                                  'Steady press & reset', // static hint until backend sends detail
                                )),
                            SizedBox(width: 16.w),
                            Expanded(
                                child: _metricCard(
                                  title: 'Shot Placement',
                                  value: s('shot_placement'),
                                  suffix: s('shot_placement') != null &&
                                      s('shot_placement')!.contains('%')
                                      ? ''
                                      : '%',
                                  desc: 'Centering impacts',
                                )),
                            SizedBox(width: 16.w),
                            Expanded(
                                child: _metricCard(
                                  title: 'Split Time',
                                  value: s('split_time_consistency'),
                                  suffix: s('split_time_consistency') != null &&
                                      s('split_time_consistency')!.contains('%')
                                      ? ''
                                      : '%',
                                  desc: 'Rhythm stability',
                                )),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // Skill Focus Section
                        Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: r8Decoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(
                                  '🎯   ShoQ® Skill Focus',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: fsHeading.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                              SizedBox(height: 8.h),
                              textOrShimmer(
                                value: s('primary_focus_detail') ??
                                    s('primary_focus'),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fsSubheading.sp),
                                multiline: true,
                                shimmerWidth: 320,
                                shimmerLines: 3,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Rating Section
                        Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: r8Decoration,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ShoQ® Rating',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: fsHeading.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8.h),
                                    textOrShimmer(
                                      value: s('shot_consistency_detail'),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: fsSubheading.sp),
                                      multiline: true,
                                      shimmerWidth: 320,
                                      shimmerLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              // Big grade on the right
                              Builder(builder: (context) {
                                final grade = s('rating');
                                return grade != null && grade.isNotEmpty
                                    ? Text(grade,
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: fsRating.sp,
                                        fontWeight: FontWeight.bold))
                                    : _shimmerLine(
                                    width: 48,
                                    height: fsRating.sp.toDouble());
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),

                        // Human Coach CTA (static UI, keep as-is)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.r),
                          decoration: r8Decoration,
                          child: Column(
                            children: [
                              Text(
                                coachTitle,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fsHeading.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                coachDesc,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fsSubheading.sp),
                              ),
                              SizedBox(height: 16.h),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.orange),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 12.h),
                                ),
                                child: Text(
                                  coachButton,
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: fsSubheading.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Optional: show number of analyzed shots (shimmer until list arrives)
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Text(
                              'Analyzed shots:',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: fsSubheading.sp),
                            ),
                            SizedBox(width: 8.w),
                            (shotList != null)
                                ? Text('${shotList.length}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: fsSubheading.sp,
                                    fontWeight: FontWeight.w600))
                                : _shimmerLine(
                                width: 40,
                                height: fsSubheading.sp.toDouble()),
                          ],
                        ),
                      ],
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  void _showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        title: const Text("No Internet"),
        content: const Text(
            "You’re connected to the RTSP camera but there’s no internet route to the server.\n"
            "Connect to an internet Wi-Fi or enable mobile data, then try again."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Cancel",style: TextStyle(fontSize: 16),),
          ),
          TextButton(
            onPressed: () {
              slRtspStreamingBloc.add(
                  const RtspStreamingEvent.disposeBloc(false));

              // Navigator.of(ctx).pop();
              WiFiSettings.openWiFiSettings();
            },
            child: const Text("Ok",style: TextStyle(fontSize: 16),),
          ),
        ],
      ),
    );
  }

  Widget _insightRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120, // label column
            child: Text(label,
                style: const TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: textOrShimmer(
              value: value,
              style: const TextStyle(color: Colors.white, height: 1.5),
              multiline: true,
              shimmerWidth: 260,
              shimmerLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricCard({
    required String title,
    required String? value,
    String suffix = '',
    String? desc,
  }) {
    final hasValue = value != null && value.trim().isNotEmpty;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: r8Decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.orange, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          hasValue
              ? Text('$value$suffix',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600))
              : _shimmerLine(width: 60, height: 20),
          const SizedBox(height: 6),
          textOrShimmer(
            value: desc,
            style: const TextStyle(color: Colors.white70, height: 1.4),
            multiline: true,
            shimmerWidth: 200,
            shimmerLines: 2,
          ),
        ],
      ),
    );
  }
}

Widget _shimmerLine(
    {double width = 180, double height = 14, double radius = 6}) {
  return Shimmer(
    color: Colors.white,
    colorOpacity: 0.25,
    duration: const Duration(milliseconds: 1200),
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}

Widget shimmerParagraph({int lines = 3, double maxWidth = 280}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(lines, (i) {
      final w = i == lines - 1 ? maxWidth * 0.6 : maxWidth;
      return Padding(
        padding: EdgeInsets.only(bottom: i == lines - 1 ? 0 : 8),
        child: _shimmerLine(width: w),
      );
    }),
  );
}

/// Text with shimmer fallback
Widget textOrShimmer({
  required String? value,
  required TextStyle style,
  bool multiline = false,
  double shimmerWidth = 220,
  int shimmerLines = 3,
}) {
  if (value != null && value.trim().isNotEmpty) {
    return Text(value, style: style);
  }
  return multiline
      ? shimmerParagraph(lines: shimmerLines, maxWidth: shimmerWidth)
      : _shimmerLine(width: shimmerWidth, height: style.fontSize ?? 14);
}

// Font size constants (in sp units)
const double fsHeading = 7.0;
const double fsSubheading = 6.0;
const double fsBody = 5.0;
const double fsRating = 8.0;

// Review paragraphs
const String reviewPara1 =
    '''You're demonstrating high-level consistency and accuracy. Most of your shots landed in the 9–10 zone, with tight clustering near the upper-right quadrant (↗ NE). This pattern suggests a solid stance and sight alignment, though the consistent drift could be a subtle indicator of right-hand push or anticipation during trigger press.''';
const String reviewPara2 =
    '''Shot #3, which dropped to a 7 low-left, stood out from the rest — a classic sign of trigger dip or grip disruption. Your ability to recover and return to high scoring in subsequent shots shows good mental composure and rhythm.''';
const String reviewPara3 =
    '''Split times were impressively even, with your quickest at 1.05”. None of your pacing seemed rushed overall, but you may want to check whether that fastest shot came with a slight dip in control or aim correction lag.''';
const String reviewPara4 =
    '''Shot #6 was not detected. If this was dry fire, check your AimSync placement and ensure trigger press was clean enough to register vibration. If this was live, environmental noise or sensor misalignment could be the cause.''';

// Insight values
const String insightStrength = 'Consistency under repetition';
const String insightFocusArea = 'Trigger Control & Directional Correction';
const String insightNextChallenge =
    'Run a 15-shot dry-fire drill while keeping split time under 1.4” and no more than one directional miss per 5 shots.';

// Metric descriptions
const String metric1Desc =
    'Your shots maintain a consistent pattern with most landing in the 9-10 zone with tight clustering.';
const String metric2Desc =
    'Good trigger press with minimal muzzle movement. Focus on maintaining steady pressure.';
const String metric3Desc =
    'Excellent accuracy with a slight northeastern tendency. Consider minor sight adjustment.';
const String metric4Desc =
    'Impressively even timing with quickest at 1.05”. Good rhythm between shots.';

// Skill focus & CTA
const String skillFocusSubtitle = 'Trigger Control + Grouping Discipline';
const String ratingDesc =
    'Excellent marksmanship with minor directional tuning needed.';
const String ratingGrade = 'A-';
const String coachTitle = 'Want a Human Coach Review?';
const String coachDesc =
    'Join the Zero Range Coach Network (ZRCN) to connect with certified instructors who can give you live or virtual feedback.';
const String coachButton = 'Find a Coach';

class InsightSection extends StatelessWidget {
  final String label;
  final String value;

  const InsightSection({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              color: Colors.white,
              fontSize: fsBody.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(value,
                style: TextStyle(color: Colors.white, fontSize: fsBody.sp)),
          ),
        ],
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title;
  final String percent;
  final String description;

  const MetricCard({
    Key? key,
    required this.title,
    required this.percent,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: r8Decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            percent,
            style: TextStyle(
                color: Colors.orange,
                fontSize: fsBody.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: fsSubheading.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: TextStyle(color: Colors.white, fontSize: fsBody.sp),
          ),
        ],
      ),
    );
  }
}

Decoration r8Decoration = BoxDecoration(
  color: AppColors.lightGry,
  borderRadius: BorderRadius.circular(8.r),
);

Decoration r8DecorationWhite = BoxDecoration(
  color: AppColors.white,
  borderRadius: BorderRadius.circular(8.r),
);
