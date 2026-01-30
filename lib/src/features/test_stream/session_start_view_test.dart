import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_usb_camera/flutter_usb_camera.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/features/test_stream/usb_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/services/local_storage_service/local_storage_service.dart';
import '../../core/services/locator/locator.dart';
import '../../core/theme/font/app_fonts.dart';
import '../../core/theme/theme_data/theme_data.dart';
import '../../core/utils/constants.dart';
import '../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../train/connectivity/presentation/view/bluetooth_view.dart';
import '../train/session/data/model/session_model.dart';
import '../train/session/presentation/bloc/session_bloc/session_bloc.dart';
import 'dart:ui' as ui;

import '../train/session/presentation/view/session_start_view_updated.dart';
import '../train/stage/data/local/service/stage_db_helper.dart';
import '../train/stage/data/model/stage_entity.dart';
import '../train/train_view.dart';

class TestSc extends StatefulWidget {
  const TestSc({super.key});

  @override
  State<TestSc> createState() => _TestScState();
}

class _TestScState extends State<TestSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Stream"),

      ),
      body: Center(
        child: TextButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => UsbCameraPage()));

        }, child: Text("Start Stream")),
      ),
    );
  }
}


class UsbCameraPage extends StatefulWidget {
  const UsbCameraPage({super.key});

  @override
  State<UsbCameraPage> createState() => _UsbCameraPageState();
}

class _UsbCameraPageState extends State<UsbCameraPage> {
  // Camera permission status
  String _permissionStatus = "Not requested";

  // Loading state
  bool _isLoading = false;
  bool _isStreamActive = false;

  // Stream for camera frames
  Stream<ui.Image>? _imageStream;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
    UsbCameraManager.initializeCallbacks();

  }

  @override
  void dispose() {
    // Stream will be automatically disposed when widget is disposed
    _stopCameraStream();
    super.dispose();
  }

  /// Requests camera permission and starts the USB camera stream
  Future<void> _requestCameraPermission() async {
    setState(() {
      _isLoading = true;
      _permissionStatus = "Requesting permission...";
    });

    try {
      PermissionStatus status = await Permission.camera.status;

      if (status.isDenied) {
        status = await Permission.camera.request();
      }

      if (status.isGranted) {
        await _startCameraStream();
        setState(() {
          _permissionStatus = "camera_permission_granted";
        });
      } else {
        setState(() {
          _permissionStatus = "Camera Permission Denied ❌";
        });
      }
    } catch (e) {
      setState(() {
        _permissionStatus = "Error requesting permission: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Starts the USB camera stream
  Future<void> _startCameraStream() async {
    try {
      FlutterUsbCamera.startStream(
        fps: 30,
        croppedWidth: 0,
        croppedHeight: 0,
      );

      _imageStream = FlutterUsbCamera.frames()
          .asyncMap<ui.Image?>(_decodeFrame)
          .where((image) => image != null)
          .cast<ui.Image>();

      setState(() {
        _isStreamActive = true;
      });
    } catch (e) {
      debugPrint('Failed to start camera stream: $e');
      setState(() {
        _permissionStatus = "Failed to start camera: $e";
      });
    }
  }

  /// Decodes frame bytes to UI Image
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

  /// Stops the camera stream and cleans up resources
  void _stopCameraStream() {
    UsbCameraManager.dispose();
    _isStreamActive = false;
      _imageStream = null;
  }

  /// Restarts the camera stream
  Future<void> _restartCameraStream() async {
    FlutterUsbCamera.resumePreview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.background(context),
      // appBar: AppBar(
      //   title: const Text(''),
      //   backgroundColor: AppTheme.primary(context),
      //   actions: [
      //     if (_isStreamActive)
      //       IconButton(
      //         icon:  Icon(Icons.refresh , color: AppTheme.textPrimary(context),),
      //         onPressed: _restartCameraStream,
      //         tooltip: 'Restart Camera',
      //       ),
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCameraPreview(),
            ],
          )),
           SizedBox(height: 4.h),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _isStreamActive ? _stopCameraStream : _startCameraStream,
      //   tooltip: _isStreamActive ? 'Stop Camera' : 'Start Camera',
      //   child: Icon(_isStreamActive ? Icons.stop : Icons.play_arrow),
      // ),

    );
  }
  bool _didNavigate = false;

  /// Builds the camera preview widget using StreamBuilder
  Widget _buildCameraPreview() {
    if (!_isStreamActive || _imageStream == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Camera not active...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return StreamBuilder<ui.Image>(
      stream: _imageStream,
      builder: (context, snapshot)  {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  size: 64,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  'Stream Error: ${snapshot.error}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text(
                  'Waiting for camera frames...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }
        if (snapshot.hasData &&
            _permissionStatus == 'camera_permission_granted' &&
            !_didNavigate) {
          _didNavigate = true; // guard against repeat pushes

          // Do non-UI state changes immediately
          // context.read<SessionBloc>().add(
          //   ShootEvent(
          //     sessionModel: SessionModel(
          //       missingShots: 0,
          //       listShots: null,
          //       shootModel: null,
          //       totalTime: null,
          //       sessionCountDown: null,
          //       isSessionStart: false,
          //       isSessionPaused: false,
          //       playedShoots: 0,
          //       totalScores: 0,
          //       sessionId: sessionIdFun(),
          //       stageEntity: initialStageEntity,
          //     ),
          //   ),
          // );

          final des = int.tryParse(
            (initialStageEntity.distance ?? '1 meter').split(' ').first,
          ) ??
              1;

          // Defer the actual navigation until after build
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;

            // Optional: show loading here (do NOT show & close in same frame)
            // BotToast.showLoading();

            Navigator.of(context)
                .pushReplacement(
              MaterialPageRoute(
                builder: (_) =>
                    SessionStartViewUpdated(distance: des, withCable: true),
              ),
            )
                .then((_) {
              if (!mounted) return;
              context.read<AppBleDeviceBloc>().add(const GetConnectedDevice());
              // BotToast.closeAllLoading();
            });
          });


        // Keep showing the waiting UI while we haven't navigated yet
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                'Waiting for camera frames...',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        );
      }
      else{
          return SizedBox();
        }

        // return Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Expanded(
        //       child: RawImage(
        //         image: snapshot.data,
        //         fit: BoxFit.contain,
        //         filterQuality: FilterQuality.high,
        //       ),
        //     ),
        //     TextButton(
        //         style: TextButton.styleFrom(
        //           padding: EdgeInsets.zero,
        //           minimumSize: Size.zero,
        //           fixedSize: Size(0.5.sw, 36.h),
        //           backgroundColor: AppColors.kPrimaryColor,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(6.h)),
        //         ),
        //         onPressed: () async {
        //           if ("camera_permission_granted" == _permissionStatus){
        //             BotToast.showLoading();
        //             StageEntity stageEntity = await StageDbHelper()
        //                 .getStageForUser(
        //                 locator<LocalStorageService>()
        //                     .userIdString);
        //             print("stageEntity_distance =====3");
        //
        //             BotToast.closeAllLoading();
        //             if (context.mounted) {
        //               print("stageEntity_distance =====2");
        //
        //               context.read<SessionBloc>().add(ShootEvent(
        //                 sessionModel: SessionModel(
        //                     missingShots: 0,
        //                     listShots: null,
        //                     shootModel: null,
        //                     totalTime: null,
        //                     sessionCountDown: null,
        //                     isSessionStart: false,
        //                     isSessionPaused: false,
        //                     playedShoots: 0,
        //                     totalScores: 0,
        //                     sessionId: sessionIdFun(),
        //                     stageEntity: stageEntity),
        //               ));
        //               print("stageEntity_distance =====1");
        //
        //               // int des = int.parse(stageEntity.distance??"1");
        //               final des = int.tryParse((stageEntity.distance ?? '1 meter').split(' ').first) ?? 1;
        //               dis_glob = null;
        //               dis_glob = des;
        //               print("stageEntity_distance $des");
        //               Navigator.of(context).pop();
        //
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) =>
        //                           SessionStartViewUpdated(
        //                               distance: des,withCable:true))).then((v) {
        //                 // if (context.mounted) {
        //                 //   final state =
        //                 //       BlocProvider.of<AppBleDeviceBloc>(context)
        //                 //           .state;
        //                 //   if ((state is! Connected) ||
        //                 //       state is! ServicesDiscovered) {
        //                 appBleDeviceBloc
        //                     .add(const GetConnectedDevice());
        //                 //   }
        //                 // }
        //               });
        //             }
        //           }
        //         },
        //         child: Text('Start Session',
        //             style: TextStyle(
        //                 color: AppColors.white,
        //                 fontSize: 14.sp,
        //                 fontFamily: AppFontFamily.bold))),
        //
        //   ],
        // );
      },
    );
  }
}





// class SessionStartViewTest extends StatefulWidget {
//   const SessionStartViewTest({super.key, required this.withCable});
//   final bool withCable;
//   @override
//   State<SessionStartViewTest> createState() => _SessionStartViewTestState();
// }
//
// class _SessionStartViewTestState extends State<SessionStartViewTest> {
//   @override
//   void initState() {
//     super.initState();
//     slRtspStreamingBloc.add( RtspStreamingEvent.started(0,2,widget.withCable));
//     _requestPermission();
//     KeepScreenOn.turnOn();
//   }
//
//   @override
//   void dispose() {
//     slRtspStreamingBloc.add(const RtspStreamingEvent.disposeBloc(true));
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown
//     ]);
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: SystemUiOverlay.values);
//     super.dispose();
//   }
//
//   Future<void> _requestPermission() async {
//     if (await Permission.manageExternalStorage.request().isGranted ||
//         await Permission.storage.request().isGranted) {
//     } else {
//       await Permission.storage.request();
//       await Permission.manageExternalStorage.request();
//     }
//   }
//
//   bool _isPortrait = true;
//
//   void _toggleOrientation() {
//     if (_isPortrait) {
//       // Rotate to landscape
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Rotate back to portrait
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ]);
//     }
//     setState(() => _isPortrait = !_isPortrait);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       appBar: AppBar(
//           title: Text(
//         'RTSP Stream',
//         style: TextStyle(fontSize: 14),
//       )),
//       body: PopScope(
//         canPop: true,
//         child: Row(
//           children: [
//             SizedBox(
//                 height: ScreenUtil().screenHeight,
//                 width: ScreenUtil().screenWidth,
//                 child: FrameStreamingWidget(
//                   streamMode: 0,
//                   distance: 2
//                 )),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         tooltip: 'Rotate Screen',
//         onPressed: _toggleOrientation,
//         child: const Icon(Icons.screen_rotation),
//       ),
//     );
//   }
// }
