import 'dart:async';
import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:ffi/ffi.dart';

import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_usb_camera/flutter_usb_camera.dart';
import 'package:keep_screen_on/keep_screen_on.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/color/app_colors_new.dart';
import '../../../../../core/theme/font/app_fonts.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../test_stream/usb_manager.dart';
import '../../../connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../connectivity/presentation/bloc/bluetooth_bloc/timer_bloc/listning_timer_bloc.dart';
import '../../data/model/image_model.dart';
import '../bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import 'frams_streaming/native_opencv.dart';
import 'frams_streaming/rtsp_service.dart';
import 'frams_streaming/socket_service.dart';
import 'frams_streaming/stream_manager.dart';
import 'frams_streaming/streaming_const.dart';

import 'package:flutter/services.dart';

var slRtspStreamingBloc = locator<RtspStreamingBloc>();

class FrameStreamingWidget extends StatefulWidget {
  final int streamMode;
  final int distance;
  final bool withCable;

  const FrameStreamingWidget({super.key, required this.streamMode, required this.distance, required this.withCable});

  @override
  State<FrameStreamingWidget> createState() => _FrameStreamingWidgetState();
}

class _FrameStreamingWidgetState extends State<FrameStreamingWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RtspStreamingBloc, RtspStreamingState>(
      listener: (context, state) {
        // if (state.isReSetting) {
        //   SpinKitCircle(color: Colors.orange);
        // }
        if (state.isStreamDisposed) {
          print("isStreamDisposed=== 1");
          slRtspStreamingBloc.add(RtspStreamingEvent.started(
              widget.streamMode, widget.distance, widget.withCable));
        }
        if (state.onDisposeSessions) {
          print("isStreamDisposed=== 2");
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<RtspStreamingBloc, RtspStreamingState>(
        builder: (context, state) {

          return
            // Column(
            // children: [
            (state.streamState == 'open_stream' ||
                state.streamState == 'detect_circles' ||
                state.streamState == 'simple_streaming' ||
                state.streamState == 'predict') &&
                slRtspStreamingBloc.isFrameSizeInitialize
                ? StreamBuilder<Uint8List>(
              stream: StreamManager().stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return state.streamState == 'detect_circles'
                      ? CropImageWidget(image: snapshot.data!)
                      : state.streamState == 'simple_streaming'
                      ? Image.memory(
                    snapshot.data!,
                    gaplessPlayback: true,
                    filterQuality: FilterQuality.medium,
                    errorBuilder:
                        (context, error, stackTrace) {
                      return const Center(
                        child: Text('Error displaying image'),
                      );
                    },
                  )
                      : Stack(
                    children: [
                      Positioned.fill(
                        child: Image.memory(
                          snapshot.data!,
                          gaplessPlayback: true,
                          filterQuality: FilterQuality.medium,
                          fit: BoxFit.fill,
                          errorBuilder:
                              (context, error, stackTrace) {
                            return const Center(
                              child: Text('Error displaying image'),
                            );
                          },
                        ),
                      ),
                      Positioned(
                          top: 16,
                          right: 16,
                          child: StreamBuilder<int>(
                              stream: StreamManager()
                                  .speedStream,
                              initialData: 0,
                              builder:
                                  (context, snapshot) {
                                int? frameIndex =
                                    snapshot.data;
                                return Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: _colorForStatus(frameIndex),
                                    shape: BoxShape.circle,
                                  ),
                                );
                              })
                      ),

                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpinKitCircle(color: Colors.orange),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text("Loading stream...")
                      ],
                    ),
                  );
                }
                else if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return const Center(child: Text('Stream ended'));
                }
                else if (snapshot.hasError) {
                  return Center(
                      child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpinKitCircle(color: Colors.orange),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text("Loading stream...")
                      ],
                    ),
                  );
                }
              },
            )
                : RepaintBoundary(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  // image: const DecorationImage(
                  //   fit: BoxFit.cover,
                  //   image: AssetImage('assets/images/session_targ.png'),
                  // ),
                ),
                height: ScreenUtil().screenHeight,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      state.error == "404"
                          ? Icon(
                        Icons.connect_without_contact,
                        size: 60,
                        color: AppColors.greyText,
                      )
                          : SpinKitCircle(color: Colors.orange),
                      SizedBox(
                        height: 8.h,
                      ),
                      state.error == "404"
                          ? Text(
                        "Remove camera battery and connect it again , there is an issue while connecting camera \n OS Error and  Connection refused ",
                        textAlign: TextAlign.center,
                      )
                          : Text("Connecting to camera...")
                    ],
                  ),
                ),

                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [
                //       if (statesession
                //               .sessionModel.isSessionPaused !=
                //           true)
                //         BlocBuilder<ListningTimerBloc,
                //             ListningTimerState>(
                //           builder: (context, state) {
                //             if (state is TimerRunning) {
                //               return FloatingActionButton.small(
                //                 backgroundColor:
                //                     AppColors.kPrimaryColor,
                //                 onPressed: () {},
                //                 child: Text(
                //                     '${state.secondsLeft}',
                //                     style:
                //                         s12w400regularFont()),
                //               );
                //             } else {
                //               return const SizedBox.shrink();
                //             }
                //           },
                //         )
                //       /*
                // if (statesession.sessionModel.isSessionStart ==
                //         true &&
                //     statesession.sessionModel.isSessionPaused ==
                //         false &&
                //     statesession.sessionModel.playBeep == false)
                //   FloatingActionButton.small(
                //       onPressed: () async {
                //         BotToast.showLoading();
                //         String shootImageP = 'asdf';
                //         await _captureScreenshot(
                //             '${statesession.sessionModel.sessionId}');
                //         BotToast.closeAllLoading();
                //         if (shootImageP != '' &&
                //             context.mounted) {
                //           currentShoot = currentShoot + 1;
                //           totalScores =
                //               totalScores + currentShoot + 3;
                //           int partTime = 10;
                //           if (statesession
                //                   .sessionModel
                //                   .stageEntity
                //                   ?.drill
                //                   ?.drill
                //                   ?.partTimeType ==
                //               'for-each') {
                //             partTime = statesession
                //                         .sessionModel
                //                         .stageEntity
                //                         ?.drill
                //                         ?.drill
                //                         ?.parTimeList?[
                //                     currentShoot - 1] ??
                //                 10;
                //           }
                //           ShootModel shootModel = ShootModel(
                //               parTime: partTime,
                //               shootImagePath: shootImageP,
                //               shootNumber: currentShoot,
                //               shootScore: currentShoot + 3);
                //           listShoots.add(shootModel);
                //           context.read<SessionBloc>().add(
                //                   ShootEvent(
                //                       sessionModel: statesession
                //                           .sessionModel
                //                           .copyWith(
                //                 stageEntity: statesession
                //                     .sessionModel.stageEntity,
                //                 listShots: listShoots,
                //                 shootModel: shootModel,
                //                 isSessionStart: true,
                //                 playBeep: false,
                //                 playedShoots: currentShoot,
                //                 numberOfShots: int.parse(
                //                     statesession
                //                             .sessionModel
                //                             .stageEntity
                //                             ?.drill
                //                             ?.drill
                //                             ?.noOfShots ??
                //                         '0'),
                //                 sessionId: statesession
                //                     .sessionModel.sessionId,
                //                 totalScores: totalScores,
                //               )));
                //           if ('$currentShoot' ==
                //               statesession
                //                   .sessionModel
                //                   .stageEntity
                //                   ?.drill
                //                   ?.drill
                //                   ?.noOfShots) {
                //             // Must do globals empty in order to properly end session
                //
                //             currentShoot = 0;
                //             totalScores = 0;
                //             listShoots = [];
                //             //-------------------------
                //             Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) =>
                //                             const SessionCompletedView()))
                //                 .then((v) {
                //               if (context.mounted) {
                //                 SessionModel model =
                //                     statesession.sessionModel;
                //                 model.isSessionStart = false;
                //                 model.makeScoreVisible = null;
                //                 model.shootModel = null;
                //                 model.listShots = null;
                //                 model.numberOfShots = null;
                //                 model.playedShoots = 0;
                //                 model.totalScores = 0;
                //                 model.totalTime = null;
                //                 context.read<SessionBloc>().add(
                //                     ShootEvent(
                //                         sessionModel: model));
                //               }
                //             });
                //           }
                //         } else {
                //           toast(
                //               'Try again, couldn\'t capture screenshot');
                //         }
                //       },
                //       child: Icon(Icons.podcasts,
                //           color: AppColors.white))
                // */
                //     ],
                //   ),
              ),
            );

          // Padding(
          //   padding: EdgeInsets.fromLTRB(
          //       0, 154.h, 16.w, 40.h),
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: InkWell(
          //       onTap: () async {
          //
          //         // if (state == 'initial') {
          //         //   // resetStreamManager();
          //         //   if (mounted) {
          //         //     setState(() {
          //         //       isBufferInitialized = false;
          //         //       state = 'open_stream';
          //         //       startText =
          //         //       'Detect circles';
          //         //     });
          //         //   }
          //         //   socketHandler.initSocket();
          //         //   final streamInfo = await rtspController.readStreamInfo();
          //         //   print('frame size: ${streamInfo!.width ?? ""} ${streamInfo.height ?? ""}');
          //         //   rtspController.startImageStream(pushFrame);
          //         //   isPause = true;
          //         //
          //         //   if (mounted) {
          //         //     setState(() {
          //         //       print('frame_size_testing:');
          //         //       pipe = 'input';
          //         //       showFrame();
          //         //       fps = streamInfo.fps;
          //         //       isFrameSizeInitialize =
          //         //       true;
          //         //       print('stream fps $fps');
          //         //       print('show frame');
          //         //     });
          //         //   }
          //         // }
          //         // else if (state == 'open_stream') {
          //         //   setState(() {
          //         //     startText = 'Start scoring';
          //         //     state = 'detect_circles';
          //         //   });
          //         //
          //         //   // detectOnly lock
          //         //   detectOnlyLock();
          //         //   writeInt32ToBuffer(
          //         //       detectOnlyBuffer!, 1);
          //         //   detectOnlyUnlock();
          //         //
          //         //   // run();
          //         //   // detectOnly unlock
          //         // }
          //         // else if (state == 'detect_circles') {
          //         //   setState(() {
          //         //     startText = 'Running';
          //         //   });
          //         //   context.read<AppBleDeviceBloc>().add(const StartListening());
          //         //   // Start scoring
          //         //   detectOnlyLock();
          //         //   writeInt32ToBuffer(
          //         //       detectOnlyBuffer!, 0);
          //         //   detectOnlyUnlock();
          //         //   run();
          //         // }
          //       },
          //       child: Container(
          //         alignment: Alignment.center,
          //         decoration: BoxDecoration(
          //             color:
          //             AppColors.kPrimaryColor,
          //             shape: BoxShape.circle),
          //         height: 72.h,
          //         width: 72.h,
          //         child: Text(
          //           'Start',
          //           style: TextStyle(
          //               color: AppColors.white,
          //               fontFamily:
          //               AppFontFamily.regular,
          //               fontSize: 16.h),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          //   ],
          // );
        },
      ),
    );
  }
  Color _colorForStatus(int? status) {
    switch (status) {
      case 1:
        return Colors.green.shade900;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.red;
      default:
        return Colors.transparent; // or Colors.grey with opacity
    }
  }
}

class CropImageWidget extends StatefulWidget {
  /// The image to crop (can be MemoryImage, AssetImage, NetworkImage…)
  final Uint8List image;

  /// Fraction of the _width_ to use for the circle diameter (0.0 - 1.0).
  /// Defaults to 0.8 (i.e. 80% of the available width).
  final double holeFraction;

  const CropImageWidget({
    super.key,
    required this.image,
    this.holeFraction = 0.8,
  });

  @override
  _CropImageWidgetState createState() => _CropImageWidgetState();
}

class _CropImageWidgetState extends State<CropImageWidget> {
  double _scale = 1.0;
  Offset _offset = Offset.zero;
  Offset? _normalizedOffset;
  double? _startingScale;

  // void _onScaleStart(ScaleStartDetails details) {
  //   _startingScale = _scale;
  //   // use localFocalPoint so coordinates are relative to this widget
  //   _normalizedOffset = (details.localFocalPoint - _offset) / _scale;
  // }
  //
  // void _onScaleUpdate(ScaleUpdateDetails details) {
  //   setState(() {
  //     _scale = (_startingScale! * details.scale).clamp(0.5, 5.0);
  //     _offset = details.localFocalPoint - _normalizedOffset! * _scale;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final w = constraints.maxHeight;
      final h = constraints.maxHeight;

      // size of the transparent circle
      final diameter = w * widget.holeFraction;
      final radius = diameter / 2;

      // center of that circle
      final holeCenter = Offset(w / 2, h / 2);

      return ClipRect(
        child: Stack(children: [
          // 1) the pan/zoomable image
          // GestureDetector(
          //   // onScaleStart: _onScaleStart,
          //   // onScaleUpdate: _onScaleUpdate,
          //   child:
            Transform(
              transform: Matrix4.identity()
                ..translate(_offset.dx, _offset.dy)
                ..scale(_scale),
              child: SizedBox(
                width: 1.sh,
                height: 1.sh,
                child: Image.memory(
                  widget.image,
                  gaplessPlayback: true,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text('Error displaying image'),
                    );
                  },
                ),
              ),
            ),
          // ),

          IgnorePointer(
            child: CustomPaint(
              size: Size(w, h),
              painter: _CircleOverlayPainter(
                holeCenter: holeCenter,
                holeRadius: radius,
              ),
            ),
          ),


          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Align the target rings inside the circle" , style: TextStyle(color: AppColors.kRedColor ,fontSize: 18),),
              ),
          ),
        ]),
      );
    });
  }
}

/// Paints a dimmed overlay and cuts out a circle in the center
class _CircleOverlayPainter extends CustomPainter {
  final Offset holeCenter;
  final double holeRadius;

  _CircleOverlayPainter({
    required this.holeCenter,
    required this.holeRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // draw into a layer so clear() actually works
    canvas.saveLayer(Offset.zero & size, Paint());

    // 1) dim entire area
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = Colors.white.withOpacity(0.6),
    );

    // 2) “clear” out the circle
    canvas.drawCircle(
      holeCenter,
      holeRadius,
      Paint()
        ..blendMode = ui.BlendMode.clear
        ..style = PaintingStyle.fill,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _CircleOverlayPainter old) {
    return old.holeCenter != holeCenter || old.holeRadius != holeRadius;
  }
}
