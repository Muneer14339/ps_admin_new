// import 'dart:io';
// import 'dart:isolate';
// import 'package:flutter/material.dart';
//
// import 'dart:async';
// import 'dart:ffi' as ffi;
// import 'dart:typed_data';
//
// import 'dart:developer';
//
// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:keep_screen_on/keep_screen_on.dart';
// import 'package:pa_sreens/src/core/helper/helper_methods.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
// import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
// import 'package:pa_sreens/src/core/theme/text_styles/app_text_style.dart';
// import 'package:pa_sreens/src/core/utils/utils.dart';
// import 'package:pa_sreens/src/core/widgets/custom_slider.dart';
// import 'package:pa_sreens/src/core/widgets/custom_switch.dart';
// import 'package:pa_sreens/src/core/widgets/toast.dart';
// import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
// import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/timer_bloc/listning_timer_bloc.dart';
// import 'package:pa_sreens/src/features/train/session/data/model/session_model.dart';
// import 'package:pa_sreens/src/features/train/session/presentation/bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
// import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
// import 'package:pa_sreens/src/features/train/session/presentation/view/session_completed_view.dart';
// import 'package:pa_sreens/src/features/train/session/presentation/widgets/notice_dialoge.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:uuid/uuid.dart';
// import '../../../../../core/services/locator/locator.dart';
// import '../component/fram_streaming_widget.dart';
// import '../component/frams_streaming/native_opencv.dart';
// import '../component/stop_watch.dart';
// import '../widgets/caliberate_dialoge.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:ui' as ui;
//
// int triggredShoot = 0;
import '../../data/model/session_model.dart';

int stateBle_counter = 0;
int totalScores = 0;
List<ShootModel> listShoots = [];
ShootModel shootModel = ShootModel();
bool checkD = false;

//
// class SessionStartView extends StatefulWidget {
//   const SessionStartView({super.key});
//
//   @override
//   State<SessionStartView> createState() => _SessionStartViewState();
// }
//
// class _SessionStartViewState extends State<SessionStartView> {
//   final GlobalKey _repaintBoundaryKey = GlobalKey();
//   Timer? _timer;
//   int currentShootNew = 0;
//
//   ///For_streaming
//   // String _state = 'initial';
//   // String startText = 'Open stream';
//   // String pipe = 'input';
//   // final url = 'rtsp://192.168.42.1/live';
//   // late RTSPController rtspController;
//   // final serverIp = '192.168.42.1';
//   // final serverPort = 7878;
//   // int frameIndex = 0;
//   // int fps = 0;
//   // Completer fpsCompleter = Completer<void>();
//   // bool isFrameSizeInitialize = false;
//   // Completer frameInitializeCompleter = Completer<void>();
//   // DateTime? lastFrameTime;
//   // late int frameWidth;
//   // late int frameHeight;
//   // String tempPath = 'asssddd';
//   // late Directory dir;
//   // var uuid = const Uuid();
//   // int _imageIndex = 0;
//   // int sessionId = 0;
//   // final List<ImageModel> _imageModels = [];
//   // late final CameraSocketHandler socketHandler;
//   // final inputBufferSize = 10 * 1024 * 1024 + 2;
//   // final outputBufferSize = 3 * 1024 * 1024;
//   // final sizeOfInt32 = ffi.sizeOf<ffi.Int32>();
//   // ffi.Pointer<ffi.Uint8>? inputBuffer;
//   // ffi.Pointer<ffi.Uint8>? outputBuffer;
//   // ffi.Pointer<ffi.Uint8>? detectOnlyBuffer;
//   // ValueNotifier<String?> fovOption = ValueNotifier<String?>(null);
//   // ValueNotifier<double> currentSliderValue = ValueNotifier<double>(100);
//   // bool isPause = false;
//
//   // void initS() {
//   //   startText = 'Open stream';
//   //   isBufferInitialized = false;
//   //   isFrameSizeInitialize = false;
//   //   frameIndex = 0;
//   //   fps = 0;
//   //   lastFrameTime = null;
//   //   inputBuffer = calloc<ffi.Uint8>(inputBufferSize);
//   //   outputBuffer = calloc<ffi.Uint8>(outputBufferSize);
//   //   detectOnlyBuffer = calloc<ffi.Uint8>(10 * sizeOfInt32);
//   //   fpsCompleter = Completer<void>();
//   //   frameInitializeCompleter = Completer<void>();
//   //   // Initialize RTSP controller
//   //   socketHandler = CameraSocketHandler(
//   //     cameraIp: serverIp,
//   //     commandPort: serverPort,
//   //     onSessionStarted: _onSessionStarted,
//   //   );
//   //   rtspController = RTSPController(url);
//   //   _requestPermission();
//   //   KeepScreenOn.turnOn();
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     slRtspStreamingBloc.add(const RtspStreamingEvent.started());
//
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//     SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
//     _requestPermission();
//     KeepScreenOn.turnOn();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     // try {
//     //   _state = 'initial';
//     //   startText = 'Open stream';
//     //   releaseD();
//     // } catch (e) {
//     //   print('Error during dispose: $e');
//     // }
//     // slRtspStreamingBloc.add(const RtspStreamingEvent.disposeBloc());
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown
//     ]);
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: SystemUiOverlay.values);
//
//     super.dispose();
//   }
//
//   // void pushFrame(Uint8List frame, int inputWidth, int inputHeight) {
//   //   frameWidth = inputWidth;
//   //   frameHeight = inputHeight;
//   //   if (!isBufferInitialized) {
//   //     inputBuffer = calloc<ffi.Uint8>(inputBufferSize);
//   //     writeInt32ToBuffer(inputBuffer!, -1);
//   //
//   //     outputBuffer = calloc<ffi.Uint8>(outputBufferSize);
//   //     writeInt32ToBuffer(outputBuffer!, -1);
//   //
//   //     detectOnlyBuffer = calloc<ffi.Uint8>(10 * sizeOfInt32);
//   //     if (mounted) {
//   //       setState(() {
//   //         isBufferInitialized = true;
//   //         if (!frameInitializeCompleter.isCompleted) {
//   //           frameInitializeCompleter.complete();
//   //         }
//   //       });
//   //     }
//   //   }
//   //
//   //   inputLock();
//   //   if (mounted) {
//   //     setState(() {
//   //       frameIndex++;
//   //     });
//   //   }
//   //   writeInt32ToBuffer(inputBuffer!, frameIndex);
//   //   writeInt32ToBuffer(inputBuffer! + sizeOfInt32, fps);
//   //   writeInt32ToBuffer(inputBuffer! + 2 * sizeOfInt32, -1);
//   //
//   //   writeInt32ToBuffer(inputBuffer! + 3 * sizeOfInt32, frame.length);
//   //
//   //   writeUint8ListToPointer(inputBuffer! + 4 * sizeOfInt32, frame);
//   //   inputUnlock();
//   //   if (fps > 0 && !fpsCompleter.isCompleted) {
//   //     fpsCompleter.complete();
//   //   }
//   // }
//   //
//   // void writeInt32ToBuffer(ffi.Pointer<ffi.Uint8> buffer, int value) {
//   //   final int32Value = value;
//   //
//   //   buffer[0] = (int32Value & 0xFF);
//   //   buffer[1] = ((int32Value >> 8) & 0xFF);
//   //   buffer[2] = ((int32Value >> 16) & 0xFF);
//   //   buffer[3] = ((int32Value >> 24) & 0xFF);
//   // }
//   //
//   // void writeUint8ListToPointer(ffi.Pointer<ffi.Uint8> pointer, Uint8List list) {
//   //   final pointerView = pointer.asTypedList(list.length);
//   //   pointerView.setAll(0, list);
//   // }
//   //
//   // Future<void> run() async {
//   //   print('====================== Start run()');
//   //
//   //   await fpsCompleter.future;
//   //
//   //   print('====================== fps completed');
//   //
//   //   int platform = -1; // unknown platform
//   //   if (Platform.isAndroid) {
//   //     platform = 0;
//   //   } else if (Platform.isIOS) {
//   //     platform = 1;
//   //   }
//   //
//   //   final port = ReceivePort();
//   //
//   //   final args = ScoreArguments(
//   //     inputBuffer!.address,
//   //     platform,
//   //     fps,
//   //     frameWidth,
//   //     frameHeight,
//   //     outputBuffer!.address,
//   //     detectOnlyBuffer!.address,
//   //     port.sendPort,
//   //     tempPath,
//   //   );
//   //
//   //   Isolate.spawn<ScoreArguments>(
//   //     score,
//   //     args,
//   //     onError: port.sendPort,
//   //     onExit: port.sendPort,
//   //   ).then((isolate) {
//   //     port.listen((message) {
//   //       if (message == 'success') {
//   //         setState(() {
//   //           _state = 'finished';
//   //         });
//   //       }
//   //     });
//   //   });
//   //   print('====================== Called score()');
//   //
//   //   Future<void>.delayed(const Duration(seconds: 2), () {
//   //     setState(() {
//   //       print('====================== Started output listener');
//   //       // _state = 'predict';
//   //       pipe = 'output';
//   //       // showFrame(outputStreamController);
//   //     });
//   //   });
//   // }
//   //
//   // void showFrame() async {
//   //   var prevFrameIndex = -1;
//   //   final streamController = StreamManager();
//   //
//   //   await frameInitializeCompleter.future;
//   //
//   //   while (true) {
//   //     if (_state == 'initial' || _state == 'finished') {
//   //       break;
//   //     }
//   //     outputLock();
//   //
//   //     var uint8ListView = Uint8List(0);
//   //     if (pipe == 'output') {
//   //       uint8ListView = outputBuffer!.asTypedList(outputBufferSize);
//   //     } else {
//   //       uint8ListView = inputBuffer!.asTypedList(outputBufferSize);
//   //     }
//   //
//   //     // Read first 4 bytes as a int32
//   //     final currentFrameIndex =
//   //         uint8ListView.buffer.asInt32List(0, sizeOfInt32)[0];
//   //
//   //     // If there is a new frame has been pushed, read it
//   //     if (currentFrameIndex > 0 && currentFrameIndex > prevFrameIndex) {
//   //       prevFrameIndex = currentFrameIndex;
//   //       // |frame_index|FPS|last_score|num_bytes|frame_bytes|
//   //       final numberOfBytes =
//   //           uint8ListView.buffer.asInt32List(3 * sizeOfInt32, sizeOfInt32)[0];
//   //
//   //       final frameBytes = uint8ListView.sublist(
//   //           4 * sizeOfInt32, 4 * sizeOfInt32 + numberOfBytes);
//   //
//   //       if (pipe == 'output') {
//   //         final lastScore =
//   //             uint8ListView.buffer.asInt32List(2 * sizeOfInt32, sizeOfInt32)[0];
//   //         if (lastScore > 0) {
//   //           String imgPath = getImagePath();
//   //           final imageFile = File(imgPath);
//   //           imageFile.writeAsBytes(frameBytes);
//   //           _imageModels
//   //               .add(ImageModel(lastScore: lastScore, imagePath: imgPath));
//   //
//   //           print('last score: $lastScore');
//   //           // print('last score image path: $imgPath');
//   //           _imageIndex++;
//   //         }
//   //       }
//   //       // Add data to the stream
//   //       streamController.addData(frameBytes);
//   //     }
//   //     outputUnlock();
//   //
//   //     // Simulate some processing time
//   //     await Future.delayed(const Duration(milliseconds: 10));
//   //   }
//   //
//   //   // Close the stream when the queue is empty
//   //   print('Display frame stopped');
//   //   streamController.dispose();
//   // }
//   //
//   // getImagePath() {
//   //   return '${dir.path}/${uuid.v4()}$sessionId$_imageIndex.png';
//   // }
//   //
//
//   Future<void> _requestPermission() async {
//     if (await Permission.manageExternalStorage.request().isGranted ||
//         await Permission.storage.request().isGranted) {
//       dir = await getApplicationDocumentsDirectory();
//       uuid = const Uuid();
//       // tempPath = '${dir.path}/${uuid.v4()}${sessionId}video.mp4';
//       // print("tempPath");
//       // print(tempPath);
//     } else {
//       await Permission.storage.request();
//       await Permission.manageExternalStorage.request();
//       // // Permission is not granted
//       // // Handle permission denied scenario
//       // if (mounted) {
//       //   showDialog(
//       //     context: context,
//       //     builder: (context) => AlertDialog(
//       //       title: const Text('Permission Denied'),
//       //       content:
//       //           const Text('Please grant storage permission to use this app.'),
//       //       actions: [
//       //         TextButton(
//       //           onPressed: () => Navigator.pop(context),
//       //           child: const Text('OK'),
//       //         ),
//       //       ],
//       //     ),
//       //   );
//       // }
//     }
//   }
//
//   // void _onSessionStarted(int token) {
//   //   socketHandler.resetLiveView(fovOption.value ?? 'wide');
//   // }
//   //
//   // void resetStreamManager() {
//   //   StreamManager().dispose();
//   //   StreamManager().ensureStreamController();
//   //   print('Stream manager reset successfully.');
//   // }
//   //
//   // void disposeBuffers() {
//   //   try {
//   //     print('Cleaning up resources...');
//   //     rtspController.stop(); // Stop the RTSP stream
//   //     StreamManager().dispose();
//   //     StreamManager().ensureStreamController();
//   //     // Free allocated buffers
//   //     if (inputBuffer != null) {
//   //       calloc.free(inputBuffer!);
//   //       inputBuffer = null;
//   //     }
//   //     if (outputBuffer != null) {
//   //       calloc.free(outputBuffer!);
//   //       outputBuffer = null;
//   //     }
//   //     if (detectOnlyBuffer != null) {
//   //       calloc.free(detectOnlyBuffer!);
//   //       detectOnlyBuffer = null;
//   //     }
//   //
//   //     // Reset state variables
//   //     isBufferInitialized = false;
//   //     fpsCompleter = Completer<void>();
//   //     frameInitializeCompleter = Completer<void>();
//   //     frameIndex = 0;
//   //     fps = 0;
//   //     isFrameSizeInitialize = false;
//   //     lastFrameTime = null;
//   //   } catch (e) {
//   //     print('Error during cleanup: $e');
//   //   }
//   // }
//   // void releaseD() {
//   //   disposeBuffers();
//   //   if (mounted) {
//   //     setState(() {
//   //       frameIndex = 0;
//   //       fps = 0;
//   //       isFrameSizeInitialize = false;
//   //       isBufferInitialized = false;
//   //       lastFrameTime = null;
//   //       fpsCompleter = Completer<void>();
//   //       frameInitializeCompleter = Completer<void>();
//   //       startText = 'Open stream';
//   //       // final outputStreamController = StreamController<Uint8List>();
//   //       pipe = 'input';
//   //       _state = 'initial';
//   //     });
//   //     print('calling free');
//   //   }
//   // }
//
//   late Directory dir;
//   var uuid = const Uuid();
//
//   getImagePath(int? sessionId) {
//     return '${dir.path}/${uuid.v4()}$sessionId$currentShootNew.png';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.sliderDotsColor,
//       body: BlocBuilder<SessionBloc, SessionState>(
//         builder: (context, statesession) {
//           if (statesession is ShootState) {
//             return PopScope(
//               canPop: statesession.sessionModel.isSessionStart != true,
//               child: Stack(children: [
//                 Row(
//                   children: [
//                     const FrameStreamingWidget(),
//                     Stack(
//                       children: [
//                         Container(
//                           width: ScreenUtil().screenWidth / 2.5,
//                           height: ScreenUtil().screenHeight,
//                           color: AppColors.blackTextColor.withOpacity(0.56),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.fromLTRB(7.w, 20.h, 7.w, 0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         if (statesession.sessionModel.isSessionStart != true) {
//                                           if (slRtspStreamingBloc.isStreamStarted){
//                                             slRtspStreamingBloc.add(
//                                                 const RtspStreamingEvent
//                                                     .disposeBloc());
//                                           }else{
//                                             Navigator.pop(context);
//                                           }
//                                         }
//
//                                         // else if (statesession.sessionModel
//                                         //         .isSessionStart !=
//                                         //     true) {
//                                         //   context.read<SessionBloc>().add(
//                                         //       ShootEvent(
//                                         //           sessionModel: statesession
//                                         //               .sessionModel
//                                         //               .copyWith(
//                                         //                   isSessionStart:
//                                         //                       false)));
//                                         // }
//                                       },
//                                       child: Icon(
//                                         Icons.arrow_back_ios_new_rounded,
//                                         color: AppColors.white,
//                                         size: 20.h,
//                                       ),
//                                     ),
//                                     Image.asset('assets/icons/calibration.png',
//                                         color: AppColors.kPrimaryColor,
//                                         height: 20.h),
//                                     CustomSwitch(
//                                       value: false,
//                                       border: Border.all(
//                                           color: AppColors.white, width: 0.5),
//                                       onChanged: (value) {},
//                                       disableColor: AppColors.greyTextColor,
//                                       enableColor: AppColors.kPrimaryColor,
//                                       height: 20.h,
//                                       switchHeight: 19.h,
//                                       radius: 100.h,
//                                     ),
//                                     Image.asset('assets/icons/Battery.png',
//                                         height: 20.h),
//                                     InkWell(
//                                         onTap: () => '',
//                                         child: Image.asset(
//                                           'assets/icons/session_setting.png',
//                                           height: 20.h,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               Visibility(
//                                 visible:
//                                     statesession.sessionModel.isSessionStart !=
//                                         true,
//                                 child: Expanded(
//                                   child: Padding(
//                                     padding: EdgeInsets.fromLTRB(
//                                         0, 154.h, 16.w, 40.h),
//                                     child: Align(
//                                       alignment: Alignment.bottomRight,
//                                       child: BlocBuilder<RtspStreamingBloc,
//                                           RtspStreamingState>(
//                                         builder: (context, state) {
//                                           return InkWell(
//                                             onTap: () async {
//                                               if (state.streamState ==
//                                                   'open_stream') {
//                                                 slRtspStreamingBloc.add(
//                                                     const RtspStreamingEvent
//                                                         .startFrameProcessing());
//                                                 toast(
//                                                     'Mode: ${statesession.sessionModel.stageEntity?.mode?.name}');
//                                                 log(' isSessionStart =-=-=-= ${statesession.sessionModel.isSessionStart}');
//                                                 log(' isSessionPaused =-=-=-= ${statesession.sessionModel.isSessionPaused}');
//                                                 modeHandler(statesession
//                                                     .sessionModel
//                                                     .copyWith(
//                                                         makeScoreVisible:
//                                                             true));
//
//                                                 context
//                                                     .read<AppBleDeviceBloc>()
//                                                     .add(
//                                                         const StartListening());
//                                               } else {
//                                                 slRtspStreamingBloc.add(
//                                                     const RtspStreamingEvent
//                                                         .startStreaming());
//                                               }
//                                             },
//                                             child: Container(
//                                               alignment: Alignment.center,
//                                               decoration: BoxDecoration(
//                                                   color:
//                                                       AppColors.kPrimaryColor,
//                                                   shape: BoxShape.circle),
//                                               height: 72.h,
//                                               width: 72.h,
//                                               child: Text(
//                                                 'Start',
//                                                 style: TextStyle(
//                                                     color: AppColors.white,
//                                                     fontFamily:
//                                                         AppFontFamily.regular,
//                                                     fontSize: 16.h),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Visibility(
//                                 visible:
//                                     statesession.sessionModel.isSessionStart !=
//                                         true,
//                                 child: Padding(
//                                   padding:
//                                       EdgeInsets.fromLTRB(2.w, 0, 2.w, 50.h),
//                                   child: const CustomSeekbar(),
//                                 ),
//                               ),
//                               Visibility(
//                                 visible: statesession
//                                         .sessionModel.makeScoreVisible ==
//                                     true,
//                                 child: sessionScoreView(),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                             top: 100.h, right: 7.w, child: NoticeDialoge()),
//                         Positioned(
//                             top: 100.h, right: 7.w, child: CalibirateDialoge()),
//                       ],
//                     )
//                   ],
//                 )
//               ]),
//               // child: BlocConsumer<AppBleDeviceBloc, AppBleDeviceState>(
//               //     listener: (context, stateBle) async {
//               //   if (stateBle is DeviceIsDisconnected) {
//               //     // Must do globals empty in order to properly end session
//               //     triggredShoot = 0;
//               //     currentShoot = 0;
//               //     totalScores = 0;
//               //     listShoots = [];
//               //     //==============
//               //     SessionModel model = statesession.sessionModel;
//               //     model.isSessionStart = false;
//               //     model.makeScoreVisible = null;
//               //     model.shootModel = null;
//               //     model.listShots = null;
//               //     model.numberOfShots = null;
//               //     model.playedShoots = 0;
//               //     model.totalScores = 0;
//               //     model.totalTime = null;
//               //     model.isSessionPaused = false;
//               //     context
//               //         .read<SessionBloc>()
//               //         .add(ShootEvent(sessionModel: model));
//               //
//               //     if (Navigator.canPop(context)) {
//               //       Toast.show(context, message: 'BLE device is disconnected');
//               //       Navigator.pop(context);
//               //     } else {
//               //       log(' = = = = = = = = = = = = Device Disconnected Else');
//               //     }
//               //   }
//               //   else if (stateBle is CounterUpdated) {
//               //     //   stateBle_counter =stateBle.counter;
//               //     // }
//               //     if (stateBle.counter != 0) {
//               //       triggredShoot = triggredShoot + 1;
//               //     }
//               //     if (triggredShoot > currentShoot) {
//               //       log('-=-=-=-=-=-=-=-=-=-=-=- stateBle_counter===${stateBle.counter}');
//               //       currentShoot = stateBle.counter;
//               //       if (statesession.sessionModel.isSessionStart == true &&
//               //           statesession.sessionModel.isSessionPaused == false &&
//               //           statesession.sessionModel.playBeep == false) {
//               //         BotToast.showLoading();
//               //         String shootImageP = 'asdas';
//               //         BotToast.closeAllLoading();
//               //         if (shootImageP != '' && context.mounted) {
//               //           // currentShoot = currentShoot + 1;
//               //           totalScores = totalScores + currentShoot + 3;
//               //           int partTime = 10;
//               //           if (statesession.sessionModel.stageEntity?.drill?.drill
//               //                   ?.partTimeType ==
//               //               'for-each') {
//               //             partTime = statesession
//               //                     .sessionModel
//               //                     .stageEntity
//               //                     ?.drill
//               //                     ?.drill
//               //                     ?.parTimeList?[currentShoot - 1] ??
//               //                 10;
//               //           }
//               //
//               //           context.read<SessionBloc>().add(ShootEvent(
//               //                   sessionModel:
//               //                       statesession.sessionModel.copyWith(
//               //                 stageEntity:
//               //                     statesession.sessionModel.stageEntity,
//               //                 listShots: listShoots,
//               //                 shootModel: shootModel,
//               //                 isSessionStart: true,
//               //                 playBeep: false,
//               //                 playedShoots: currentShoot,
//               //                 numberOfShots: int.parse(statesession.sessionModel
//               //                         .stageEntity?.drill?.drill?.noOfShots ??
//               //                     '0'),
//               //                 sessionId: statesession.sessionModel.sessionId,
//               //                 totalScores: totalScores,
//               //               )));
//               //
//               //           if ('$currentShoot' ==
//               //               statesession.sessionModel.stageEntity?.drill?.drill
//               //                   ?.noOfShots) {
//               //             context
//               //                 .read<AppBleDeviceBloc>()
//               //                 .add(const StopListening());
//               //
//               //             triggredShoot = 0;
//               //             currentShoot = 0;
//               //             totalScores = 0;
//               //             listShoots = [];
//               //
//               //             slRtspStreamingBloc
//               //                 .add(const RtspStreamingEvent.disposeBloc());
//               //
//               //             Navigator.push(
//               //                 context,
//               //                 MaterialPageRoute(
//               //                     builder: (context) =>
//               //                         const SessionCompletedView())).then((v) {
//               //               if (context.mounted) {
//               //                 SessionModel model = statesession.sessionModel;
//               //                 model.isSessionStart = false;
//               //                 model.makeScoreVisible = null;
//               //                 model.shootModel = null;
//               //                 model.listShots = null;
//               //                 model.numberOfShots = null;
//               //                 model.playedShoots = 0;
//               //                 model.totalScores = 0;
//               //                 model.totalTime = null;
//               //                 context
//               //                     .read<SessionBloc>()
//               //                     .add(ShootEvent(sessionModel: model));
//               //               }
//               //             });
//               //             // }
//               //           }
//               //         } else {
//               //           toast('Try again, couldn\'t capture screenshot');
//               //         }
//               //       }
//               //     }
//               //   }
//               // }, builder: (context, st) {
//               //   // return const Expanded(child: FrameStreamingWidget());
//               //   return ;
//               // }),
//             );
//           } else if (statesession is CountDownState) {
//             return Center(
//               child: Text(
//                 '${statesession.sessionModel.sessionCountDown ?? 0}',
//                 style:
//                     TextStyle(fontFamily: AppFontFamily.bold, fontSize: 26.sp),
//               ),
//             );
//           } else {
//             return const SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }
//
//   void modeHandler(SessionModel model) {
//     int modeId = model.stageEntity?.mode?.id ?? 1;
//     log('mode id is $modeId');
//     if (modeId == 1) {
//       // sessionModel.stageEntity = stageEn;
//       model.playBeep = true;
//       model.isSessionStart = true;
//       context.read<SessionBloc>().add(ShootEvent(sessionModel: model));
//     } else if (modeId == 2) {
//       int randomMode = getRandomValue();
//       context.read<SessionBloc>().add(CountDownEvent(
//           sessionModel: model.copyWith(sessionCountDown: randomMode)));
//       startTimer(randomMode, model);
//     } else if (modeId == 3) {
//       int randomMode =
//           miliSecondsToSecs(model.stageEntity?.mode?.seconds ?? 100);
//
//       context.read<SessionBloc>().add(CountDownEvent(
//           sessionModel: model.copyWith(sessionCountDown: randomMode)));
//       startTimer(randomMode, model);
//     } else if (modeId == 4) {
//       context.read<SessionBloc>().add(ShootEvent(
//           sessionModel: model.copyWith(playBeep: true, isSessionStart: true)));
//     } else if (modeId == 5) {
//       context.read<SessionBloc>().add(ShootEvent(
//           sessionModel: model.copyWith(playBeep: true, isSessionStart: true)));
//     } else if (modeId == 6) {
//       context.read<SessionBloc>().add(ShootEvent(
//           sessionModel: model.copyWith(playBeep: true, isSessionStart: true)));
//     } else {}
//   }
//
//   void startTimer(int count, SessionModel model) {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (count > 0) {
//         count = count - 1;
//         context.read<SessionBloc>().add(CountDownEvent(
//             sessionModel: model.copyWith(sessionCountDown: count)));
//       } else {
//         _timer?.cancel();
//         context.read<SessionBloc>().add(ShootEvent(
//             sessionModel: model.copyWith(
//                 playBeep: true, isSessionStart: true, isSessionPaused: false)));
//       }
//     });
//   }
//
//   Future<String> _captureScreenshot(String sessionID) async {
//     try {
//       RenderRepaintBoundary boundary = _repaintBoundaryKey.currentContext
//           ?.findRenderObject() as RenderRepaintBoundary;
//       ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//
//       ByteData? byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);
//       if (byteData == null) return '';
//
//       Uint8List pngBytes = byteData.buffer.asUint8List();
//
//       final directory = await getApplicationDocumentsDirectory();
//       final file = File('${directory.path}/$sessionID.png');
//       await file.writeAsBytes(pngBytes);
//
//       print('Screenshot saved to ${file.path}');
//       return file.path;
//     } catch (e) {
//       print("Error capturing screenshot: $e");
//       return '';
//     }
//   }
//
//   sessionScoreView() {
//     return BlocBuilder<SessionBloc, SessionState>(
//       // listener: (context, state) {
//       //   if (state is ShootState) {
//       //     sessionModel = state.sessionModel;
//       //   }
//       // },
//       builder: (context, state) {
//         if (state is ShootState) {
//           // sessionId = state.sessionModel.sessionId ?? 1;
//           return Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
//             child: Column(
//               children: [
//                 // Row(
//                 //   crossAxisAlignment: CrossAxisAlignment.start,
//                 //   // mainAxisAlignment: MainAxisAlignment.start,
//                 //   children: [
//                 //     // Expanded(
//                 //     //   child: Column(
//                 //     //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     //     children: [
//                 //     //       Align(
//                 //     //           alignment: Alignment.topCenter,
//                 //     //           child: Text(
//                 //     //             'Session Score',
//                 //     //             style: TextStyle(
//                 //     //                 color: AppColors.white,
//                 //     //                 fontFamily: AppFontFamily.regular,
//                 //     //                 fontSize: 20.h),
//                 //     //           )),
//                 //     //       SizedBox(height: 12.h),
//                 //     //       if (state.sessionModel.isSessionStart == true)
//                 //     //         Text('Session ID: ${state.sessionModel.sessionId}',
//                 //     //             style: TextStyle(
//                 //     //                 color: AppColors.white,
//                 //     //                 fontFamily: AppFontFamily.regular,
//                 //     //                 fontSize: 15.h)),
//                 //     //       Padding(
//                 //     //         padding: EdgeInsets.symmetric(vertical: 12.h),
//                 //     //         child: SizedBox(
//                 //     //           height: 145.h,
//                 //     //           child: SingleChildScrollView(
//                 //     //             scrollDirection: Axis.vertical,
//                 //     //             child: Column(
//                 //     //               children: [
//                 //     //                 if (state.sessionModel.isSessionStart == true)
//                 //     //                   Row(
//                 //     //                     mainAxisAlignment:
//                 //     //                         MainAxisAlignment.spaceBetween,
//                 //     //                     children: [
//                 //     //                       Text('Shoot',
//                 //     //                           style: TextStyle(
//                 //     //                               color: AppColors.white,
//                 //     //                               fontFamily: AppFontFamily.regular,
//                 //     //                               fontSize: 15.h)),
//                 //     //                       Text(
//                 //     //                           // '${state.sessionModel.listShots?.last.shootNumber ?? '0'}',
//                 //     //                           state.sessionModel.listShots != null
//                 //     //                               ? '${state.sessionModel.listShots!.length > 0 ? state.sessionModel.listShots?.last.shootNumber ?? '0' : '0'}'
//                 //     //                               : '0',
//                 //     //                           style: TextStyle(
//                 //     //                               color: AppColors.white,
//                 //     //                               fontFamily: AppFontFamily.regular,
//                 //     //                               fontSize: 15.h))
//                 //     //                     ],
//                 //     //                   ),
//                 //     //                 if (state.sessionModel.isSessionStart == true)
//                 //     //                   Row(
//                 //     //                     mainAxisAlignment:
//                 //     //                         MainAxisAlignment.spaceBetween,
//                 //     //                     children: [
//                 //     //                       Text(
//                 //     //                         'Score',
//                 //     //                         style: TextStyle(
//                 //     //                             color: AppColors.white,
//                 //     //                             fontFamily: AppFontFamily.regular,
//                 //     //                             fontSize: 15.h),
//                 //     //                       ),
//                 //     //                       Text(
//                 //     //                         // '${state.sessionModel.listShots?.last.shootScore ?? '0'}',
//                 //     //                         state.sessionModel.listShots != null
//                 //     //                             ? '${state.sessionModel.listShots!.length > 0 ? state.sessionModel.listShots?.last.shootScore ?? '0' : '0'}'
//                 //     //                             : '0',
//                 //     //                         style: TextStyle(
//                 //     //                             color: AppColors.white,
//                 //     //                             fontFamily: AppFontFamily.regular,
//                 //     //                             fontSize: 15.h),
//                 //     //                       )
//                 //     //                     ],
//                 //     //                   ),
//                 //     //                 SizedBox(
//                 //     //                   height: 8.h,
//                 //     //                 ),
//                 //     //                 if (state.sessionModel.isSessionStart == true)
//                 //     //                   StopwatchApp(
//                 //     //                     sessionModel: state.sessionModel,
//                 //     //                     startNow:
//                 //     //                         state.sessionModel.isSessionPaused ==
//                 //     //                             false,
//                 //     //                     countDownTime: state.sessionModel
//                 //     //                                 .stageEntity?.mode?.id ==
//                 //     //                             4
//                 //     //                         ? '00:${miliSecondsToSecs(state.sessionModel.stageEntity?.mode?.seconds ?? 100)}'
//                 //     //                         : null,
//                 //     //                     isCountdown: state.sessionModel.stageEntity
//                 //     //                             ?.mode?.id ==
//                 //     //                         4,
//                 //     //                     beepStopedCallback: (p0) {
//                 //     //                       context.read<SessionBloc>().add(
//                 //     //                           ShootEvent(
//                 //     //                               sessionModel: state.sessionModel
//                 //     //                                   .copyWith(playBeep: false)));
//                 //     //                       // context
//                 //     //                       //     .read<AppBleDeviceBloc>()
//                 //     //                       //     .add(const StartListening());
//                 //     //                     },
//                 //     //                     callBackCallback: (p0) {
//                 //     //                       print('callBackCallback=====$p0');
//                 //     //                       SessionModel model = state.sessionModel;
//                 //     //                       if (model.listShots != null &&
//                 //     //                           model.listShots!.length > 0) {
//                 //     //                         model.listShots?.last.splitTime = p0;
//                 //     //                       }
//                 //     //                       if ('${model.shootModel?.shootNumber}' ==
//                 //     //                           model.stageEntity?.drill?.drill
//                 //     //                               ?.noOfShots) {
//                 //     //                         context.read<SessionBloc>().add(
//                 //     //                             ShootEvent(
//                 //     //                                 sessionModel: model.copyWith(
//                 //     //                                     isSessionStart: false)));
//                 //     //                       }
//                 //     //                     },
//                 //     //                     callBackContinuous: (p0) {
//                 //     //                       //This is for ending session automatically if timer ends with no shots
//                 //     //                       if (p0 ==
//                 //     //                               '0' &&
//                 //     //                           state.sessionModel.stageEntity?.mode
//                 //     //                                   ?.id ==
//                 //     //                               4 &&
//                 //     //                           state
//                 //     //                                   .sessionModel.playedShoots !=
//                 //     //                               0 &&
//                 //     //                           state
//                 //     //                                   .sessionModel.isSessionStart ==
//                 //     //                               true) {
//                 //     //                         // Must do globals empty in order to properly end session
//                 //     //                         stateBle_counter = 0;
//                 //     //                         totalScores = 0;
//                 //     //                         listShoots = [];
//                 //     //                         // SessionModel model = state.sessionModel;
//                 //     //                         // model.isSessionStart = false;
//                 //     //                         context.read<SessionBloc>().add(
//                 //     //                             ShootEvent(
//                 //     //                                 sessionModel: state.sessionModel
//                 //     //                                     .copyWith(
//                 //     //                                         isSessionStart:
//                 //     //                                             false)));
//                 //     //                         WidgetsBinding.instance
//                 //     //                             .addPostFrameCallback((f) {
//                 //     //                           slRtspStreamingBloc.add(
//                 //     //                               const RtspStreamingEvent
//                 //     //                                   .disposeBloc());
//                 //     //
//                 //     //                           Navigator.push(
//                 //     //                                   context,
//                 //     //                                   MaterialPageRoute(
//                 //     //                                       builder: (_) =>
//                 //     //                                           const SessionCompletedView()))
//                 //     //                               .then((v) {
//                 //     //                             if (context.mounted) {
//                 //     //                               SessionModel model =
//                 //     //                                   state.sessionModel;
//                 //     //                               model.isSessionStart = false;
//                 //     //                               model.makeScoreVisible = null;
//                 //     //                               model.shootModel = null;
//                 //     //                               model.listShots = null;
//                 //     //                               model.numberOfShots = null;
//                 //     //                               model.playedShoots = 0;
//                 //     //                               model.totalScores = 0;
//                 //     //                               model.totalTime = null;
//                 //     //                               context.read<SessionBloc>().add(
//                 //     //                                   ShootEvent(
//                 //     //                                       sessionModel: model));
//                 //     //                             } else {
//                 //     //                               toast(null);
//                 //     //                             }
//                 //     //                           });
//                 //     //                         });
//                 //     //                       } else if (p0 ==
//                 //     //                               '0' &&
//                 //     //                           state.sessionModel.stageEntity?.mode
//                 //     //                                   ?.id ==
//                 //     //                               4 &&
//                 //     //                           state.sessionModel.isSessionStart ==
//                 //     //                               true) {
//                 //     //                         state.sessionModel.makeScoreVisible =
//                 //     //                             null;
//                 //     //                         context.read<SessionBloc>().add(
//                 //     //                             ShootEvent(
//                 //     //                                 sessionModel: state.sessionModel
//                 //     //                                     .copyWith(
//                 //     //                                         isSessionStart:
//                 //     //                                             false)));
//                 //     //                       }
//                 //     //                     },
//                 //     //                     child: state.sessionModel.isSessionPaused ==
//                 //     //                             false ?
//                 //     //                         MultiBlocListener(
//                 //     //                             listeners: [
//                 //     //                               /// Listening to AppBleDeviceBloc
//                 //     //                               BlocListener<AppBleDeviceBloc,
//                 //     //                                   AppBleDeviceState>(
//                 //     //                                 listener:
//                 //     //                                     (context, stateBle) async {
//                 //     //                                   if (stateBle
//                 //     //                                       is DeviceIsDisconnected) {
//                 //     //                                     /// Reset Global Variables
//                 //     //                                     stateBle_counter = 0;
//                 //     //                                     totalScores = 0;
//                 //     //                                     listShoots = [];
//                 //     //
//                 //     //                                     /// Reset Session Model
//                 //     //                                     SessionModel model = state
//                 //     //                                         .sessionModel
//                 //     //                                         .copyWith(
//                 //     //                                       isSessionStart: false,
//                 //     //                                       makeScoreVisible: null,
//                 //     //                                       shootModel: null,
//                 //     //                                       listShots: null,
//                 //     //                                       numberOfShots: null,
//                 //     //                                       playedShoots: 0,
//                 //     //                                       totalScores: 0,
//                 //     //                                       totalTime: null,
//                 //     //                                       isSessionPaused: false,
//                 //     //                                     );
//                 //     //
//                 //     //                                     /// Dispatch Reset Event
//                 //     //                                     context
//                 //     //                                         .read<SessionBloc>()
//                 //     //                                         .add(ShootEvent(
//                 //     //                                             sessionModel:
//                 //     //                                                 model));
//                 //     //
//                 //     //                                     /// Show Toast & Navigate if Possible
//                 //     //                                     if (Navigator.canPop(
//                 //     //                                         context)) {
//                 //     //                                       Toast.show(context,
//                 //     //                                           message:
//                 //     //                                               'BLE device is disconnected');
//                 //     //                                       Navigator.pop(context);
//                 //     //                                     } else {
//                 //     //                                       log('Device Disconnected Else Case');
//                 //     //                                     }
//                 //     //                                   } else if (stateBle
//                 //     //                                       is CounterUpdated) {
//                 //     //                                     print(
//                 //     //                                         '===== Counter Updated: ${stateBle.counter}');
//                 //     //                                     stateBle_counter =
//                 //     //                                         stateBle.counter;
//                 //     //                                   }
//                 //     //                                 },
//                 //     //                               ),
//                 //     //
//                 //     //                               /// Listening to ListningTimerBloc
//                 //     //                               BlocListener<ListningTimerBloc,
//                 //     //                                   ListningTimerState>(
//                 //     //                                 listener:
//                 //     //                                     (context, stateTimer) {
//                 //     //                                   if (stateTimer
//                 //     //                                       is OnShotDetected) {
//                 //     //                                     print(
//                 //     //                                         "===== Checking Counter: $stateBle_counter");
//                 //     //                                     currentShootNew =
//                 //     //                                         stateBle_counter;
//                 //     //
//                 //     //                                     if (state.sessionModel
//                 //     //                                                 .isSessionStart ==
//                 //     //                                             true &&
//                 //     //                                         state.sessionModel
//                 //     //                                                 .isSessionPaused ==
//                 //     //                                             false &&
//                 //     //                                         state.sessionModel
//                 //     //                                                 .playBeep ==
//                 //     //                                             false) {
//                 //     //                                       /// Show Loading Indicator
//                 //     //                                       BotToast.showLoading();
//                 //     //                                       BotToast
//                 //     //                                           .closeAllLoading();
//                 //     //
//                 //     //                                       if (context.mounted) {
//                 //     //                                         /// Dispatch Updated Session State
//                 //     //                                         context
//                 //     //                                             .read<SessionBloc>()
//                 //     //                                             .add(ShootEvent(
//                 //     //                                               sessionModel: state
//                 //     //                                                   .sessionModel
//                 //     //                                                   .copyWith(
//                 //     //                                                 stageEntity: state
//                 //     //                                                     .sessionModel
//                 //     //                                                     .stageEntity,
//                 //     //                                                 listShots:
//                 //     //                                                     listShoots,
//                 //     //                                                 shootModel:
//                 //     //                                                     shootModel,
//                 //     //                                                 isSessionStart:
//                 //     //                                                     true,
//                 //     //                                                 playBeep: false,
//                 //     //                                                 playedShoots:
//                 //     //                                                     stateBle_counter,
//                 //     //                                                 numberOfShots: int.parse(state
//                 //     //                                                         .sessionModel
//                 //     //                                                         .stageEntity
//                 //     //                                                         ?.drill
//                 //     //                                                         ?.drill
//                 //     //                                                         ?.noOfShots ??
//                 //     //                                                     '0'),
//                 //     //                                                 sessionId: state
//                 //     //                                                     .sessionModel
//                 //     //                                                     .sessionId,
//                 //     //                                                 totalScores:
//                 //     //                                                     totalScores,
//                 //     //                                               ),
//                 //     //                                             ));
//                 //     //
//                 //     //                                         /// Check if Session is Completed
//                 //     //                                         if ('$stateBle_counter' ==
//                 //     //                                             state
//                 //     //                                                 .sessionModel
//                 //     //                                                 .stageEntity
//                 //     //                                                 ?.drill
//                 //     //                                                 ?.drill
//                 //     //                                                 ?.noOfShots) {
//                 //     //                                           context
//                 //     //                                               .read<
//                 //     //                                                   AppBleDeviceBloc>()
//                 //     //                                               .add(
//                 //     //                                                   const StopListening());
//                 //     //
//                 //     //                                           /// Reset Global Variables
//                 //     //                                           stateBle_counter = 0;
//                 //     //                                           totalScores = 0;
//                 //     //                                           listShoots = [];
//                 //     //
//                 //     //                                           /// Dispose of RTSP Streaming
//                 //     //                                           slRtspStreamingBloc.add(
//                 //     //                                               const RtspStreamingEvent
//                 //     //                                                   .disposeBloc());
//                 //     //
//                 //     //                                           /// Navigate to Session Completed View
//                 //     //                                           Navigator.push(
//                 //     //                                             context,
//                 //     //                                             MaterialPageRoute(
//                 //     //                                               builder: (context) =>
//                 //     //                                                   const SessionCompletedView(),
//                 //     //                                             ),
//                 //     //                                           ).then((_) {
//                 //     //                                             if (context
//                 //     //                                                 .mounted) {
//                 //     //                                               SessionModel
//                 //     //                                                   model = state
//                 //     //                                                       .sessionModel
//                 //     //                                                       .copyWith(
//                 //     //                                                 isSessionStart:
//                 //     //                                                     false,
//                 //     //                                                 makeScoreVisible:
//                 //     //                                                     null,
//                 //     //                                                 shootModel:
//                 //     //                                                     null,
//                 //     //                                                 listShots: null,
//                 //     //                                                 numberOfShots:
//                 //     //                                                     null,
//                 //     //                                                 playedShoots: 0,
//                 //     //                                                 totalScores: 0,
//                 //     //                                                 totalTime: null,
//                 //     //                                               );
//                 //     //                                               context
//                 //     //                                                   .read<
//                 //     //                                                       SessionBloc>()
//                 //     //                                                   .add(ShootEvent(
//                 //     //                                                       sessionModel:
//                 //     //                                                           model));
//                 //     //                                             }
//                 //     //                                           });
//                 //     //                                         }
//                 //     //
//                 //     //                                         listeningTimerBloc.add(
//                 //     //                                             const ListningTimerEvent
//                 //     //                                                 .stopTimer());
//                 //     //                                       } else {
//                 //     //                                         toast(
//                 //     //                                             "Try again, couldn't capture screenshot");
//                 //     //                                       }
//                 //     //                                     }
//                 //     //                                   }
//                 //     //
//                 //     //                                   if (stateTimer
//                 //     //                                       is TimerRunning) {
//                 //     //                                     if (stateTimer
//                 //     //                                             .secondsLeft ==
//                 //     //                                         0) {
//                 //     //                                       String imgPath =
//                 //     //                                           getImagePath(state
//                 //     //                                               .sessionModel
//                 //     //                                               .sessionId);
//                 //     //                                       shootModel = ShootModel(
//                 //     //                                         parTime: 0,
//                 //     //                                         shootImagePath: imgPath,
//                 //     //                                         shootNumber:
//                 //     //                                             stateBle_counter,
//                 //     //                                         shootScore: 0,
//                 //     //                                       );
//                 //     //
//                 //     //                                       listShoots
//                 //     //                                           .add(shootModel);
//                 //     //                                       listeningTimerBloc.add(
//                 //     //                                           const ListningTimerEvent
//                 //     //                                               .onShotDetectedEvent());
//                 //     //                                     }
//                 //     //                                   }
//                 //     //                                 },
//                 //     //                               ),
//                 //     //                             ],
//                 //     //                             child: BlocBuilder<
//                 //     //                                 ListningTimerBloc,
//                 //     //                                 ListningTimerState>(
//                 //     //                               builder: (context, state) {
//                 //     //                                 return state.when(
//                 //     //                                   initial: () => Text(
//                 //     //                                     "Ready for Shot...",
//                 //     //                                     style: Theme.of(context)
//                 //     //                                         .textTheme
//                 //     //                                         .titleSmall!
//                 //     //                                         .copyWith(
//                 //     //                                             color: AppColors
//                 //     //                                                 .white),
//                 //     //                                   ),
//                 //     //                                   onShotDetected: () => Text(
//                 //     //                                     "Ready for Shot...",
//                 //     //                                     style: Theme.of(context)
//                 //     //                                         .textTheme
//                 //     //                                         .titleSmall!
//                 //     //                                         .copyWith(
//                 //     //                                             color: AppColors
//                 //     //                                                 .white),
//                 //     //                                   ),
//                 //     //                                   running: (secondsLeft) =>
//                 //     //                                       Text(
//                 //     //                                     "After $secondsLeft seconds, shot will be considered as a miss",
//                 //     //                                     style: Theme.of(context)
//                 //     //                                         .textTheme
//                 //     //                                         .titleSmall!
//                 //     //                                         .copyWith(
//                 //     //                                             color: AppColors
//                 //     //                                                 .white),
//                 //     //                                   ),
//                 //     //                                 );
//                 //     //                               },
//                 //     //                             ),
//                 //     //                           )
//                 //     //                         : const SizedBox(),
//                 //     //                   )
//                 //     //               ],
//                 //     //             ),
//                 //     //           ),
//                 //     //         ),
//                 //     //       ),
//                 //     //       Row(
//                 //     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //     //         children: [
//                 //     //           Text(
//                 //     //             'Total Score',
//                 //     //             style: TextStyle(
//                 //     //                 color: AppColors.white,
//                 //     //                 fontFamily: AppFontFamily.regular,
//                 //     //                 fontSize: 15.h),
//                 //     //           ),
//                 //     //           if (state.sessionModel.isSessionStart == true)
//                 //     //             Text(
//                 //     //               '${state.sessionModel.totalScores ?? ''}',
//                 //     //               style: TextStyle(
//                 //     //                   color: AppColors.white,
//                 //     //                   fontFamily: AppFontFamily.regular,
//                 //     //                   fontSize: 15.h),
//                 //     //             )
//                 //     //         ],
//                 //     //       ),
//                 //     //       SizedBox(height: 10.h),
//                 //     //       Row(
//                 //     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //     //         children: [
//                 //     //           Text('Total Shot',
//                 //     //               style: TextStyle(
//                 //     //                   color: AppColors.white,
//                 //     //                   fontFamily: AppFontFamily.regular,
//                 //     //                   fontSize: 15.h)),
//                 //     //           if (state.sessionModel.isSessionStart == true)
//                 //     //             Text(
//                 //     //               '${state.sessionModel.numberOfShots ?? ''}',
//                 //     //               style: TextStyle(
//                 //     //                   color: AppColors.white,
//                 //     //                   fontFamily: AppFontFamily.regular,
//                 //     //                   fontSize: 15.h),
//                 //     //             )
//                 //     //         ],
//                 //     //       ),
//                 //     //       SizedBox(height: 10.h),
//                 //     //
//                 //     //     ],
//                 //     //   ),
//                 //     // ),
//                 //     const SizedBox(width: 50,),
//                 //     if (state.sessionModel.isSessionStart == true)
//                 //         Expanded(
//                 //           child:  SizedBox(
//                 //             width: 190.w,
//                 //             height: 260.h,
//                 //             child: SingleChildScrollView(
//                 //               child: Table(
//                 //                 border: TableBorder.all(color: AppColors.white),
//                 //                 children: [
//                 //                   TableRow(
//                 //                     children: [
//                 //                       Padding(
//                 //                           padding:
//                 //                           EdgeInsets.fromLTRB(5.w, 6.h, 0.w, 6.h),
//                 //                           child: Text(
//                 //                             'Shot #',
//                 //                             style: TextStyle(
//                 //                                 fontFamily: AppFontFamily.regular,
//                 //                                 color: AppColors.white,
//                 //                                 fontSize: 14.h),
//                 //                           )),
//                 //                       Padding(
//                 //                           padding: EdgeInsets.all(6.0.h),
//                 //                           child: Text('Score',
//                 //                               textAlign: TextAlign.center,
//                 //                               style: TextStyle(
//                 //                                   fontFamily: AppFontFamily.regular,
//                 //                                   color: AppColors.white,
//                 //                                   fontSize: 14.h))),
//                 //                     ],
//                 //                   ),
//                 //                   for (ShootModel shot
//                 //                   in state.sessionModel.listShots?.reversed ?? [])
//                 //                     TableRow(
//                 //                       children: [
//                 //                         Padding(
//                 //                           padding:
//                 //                           EdgeInsets.fromLTRB(5.w, 6.h, 6.w, 6.h),
//                 //                           child: Row(
//                 //                             mainAxisAlignment:
//                 //                             MainAxisAlignment.spaceBetween,
//                 //                             children: [
//                 //                               Text(
//                 //                                 '${shot.shootNumber ?? ''}',
//                 //                                 style: TextStyle(
//                 //                                     fontFamily: AppFontFamily.regular,
//                 //                                     color: AppColors.white,
//                 //                                     fontSize: 14.h),
//                 //                               ),
//                 //                               if (state.sessionModel.lowestSplitTime ==
//                 //                                   miliSecondsToSecsSplitTime(
//                 //                                       shot.splitTimeInt ?? 1) &&
//                 //                                   (state.sessionModel.listShots
//                 //                                       ?.length ??
//                 //                                       0) >
//                 //                                       2)
//                 //                                 Image.asset(
//                 //                                     'assets/icons/shoot_max.png',
//                 //                                     width: 15),
//                 //                               if (state.sessionModel.highestSplitTime ==
//                 //                                   miliSecondsToSecsSplitTime(
//                 //                                       shot.splitTimeInt ?? 1) &&
//                 //                                   (state.sessionModel.listShots
//                 //                                       ?.length ??
//                 //                                       0) >
//                 //                                       2)
//                 //                                 Image.asset(
//                 //                                     'assets/icons/shoot_min.png',
//                 //                                     width: 15)
//                 //                             ],
//                 //                           ),
//                 //                         ),
//                 //                         Padding(
//                 //                           padding: EdgeInsets.all(6.0.h),
//                 //                           child: Text(
//                 //                             '${shot.shootScore ?? ''}',
//                 //                             textAlign: TextAlign.center,
//                 //                             style: TextStyle(
//                 //                                 fontFamily: AppFontFamily.regular,
//                 //                                 color: AppColors.white,
//                 //                                 fontSize: 14.h),
//                 //                           ),
//                 //                         ),
//                 //                       ],
//                 //                     ),
//                 //                 ],
//                 //               ),
//                 //             ),
//                 //           ),
//                 //       ),
//                 //     Padding(
//                 //       padding: EdgeInsets.symmetric(vertical: 12.h),
//                 //       child: SizedBox(
//                 //         height: 145.h,
//                 //         child: SingleChildScrollView(
//                 //           scrollDirection: Axis.vertical,
//                 //           child: Column(
//                 //             children: [
//                 //               if (state.sessionModel.isSessionStart == true)
//                 //                 Row(
//                 //                   mainAxisAlignment:
//                 //                   MainAxisAlignment.spaceBetween,
//                 //                   children: [
//                 //                     Text('Shoot',
//                 //                         style: TextStyle(
//                 //                             color: AppColors.white,
//                 //                             fontFamily: AppFontFamily.regular,
//                 //                             fontSize: 15.h)),
//                 //                     Text(
//                 //                       // '${state.sessionModel.listShots?.last.shootNumber ?? '0'}',
//                 //                         state.sessionModel.listShots != null
//                 //                             ? '${state.sessionModel.listShots!.length > 0 ? state.sessionModel.listShots?.last.shootNumber ?? '0' : '0'}'
//                 //                             : '0',
//                 //                         style: TextStyle(
//                 //                             color: AppColors.white,
//                 //                             fontFamily: AppFontFamily.regular,
//                 //                             fontSize: 15.h))
//                 //                   ],
//                 //                 ),
//                 //               if (state.sessionModel.isSessionStart == true)
//                 //                 Row(
//                 //                   mainAxisAlignment:
//                 //                   MainAxisAlignment.spaceBetween,
//                 //                   children: [
//                 //                     Text(
//                 //                       'Score',
//                 //                       style: TextStyle(
//                 //                           color: AppColors.white,
//                 //                           fontFamily: AppFontFamily.regular,
//                 //                           fontSize: 15.h),
//                 //                     ),
//                 //                     Text(
//                 //                       // '${state.sessionModel.listShots?.last.shootScore ?? '0'}',
//                 //                       state.sessionModel.listShots != null
//                 //                           ? '${state.sessionModel.listShots!.length > 0 ? state.sessionModel.listShots?.last.shootScore ?? '0' : '0'}'
//                 //                           : '0',
//                 //                       style: TextStyle(
//                 //                           color: AppColors.white,
//                 //                           fontFamily: AppFontFamily.regular,
//                 //                           fontSize: 15.h),
//                 //                     )
//                 //                   ],
//                 //                 ),
//                 //               SizedBox(
//                 //                 height: 8.h,
//                 //               ),
//                 //               if (state.sessionModel.isSessionStart == true)
//                 //                 StopwatchApp(
//                 //                   sessionModel: state.sessionModel,
//                 //                   startNow:
//                 //                   state.sessionModel.isSessionPaused ==
//                 //                       false,
//                 //                   countDownTime: state.sessionModel
//                 //                       .stageEntity?.mode?.id ==
//                 //                       4
//                 //                       ? '00:${miliSecondsToSecs(state.sessionModel.stageEntity?.mode?.seconds ?? 100)}'
//                 //                       : null,
//                 //                   isCountdown: state.sessionModel.stageEntity
//                 //                       ?.mode?.id ==
//                 //                       4,
//                 //                   beepStopedCallback: (p0) {
//                 //                     context.read<SessionBloc>().add(
//                 //                         ShootEvent(
//                 //                             sessionModel: state.sessionModel
//                 //                                 .copyWith(playBeep: false)));
//                 //                     // context
//                 //                     //     .read<AppBleDeviceBloc>()
//                 //                     //     .add(const StartListening());
//                 //                   },
//                 //                   callBackCallback: (p0) {
//                 //                     print('callBackCallback=====$p0');
//                 //                     SessionModel model = state.sessionModel;
//                 //                     if (model.listShots != null &&
//                 //                         model.listShots!.length > 0) {
//                 //                       model.listShots?.last.splitTime = p0;
//                 //                     }
//                 //                     if ('${model.shootModel?.shootNumber}' ==
//                 //                         model.stageEntity?.drill?.drill
//                 //                             ?.noOfShots) {
//                 //                       context.read<SessionBloc>().add(
//                 //                           ShootEvent(
//                 //                               sessionModel: model.copyWith(
//                 //                                   isSessionStart: false)));
//                 //                     }
//                 //                   },
//                 //                   callBackContinuous: (p0) {
//                 //                     //This is for ending session automatically if timer ends with no shots
//                 //                     if (p0 ==
//                 //                         '0' &&
//                 //                         state.sessionModel.stageEntity?.mode
//                 //                             ?.id ==
//                 //                             4 &&
//                 //                         state
//                 //                             .sessionModel.playedShoots !=
//                 //                             0 &&
//                 //                         state
//                 //                             .sessionModel.isSessionStart ==
//                 //                             true) {
//                 //                       // Must do globals empty in order to properly end session
//                 //                       stateBle_counter = 0;
//                 //                       totalScores = 0;
//                 //                       listShoots = [];
//                 //                       // SessionModel model = state.sessionModel;
//                 //                       // model.isSessionStart = false;
//                 //                       context.read<SessionBloc>().add(
//                 //                           ShootEvent(
//                 //                               sessionModel: state.sessionModel
//                 //                                   .copyWith(
//                 //                                   isSessionStart:
//                 //                                   false)));
//                 //                       WidgetsBinding.instance
//                 //                           .addPostFrameCallback((f) {
//                 //                         slRtspStreamingBloc.add(
//                 //                             const RtspStreamingEvent
//                 //                                 .disposeBloc());
//                 //
//                 //                         Navigator.push(
//                 //                             context,
//                 //                             MaterialPageRoute(
//                 //                                 builder: (_) =>
//                 //                                 const SessionCompletedView()))
//                 //                             .then((v) {
//                 //                           if (context.mounted) {
//                 //                             SessionModel model =
//                 //                                 state.sessionModel;
//                 //                             model.isSessionStart = false;
//                 //                             model.makeScoreVisible = null;
//                 //                             model.shootModel = null;
//                 //                             model.listShots = null;
//                 //                             model.numberOfShots = null;
//                 //                             model.playedShoots = 0;
//                 //                             model.totalScores = 0;
//                 //                             model.totalTime = null;
//                 //                             context.read<SessionBloc>().add(
//                 //                                 ShootEvent(
//                 //                                     sessionModel: model));
//                 //                           } else {
//                 //                             toast(null);
//                 //                           }
//                 //                         });
//                 //                       });
//                 //                     } else if (p0 ==
//                 //                         '0' &&
//                 //                         state.sessionModel.stageEntity?.mode
//                 //                             ?.id ==
//                 //                             4 &&
//                 //                         state.sessionModel.isSessionStart ==
//                 //                             true) {
//                 //                       state.sessionModel.makeScoreVisible =
//                 //                       null;
//                 //                       context.read<SessionBloc>().add(
//                 //                           ShootEvent(
//                 //                               sessionModel: state.sessionModel
//                 //                                   .copyWith(
//                 //                                   isSessionStart:
//                 //                                   false)));
//                 //                     }
//                 //                   },
//                 //                   child: state.sessionModel.isSessionPaused ==
//                 //                       false ?
//                 //                   MultiBlocListener(
//                 //                     listeners: [
//                 //                       /// Listening to AppBleDeviceBloc
//                 //                       BlocListener<AppBleDeviceBloc,
//                 //                           AppBleDeviceState>(
//                 //                         listener:
//                 //                             (context, stateBle) async {
//                 //                           if (stateBle
//                 //                           is DeviceIsDisconnected) {
//                 //                             /// Reset Global Variables
//                 //                             stateBle_counter = 0;
//                 //                             totalScores = 0;
//                 //                             listShoots = [];
//                 //
//                 //                             /// Reset Session Model
//                 //                             SessionModel model = state
//                 //                                 .sessionModel
//                 //                                 .copyWith(
//                 //                               isSessionStart: false,
//                 //                               makeScoreVisible: null,
//                 //                               shootModel: null,
//                 //                               listShots: null,
//                 //                               numberOfShots: null,
//                 //                               playedShoots: 0,
//                 //                               totalScores: 0,
//                 //                               totalTime: null,
//                 //                               isSessionPaused: false,
//                 //                             );
//                 //
//                 //                             /// Dispatch Reset Event
//                 //                             context
//                 //                                 .read<SessionBloc>()
//                 //                                 .add(ShootEvent(
//                 //                                 sessionModel:
//                 //                                 model));
//                 //
//                 //                             /// Show Toast & Navigate if Possible
//                 //                             if (Navigator.canPop(
//                 //                                 context)) {
//                 //                               Toast.show(context,
//                 //                                   message:
//                 //                                   'BLE device is disconnected');
//                 //                               Navigator.pop(context);
//                 //                             } else {
//                 //                               log('Device Disconnected Else Case');
//                 //                             }
//                 //                           } else if (stateBle
//                 //                           is CounterUpdated) {
//                 //                             print(
//                 //                                 '===== Counter Updated: ${stateBle.counter}');
//                 //                             stateBle_counter =
//                 //                                 stateBle.counter;
//                 //                           }
//                 //                         },
//                 //                       ),
//                 //
//                 //                       /// Listening to ListningTimerBloc
//                 //                       BlocListener<ListningTimerBloc,
//                 //                           ListningTimerState>(
//                 //                         listener:
//                 //                             (context, stateTimer) {
//                 //                           if (stateTimer
//                 //                           is OnShotDetected) {
//                 //                             print(
//                 //                                 "===== Checking Counter: $stateBle_counter");
//                 //                             currentShootNew =
//                 //                                 stateBle_counter;
//                 //
//                 //                             if (state.sessionModel
//                 //                                 .isSessionStart ==
//                 //                                 true &&
//                 //                                 state.sessionModel
//                 //                                     .isSessionPaused ==
//                 //                                     false &&
//                 //                                 state.sessionModel
//                 //                                     .playBeep ==
//                 //                                     false) {
//                 //                               /// Show Loading Indicator
//                 //                               BotToast.showLoading();
//                 //                               BotToast
//                 //                                   .closeAllLoading();
//                 //
//                 //                               if (context.mounted) {
//                 //                                 /// Dispatch Updated Session State
//                 //                                 context
//                 //                                     .read<SessionBloc>()
//                 //                                     .add(ShootEvent(
//                 //                                   sessionModel: state
//                 //                                       .sessionModel
//                 //                                       .copyWith(
//                 //                                     stageEntity: state
//                 //                                         .sessionModel
//                 //                                         .stageEntity,
//                 //                                     listShots:
//                 //                                     listShoots,
//                 //                                     shootModel:
//                 //                                     shootModel,
//                 //                                     isSessionStart:
//                 //                                     true,
//                 //                                     playBeep: false,
//                 //                                     playedShoots:
//                 //                                     stateBle_counter,
//                 //                                     numberOfShots: int.parse(state
//                 //                                         .sessionModel
//                 //                                         .stageEntity
//                 //                                         ?.drill
//                 //                                         ?.drill
//                 //                                         ?.noOfShots ??
//                 //                                         '0'),
//                 //                                     sessionId: state
//                 //                                         .sessionModel
//                 //                                         .sessionId,
//                 //                                     totalScores:
//                 //                                     totalScores,
//                 //                                   ),
//                 //                                 ));
//                 //
//                 //                                 /// Check if Session is Completed
//                 //                                 if ('$stateBle_counter' ==
//                 //                                     state
//                 //                                         .sessionModel
//                 //                                         .stageEntity
//                 //                                         ?.drill
//                 //                                         ?.drill
//                 //                                         ?.noOfShots) {
//                 //                                   context
//                 //                                       .read<
//                 //                                       AppBleDeviceBloc>()
//                 //                                       .add(
//                 //                                       const StopListening());
//                 //
//                 //                                   /// Reset Global Variables
//                 //                                   stateBle_counter = 0;
//                 //                                   totalScores = 0;
//                 //                                   listShoots = [];
//                 //
//                 //                                   /// Dispose of RTSP Streaming
//                 //                                   slRtspStreamingBloc.add(
//                 //                                       const RtspStreamingEvent
//                 //                                           .disposeBloc());
//                 //
//                 //                                   /// Navigate to Session Completed View
//                 //                                   Navigator.push(
//                 //                                     context,
//                 //                                     MaterialPageRoute(
//                 //                                       builder: (context) =>
//                 //                                       const SessionCompletedView(),
//                 //                                     ),
//                 //                                   ).then((_) {
//                 //                                     if (context
//                 //                                         .mounted) {
//                 //                                       SessionModel
//                 //                                       model = state
//                 //                                           .sessionModel
//                 //                                           .copyWith(
//                 //                                         isSessionStart:
//                 //                                         false,
//                 //                                         makeScoreVisible:
//                 //                                         null,
//                 //                                         shootModel:
//                 //                                         null,
//                 //                                         listShots: null,
//                 //                                         numberOfShots:
//                 //                                         null,
//                 //                                         playedShoots: 0,
//                 //                                         totalScores: 0,
//                 //                                         totalTime: null,
//                 //                                       );
//                 //                                       context
//                 //                                           .read<
//                 //                                           SessionBloc>()
//                 //                                           .add(ShootEvent(
//                 //                                           sessionModel:
//                 //                                           model));
//                 //                                     }
//                 //                                   });
//                 //                                 }
//                 //
//                 //                                 listeningTimerBloc.add(
//                 //                                     const ListningTimerEvent
//                 //                                         .stopTimer());
//                 //                               } else {
//                 //                                 toast(
//                 //                                     "Try again, couldn't capture screenshot");
//                 //                               }
//                 //                             }
//                 //                           }
//                 //
//                 //                           if (stateTimer
//                 //                           is TimerRunning) {
//                 //                             if (stateTimer
//                 //                                 .secondsLeft ==
//                 //                                 0) {
//                 //                               String imgPath =
//                 //                               getImagePath(state
//                 //                                   .sessionModel
//                 //                                   .sessionId);
//                 //                               shootModel = ShootModel(
//                 //                                 parTime: 0,
//                 //                                 shootImagePath: imgPath,
//                 //                                 shootNumber:
//                 //                                 stateBle_counter,
//                 //                                 shootScore: 0,
//                 //                               );
//                 //
//                 //                               listShoots
//                 //                                   .add(shootModel);
//                 //                               listeningTimerBloc.add(
//                 //                                   const ListningTimerEvent
//                 //                                       .onShotDetectedEvent());
//                 //                             }
//                 //                           }
//                 //                         },
//                 //                       ),
//                 //                     ],
//                 //                     child: BlocBuilder<
//                 //                         ListningTimerBloc,
//                 //                         ListningTimerState>(
//                 //                       builder: (context, state) {
//                 //                         return state.when(
//                 //                           initial: () => Text(
//                 //                             "Ready for Shot...",
//                 //                             style: Theme.of(context)
//                 //                                 .textTheme
//                 //                                 .titleSmall!
//                 //                                 .copyWith(
//                 //                                 color: AppColors
//                 //                                     .white),
//                 //                           ),
//                 //                           onShotDetected: () => Text(
//                 //                             "Ready for Shot...",
//                 //                             style: Theme.of(context)
//                 //                                 .textTheme
//                 //                                 .titleSmall!
//                 //                                 .copyWith(
//                 //                                 color: AppColors
//                 //                                     .white),
//                 //                           ),
//                 //                           running: (secondsLeft) =>
//                 //                               Text(
//                 //                                 "After $secondsLeft seconds, shot will be considered as a miss",
//                 //                                 style: Theme.of(context)
//                 //                                     .textTheme
//                 //                                     .titleSmall!
//                 //                                     .copyWith(
//                 //                                     color: AppColors
//                 //                                         .white),
//                 //                               ),
//                 //                         );
//                 //                       },
//                 //                     ),
//                 //                   )
//                 //                       : const SizedBox(),
//                 //                 )
//                 //             ],
//                 //           ),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //
//                 //   ],
//                 // ),
//                 const SizedBox(width: 50,),
//                 if (state.sessionModel.isSessionStart == true)
//                   SizedBox(
//                     width: 190.w,
//                     height: 260.h,
//                     child: SingleChildScrollView(
//                       child: Table(
//                         border: TableBorder.all(color: AppColors.white),
//                         children: [
//                           TableRow(
//                             children: [
//                               Padding(
//                                   padding:
//                                   EdgeInsets.fromLTRB(5.w, 6.h, 0.w, 6.h),
//                                   child: Text(
//                                     'Shot #',
//                                     style: TextStyle(
//                                         fontFamily: AppFontFamily.regular,
//                                         color: AppColors.white,
//                                         fontSize: 14.h),
//                                   )),
//                               Padding(
//                                   padding: EdgeInsets.all(6.0.h),
//                                   child: Text('Score',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           fontFamily: AppFontFamily.regular,
//                                           color: AppColors.white,
//                                           fontSize: 14.h))),
//                             ],
//                           ),
//                           for (ShootModel shot in state.sessionModel.listShots?.reversed ?? [])
//                             TableRow(
//                               children: [
//                                 Padding(
//                                   padding:
//                                   EdgeInsets.fromLTRB(5.w, 6.h, 6.w, 6.h),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         '${shot.shootNumber ?? ''}',
//                                         style: TextStyle(
//                                             fontFamily: AppFontFamily.regular,
//                                             color: AppColors.white,
//                                             fontSize: 14.h),
//                                       ),
//                                       if (state.sessionModel.lowestSplitTime ==
//                                           miliSecondsToSecsSplitTime(
//                                               shot.splitTimeInt ?? 1) &&
//                                           (state.sessionModel.listShots
//                                               ?.length ??
//                                               0) >
//                                               2)
//                                         Image.asset(
//                                             'assets/icons/shoot_max.png',
//                                             width: 15),
//                                       if (state.sessionModel.highestSplitTime ==
//                                           miliSecondsToSecsSplitTime(
//                                               shot.splitTimeInt ?? 1) &&
//                                           (state.sessionModel.listShots
//                                               ?.length ??
//                                               0) >
//                                               2)
//                                         Image.asset(
//                                             'assets/icons/shoot_min.png',
//                                             width: 15)
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(6.0.h),
//                                   child: Text(
//                                     '${shot.shootScore ?? ''}',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontFamily: AppFontFamily.regular,
//                                         color: AppColors.white,
//                                         fontSize: 14.h),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 // if (state.sessionModel.isSessionStart == true)
//                   StopwatchApp(
//                     sessionModel: state.sessionModel,
//                     startNow:
//                     state.sessionModel.isSessionPaused ==
//                         false,
//                     countDownTime: state.sessionModel
//                         .stageEntity?.mode?.id ==
//                         4
//                         ? '00:${miliSecondsToSecs(state.sessionModel.stageEntity?.mode?.seconds ?? 100)}'
//                         : null,
//                     isCountdown: state.sessionModel.stageEntity
//                         ?.mode?.id ==
//                         4,
//                     beepStopedCallback: (p0) {
//                       context.read<SessionBloc>().add(
//                           ShootEvent(
//                               sessionModel: state.sessionModel
//                                   .copyWith(playBeep: false)));
//                       // context
//                       //     .read<AppBleDeviceBloc>()
//                       //     .add(const StartListening());
//                      },
//                     callBackCallback: (p0) {
//                       print('callBackCallback=====$p0');
//                       SessionModel model = state.sessionModel;
//                       if (model.listShots != null &&
//                           model.listShots!.length > 0) {
//                         model.listShots?.last.splitTime = p0;
//                       }
//                       if ('${model.shootModel?.shootNumber}' ==
//                           model.stageEntity?.drill?.drill
//                               ?.noOfShots) {
//                         context.read<SessionBloc>().add(
//                             ShootEvent(
//                                 sessionModel: model.copyWith(
//                                     isSessionStart: false)));
//                       }
//                     },
//                     callBackContinuous: (p0) {
//                       //This is for ending session automatically if timer ends with no shots
//                       if (p0 == '0' && state.sessionModel.stageEntity?.mode?.id == 4 && state.sessionModel.playedShoots != 0 && state.sessionModel.isSessionStart == true) {
//                         // Must do globals empty in order to properly end session
//                         stateBle_counter = 0;
//                         totalScores = 0;
//                         listShoots = [];
//                         // SessionModel model = state.sessionModel;
//                         // model.isSessionStart = false;
//                         context.read<SessionBloc>().add(
//                             ShootEvent(
//                                 sessionModel: state.sessionModel
//                                     .copyWith(
//                                     isSessionStart:
//                                     false)));
//                         WidgetsBinding.instance
//                             .addPostFrameCallback((f) {
//                           slRtspStreamingBloc.add(
//                               const RtspStreamingEvent
//                                   .disposeBloc());
//
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (_) =>
//                                   const SessionCompletedView()))
//                               .then((v) {
//                             if (context.mounted) {
//                               SessionModel model =
//                                   state.sessionModel;
//                               model.isSessionStart = false;
//                               model.makeScoreVisible = null;
//                               model.shootModel = null;
//                               model.listShots = null;
//                               model.numberOfShots = null;
//                               model.playedShoots = 0;
//                               model.totalScores = 0;
//                               model.totalTime = null;
//                               context.read<SessionBloc>().add(
//                                   ShootEvent(
//                                       sessionModel: model));
//                             } else {
//                               toast(null);
//                             }
//                           });
//                         });
//                       } else if (p0 ==
//                           '0' &&
//                           state.sessionModel.stageEntity?.mode
//                               ?.id ==
//                               4 &&
//                           state.sessionModel.isSessionStart ==
//                               true) {
//                         state.sessionModel.makeScoreVisible =
//                         null;
//                         context.read<SessionBloc>().add(
//                             ShootEvent(
//                                 sessionModel: state.sessionModel
//                                     .copyWith(
//                                     isSessionStart:
//                                     false)));
//                       }
//                     },
//
//                     child: state.sessionModel.isSessionStart == true  ?
//                     MultiBlocListener(
//                       listeners: [
//                         /// Listening to AppBleDeviceBloc
//                         BlocListener<AppBleDeviceBloc,
//                             AppBleDeviceState>(
//                           listener:
//                               (context, stateBle) async {
//                             if (stateBle is DeviceIsDisconnected) {
//                               /// Reset Global Variables
//                               stateBle_counter = 0;
//                               totalScores = 0;
//                               listShoots = [];
//
//                               /// Reset Session Model
//                               SessionModel model = state
//                                   .sessionModel
//                                   .copyWith(
//                                 isSessionStart: false,
//                                 makeScoreVisible: null,
//                                 shootModel: null,
//                                 listShots: null,
//                                 numberOfShots: null,
//                                 playedShoots: 0,
//                                 totalScores: 0,
//                                 totalTime: null,
//                                 isSessionPaused: false,
//                               );
//
//                               /// Dispatch Reset Event
//                               context
//                                   .read<SessionBloc>()
//                                   .add(ShootEvent(
//                                   sessionModel:
//                                   model));
//
//                               /// Show Toast & Navigate if Possible
//                               if (Navigator.canPop(
//                                   context)) {
//                                 Toast.show(context,
//                                     message:
//                                     'BLE device is disconnected');
//                                 Navigator.pop(context);
//                               } else {
//                                 log('Device Disconnected Else Case');
//                               }
//                             }
//                             else if (stateBle is CounterUpdated) {
//                               print( '===== Counter Updated: ${stateBle.counter}');
//                               stateBle_counter =  stateBle.counter;
//                             }
//                           },
//                         ),
//
//                         /// Listening to ListningTimerBloc
//                         BlocListener<ListningTimerBloc,
//                             ListningTimerState>(
//                           listener:
//                               (context, stateTimer) {
//                             if (stateTimer is OnShotDetected) {
//                               print(
//                                   "===== Checking Counter: $stateBle_counter");
//                               currentShootNew =
//                                   stateBle_counter;
//
//                               if (state.sessionModel
//                                   .isSessionStart ==
//                                   true &&
//                                   state.sessionModel
//                                       .isSessionPaused ==
//                                       false &&
//                                   state.sessionModel
//                                       .playBeep ==
//                                       false) {
//                                 /// Show Loading Indicator
//                                 BotToast.showLoading();
//                                 BotToast
//                                     .closeAllLoading();
//
//                                 if (context.mounted) {
//                                   /// Dispatch Updated Session State
//                                   context
//                                       .read<SessionBloc>()
//                                       .add(ShootEvent(
//                                     sessionModel: state
//                                         .sessionModel
//                                         .copyWith(
//                                       stageEntity: state
//                                           .sessionModel
//                                           .stageEntity,
//                                       listShots:
//                                       listShoots,
//                                       shootModel:
//                                       shootModel,
//                                       isSessionStart:
//                                       true,
//                                       playBeep: false,
//                                       playedShoots:
//                                       stateBle_counter,
//                                       numberOfShots: int.parse(state
//                                           .sessionModel
//                                           .stageEntity
//                                           ?.drill
//                                           ?.drill
//                                           ?.noOfShots ??
//                                           '0'),
//                                       sessionId: state
//                                           .sessionModel
//                                           .sessionId,
//                                       totalScores:
//                                       totalScores,
//                                     ),
//                                   ));
//
//                                   /// Check if Session is Completed
//                                   if ('$stateBle_counter' ==
//                                       state
//                                           .sessionModel
//                                           .stageEntity
//                                           ?.drill
//                                           ?.drill
//                                           ?.noOfShots) {
//                                     // context
//                                     //     .read<
//                                     //     AppBleDeviceBloc>()
//                                     //     .add(
//                                     //     const StopListening());
//
//                                     // /// Reset Global Variables
//                                     // stateBle_counter = 0;
//                                     // totalScores = 0;
//                                     // listShoots = [];
//                                     //
//                                     // /// Dispose of RTSP Streaming
//                                     // slRtspStreamingBloc.add(
//                                     //     const RtspStreamingEvent
//                                     //         .disposeBloc());
//                                     //
//                                     // /// Navigate to Session Completed View
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) =>
//                                     //     const SessionCompletedView(),
//                                     //   ),
//                                     // ).then((_) {
//                                     //   if (context.mounted) {
//                                     //     SessionModel model = state
//                                     //         .sessionModel
//                                     //         .copyWith(
//                                     //       isSessionStart:
//                                     //       false,
//                                     //       makeScoreVisible:
//                                     //       null,
//                                     //       shootModel:
//                                     //       null,
//                                     //       listShots: null,
//                                     //       numberOfShots:
//                                     //       null,
//                                     //       playedShoots: 0,
//                                     //       totalScores: 0,
//                                     //       totalTime: null,
//                                     //     );
//                                     //     context
//                                     //         .read<
//                                     //         SessionBloc>()
//                                     //         .add(ShootEvent(
//                                     //         sessionModel:
//                                     //         model));
//                                     //   }
//                                     // });
//                                     //
//
//                                     slRtspStreamingBloc.add(
//                                         const RtspStreamingEvent.disposeBloc());
//                                     context
//                                         .read<AppBleDeviceBloc>()
//                                         .add(const StopListening());
//                                     // Must do globals empty in order to properly end session
//                                     stateBle_counter = 0;
//                                     totalScores = 0;
//                                     listShoots = [];
//
//                                       context.read<SessionBloc>().add(ShootEvent(
//                                           sessionModel: state.sessionModel
//                                               .copyWith(isSessionStart: false)));
//
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                               const SessionCompletedView()))
//                                           .then((v) {
//                                         if (context.mounted) {
//                                           SessionModel model = state.sessionModel;
//                                           model.isSessionStart = false;
//                                           model.makeScoreVisible = null;
//                                           model.shootModel = null;
//                                           model.listShots = null;
//                                           model.numberOfShots = null;
//                                           model.playedShoots = 0;
//                                           model.totalScores = 0;
//                                           model.totalTime = null;
//                                           model.isSessionPaused = false;
//                                           context
//                                               .read<SessionBloc>()
//                                               .add(ShootEvent(sessionModel: model));
//                                         } else {
//                                           toast(null);
//                                         }
//                                       });
//
//                                   }
//
//                                   listeningTimerBloc.add(
//                                       const ListningTimerEvent
//                                           .stopTimer());
//                                 } else {
//                                   toast(
//                                       "Try again, couldn't capture screenshot");
//                                 }
//                               }
//                             }
//
//                             if (stateTimer is TimerRunning) {
//                               if (stateTimer
//                                   .secondsLeft ==
//                                   0) {
//                                 String imgPath =
//                                 getImagePath(state
//                                     .sessionModel
//                                     .sessionId);
//                                 shootModel = ShootModel(
//                                   parTime: 0,
//                                   shootImagePath: imgPath,
//                                   shootNumber:
//                                   stateBle_counter,
//                                   shootScore: 0,
//                                 );
//
//                                 listShoots.add(shootModel);
//                                 listeningTimerBloc.add(
//                                     const ListningTimerEvent
//                                         .onShotDetectedEvent());
//                               }
//                             }
//                           },
//                         ),
//                       ],
//                       child: BlocBuilder<
//                           ListningTimerBloc,
//                           ListningTimerState>(
//                         builder: (context, state) {
//                           return state.when(
//                             initial: () => Text(
//                               "Ready for Shot...",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleSmall!
//                                   .copyWith(
//                                   color: AppColors
//                                       .white),
//                             ),
//                             onShotDetected: () => Text(
//                               "Ready for Shot...",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleSmall!
//                                   .copyWith(
//                                   color: AppColors
//                                       .white),
//                             ),
//                             running: (secondsLeft) =>
//                                 Text(
//                                   "After $secondsLeft seconds, shot will be considered as a miss",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleSmall!
//                                       .copyWith(
//                                       color: AppColors
//                                           .white),
//                                 ),
//                           );
//                         },
//                       ),
//                     )
//                         : const SizedBox(),
//                   ),
//
//                 if (state.sessionModel.isSessionStart == true &&
//                     state.sessionModel.playBeep == false)
//                   Row(
//                     children: [
//                       TextButton.icon(
//                         icon: Wrap(children: [
//                           Icon(
//                               state.sessionModel.isSessionPaused == false
//                                   ? Icons.pause_rounded
//                                   : Icons.play_arrow_rounded,
//                               size: 19.h,
//                               color: AppColors.white),
//                           Text(
//                             state.sessionModel.isSessionPaused == false
//                                 ? 'Pause'
//                                 : 'Start',
//                             style: TextStyle(
//                                 color: AppColors.white,
//                                 fontSize: 14.h,
//                                 fontFamily: AppFontFamily.bold),
//                           ),
//                         ]),
//                         label: const Text(''),
//                         onPressed: () {
//                           SessionModel model = state.sessionModel;
//                           if (model.isSessionPaused == true) {
//                             // context
//                             //     .read<AppBleDeviceBloc>()
//                             //     .add(const StartListening());
//                             resume();
//                             context.read<SessionBloc>().add(ShootEvent(
//                                 sessionModel: model.copyWith(
//                                     isSessionPaused: false)));
//                           } else {
//                             pause();
//                             context.read<SessionBloc>().add(ShootEvent(
//                                 sessionModel: model.copyWith(
//                                     isSessionPaused: true)));
//                             // context
//                             //     .read<AppBleDeviceBloc>()
//                             //     .add(const StopListening());
//                           }
//                         },
//                         style: TextButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                           minimumSize: Size.zero,
//                           fixedSize: Size(50.w, 36.h),
//                           backgroundColor: AppColors.kRedColor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6.h)),
//                         ),
//                       ),
//                       const Spacer(),
//                       TextButton(
//                         onPressed: () async {
//                           // releaseD();
//                           slRtspStreamingBloc.add(
//                               const RtspStreamingEvent.disposeBloc());
//                           context
//                               .read<AppBleDeviceBloc>()
//                               .add(const StopListening());
//                           // Must do globals empty in order to properly end session
//                           stateBle_counter = 0;
//                           totalScores = 0;
//                           listShoots = [];
//                           if (state.sessionModel.playedShoots != 0) {
//                             context.read<SessionBloc>().add(ShootEvent(
//                                 sessionModel: state.sessionModel
//                                     .copyWith(isSessionStart: false)));
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                     const SessionCompletedView()))
//                                 .then((v) {
//                               if (context.mounted) {
//                                 SessionModel model = state.sessionModel;
//                                 model.isSessionStart = false;
//                                 model.makeScoreVisible = null;
//                                 model.shootModel = null;
//                                 model.listShots = null;
//                                 model.numberOfShots = null;
//                                 model.playedShoots = 0;
//                                 model.totalScores = 0;
//                                 model.totalTime = null;
//                                 model.isSessionPaused = false;
//                                 context
//                                     .read<SessionBloc>()
//                                     .add(ShootEvent(sessionModel: model));
//                               } else {
//                                 toast(null);
//                               }
//                             });
//                           }
//                           else {
//                             print('in else end');
//                             state.sessionModel.makeScoreVisible = null;
//                             context.read<SessionBloc>().add(ShootEvent(
//                                 sessionModel: state.sessionModel.copyWith(
//                                     isSessionStart: false,
//                                     isSessionPaused: false)));
//                           }
//                         },
//                         style: TextButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                           minimumSize: Size.zero,
//                           fixedSize: Size(50.w, 36.h),
//                           backgroundColor: AppColors.kPrimaryColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(6.h),
//                           ),
//                         ),
//                         child: Text(
//                           'End Session',
//                           style: TextStyle(
//                               color: AppColors.white,
//                               fontSize: 14.h,
//                               fontFamily: AppFontFamily.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//
//               ],
//             ),
//           );
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }
// }
//
// ///---------------------------------------
//
// // class SessionScore extends StatefulWidget {
// //   const SessionScore({super.key});
// //
// //   @override
// //   State<SessionScore> createState() => _SessionScoreState();
// // }
// //
// // class _SessionScoreState extends State<SessionScore> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<SessionBloc, SessionState>(
// //       // listener: (context, state) {
// //       //   if (state is ShootState) {
// //       //     sessionModel = state.sessionModel;
// //       //   }
// //       // },
// //       builder: (context, state) {
// //         if (state is ShootState) {
// //           return Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Align(
// //                     alignment: Alignment.topCenter,
// //                     child: Text(
// //                       'Session Score',
// //                       style: TextStyle(
// //                           color: AppColors.white,
// //                           fontFamily: AppFontFamily.regular,
// //                           fontSize: 20.h),
// //                     )),
// //                 SizedBox(height: 12.h),
// //                 if (state.sessionModel.isSessionStart == true)
// //                   Text('Session ID: ${state.sessionModel.sessionId}',
// //                       style: TextStyle(
// //                           color: AppColors.white,
// //                           fontFamily: AppFontFamily.regular,
// //                           fontSize: 15.h)),
// //                 Padding(
// //                   padding: EdgeInsets.symmetric(vertical: 12.h),
// //                   child: SizedBox(
// //                     height: 145.h,
// //                     child: SingleChildScrollView(
// //                       scrollDirection: Axis.vertical,
// //                       child: Column(
// //                         children: [
// //                           if (state.sessionModel.isSessionStart == true)
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text('Shoot',
// //                                     style: TextStyle(
// //                                         color: AppColors.white,
// //                                         fontFamily: AppFontFamily.regular,
// //                                         fontSize: 15.h)),
// //                                 Text(
// //                                     '${state.sessionModel.listShots?.last.shootNumber ?? '0'}',
// //                                     style: TextStyle(
// //                                         color: AppColors.white,
// //                                         fontFamily: AppFontFamily.regular,
// //                                         fontSize: 15.h))
// //                               ],
// //                             ),
// //                           if (state.sessionModel.isSessionStart == true)
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(
// //                                   'Score',
// //                                   style: TextStyle(
// //                                       color: AppColors.white,
// //                                       fontFamily: AppFontFamily.regular,
// //                                       fontSize: 15.h),
// //                                 ),
// //                                 Text(
// //                                   '${state.sessionModel.listShots?.last.shootScore ?? '0'}',
// //                                   style: TextStyle(
// //                                       color: AppColors.white,
// //                                       fontFamily: AppFontFamily.regular,
// //                                       fontSize: 15.h),
// //                                 )
// //                               ],
// //                             ),
// //                           if (state.sessionModel.isSessionStart == true)
// //                             StopwatchApp(
// //                               sessionModel: state.sessionModel,
// //                               startNow:
// //                                   state.sessionModel.isSessionPaused == false,
// //                               shotNo:
// //                                   state.sessionModel.shootModel?.shootNumber ??
// //                                       0,
// //                               countDownTime: state
// //                                           .sessionModel.stageEntity?.mode?.id ==
// //                                       4
// //                                   ? '00:${miliSecondsToSecs(state.sessionModel.stageEntity?.mode?.seconds ?? 100)}'
// //                                   : null,
// //                               isCountdown:
// //                                   state.sessionModel.stageEntity?.mode?.id == 4,
// //                               beepStopedCallback: (p0) {
// //                                 context.read<SessionBloc>().add(ShootEvent(
// //                                     sessionModel: state.sessionModel
// //                                         .copyWith(playBeep: false)));
// //                                 context
// //                                     .read<AppBleDeviceBloc>()
// //                                     .add(const StartListening());
// //                               },
// //                               callBackCallback: (p0) {
// //                                 // This is for saving split time and then ending session, if we move this code in above shoot button code, along with other, skips saving split time of last shot
// //                                 SessionModel model = state.sessionModel;
// //                                 model.listShots?.last.splitTime = p0;
// //                                 if ('${model.shootModel?.shootNumber}' ==
// //                                     model
// //                                         .stageEntity?.drill?.drill?.noOfShots) {
// //                                   context.read<SessionBloc>().add(ShootEvent(
// //                                       sessionModel: model.copyWith(
// //                                           isSessionStart: false)));
// //                                 }
// //                               },
// //                               callBackContinuous: (p0) {
// //                                 //This is for ending session automatically if timer ends with no shots
// //                                 if (p0 == '0' &&
// //                                     state.sessionModel.stageEntity?.mode?.id ==
// //                                         4 &&
// //                                     state.sessionModel.playedShoots != 0 &&
// //                                     state.sessionModel.isSessionStart == true) {
// //                                   // Must do globals empty in order to properly end session
// //                                   triggredShoot = 0;
// //                                   stateBle_counter = 0;
// //                                   totalScores = 0;
// //                                   listShoots = [];
// //                                   // SessionModel model = state.sessionModel;
// //                                   // model.isSessionStart = false;
// //                                   context.read<SessionBloc>().add(ShootEvent(
// //                                       sessionModel: state.sessionModel
// //                                           .copyWith(isSessionStart: false)));
// //                                   WidgetsBinding.instance
// //                                       .addPostFrameCallback((f) {
// //                                     Navigator.push(
// //                                             context,
// //                                             MaterialPageRoute(
// //                                                 builder: (_) =>
// //                                                     const SessionCompletedView()))
// //                                         .then((v) {
// //                                       if (context.mounted) {
// //                                         SessionModel model = state.sessionModel;
// //                                         model.isSessionStart = false;
// //                                         model.makeScoreVisible = null;
// //                                         model.shootModel = null;
// //                                         model.listShots = null;
// //                                         model.numberOfShots = null;
// //                                         model.playedShoots = 0;
// //                                         model.totalScores = 0;
// //                                         model.totalTime = null;
// //                                         context.read<SessionBloc>().add(
// //                                             ShootEvent(sessionModel: model));
// //                                       } else {
// //                                         toast(null);
// //                                       }
// //                                     });
// //                                   });
// //                                 } else if (p0 == '0' &&
// //                                     state.sessionModel.stageEntity?.mode?.id ==
// //                                         4 &&
// //                                     state.sessionModel.isSessionStart == true) {
// //                                   state.sessionModel.makeScoreVisible = null;
// //                                   context.read<SessionBloc>().add(ShootEvent(
// //                                       sessionModel: state.sessionModel
// //                                           .copyWith(isSessionStart: false)));
// //                                 }
// //                               },
// //                             )
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'Total Score',
// //                       style: TextStyle(
// //                           color: AppColors.white,
// //                           fontFamily: AppFontFamily.regular,
// //                           fontSize: 15.h),
// //                     ),
// //                     if (state.sessionModel.isSessionStart == true)
// //                       Text(
// //                         '${state.sessionModel.totalScores ?? ''}',
// //                         style: TextStyle(
// //                             color: AppColors.white,
// //                             fontFamily: AppFontFamily.regular,
// //                             fontSize: 15.h),
// //                       )
// //                   ],
// //                 ),
// //                 SizedBox(height: 10.h),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text('Total Shot',
// //                         style: TextStyle(
// //                             color: AppColors.white,
// //                             fontFamily: AppFontFamily.regular,
// //                             fontSize: 15.h)),
// //                     if (state.sessionModel.isSessionStart == true)
// //                       Text(
// //                         '${state.sessionModel.numberOfShots ?? ''}',
// //                         style: TextStyle(
// //                             color: AppColors.white,
// //                             fontFamily: AppFontFamily.regular,
// //                             fontSize: 15.h),
// //                       )
// //                   ],
// //                 ),
// //                 SizedBox(height: 10.h),
// //                 if (state.sessionModel.isSessionStart == true &&
// //                     state.sessionModel.playBeep == false)
// //                   Row(
// //                     children: [
// //                       TextButton.icon(
// //                         icon: Wrap(children: [
// //                           Icon(
// //                               state.sessionModel.isSessionPaused == false
// //                                   ? Icons.pause_rounded
// //                                   : Icons.play_arrow_rounded,
// //                               size: 19.h,
// //                               color: AppColors.white),
// //                           Text(
// //                             state.sessionModel.isSessionPaused == false
// //                                 ? 'Pause'
// //                                 : 'Start',
// //                             style: TextStyle(
// //                                 color: AppColors.white,
// //                                 fontSize: 14.h,
// //                                 fontFamily: AppFontFamily.bold),
// //                           ),
// //                         ]),
// //                         label: const Text(''),
// //                         onPressed: () {
// //                           SessionModel model = state.sessionModel;
// //                           if (model.isSessionPaused == true) {
// //                             // context
// //                             //     .read<AppBleDeviceBloc>()
// //                             //     .add(const StartListening());
// //
// //                             context.read<SessionBloc>().add(ShootEvent(
// //                                 sessionModel:
// //                                     model.copyWith(isSessionPaused: false)));
// //                           } else {
// //                             // context
// //                             //     .read<AppBleDeviceBloc>()
// //                             //     .add(const StopListening());
// //                             context.read<SessionBloc>().add(ShootEvent(
// //                                 sessionModel:
// //                                     model.copyWith(isSessionPaused: true)));
// //                           }
// //                         },
// //                         style: TextButton.styleFrom(
// //                           padding: EdgeInsets.zero,
// //                           minimumSize: Size.zero,
// //                           fixedSize: Size(50.w, 36.h),
// //                           backgroundColor: AppColors.kRedColor,
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(6.h)),
// //                         ),
// //                       ),
// //                       const Spacer(),
// //                       TextButton(
// //                         onPressed: () {
// //                           context
// //                               .read<AppBleDeviceBloc>()
// //                               .add(const StopListening());
// //                           // Must do globals empty in order to properly end session
// //
// //                           stateBle_counter = 0;
// //                           totalScores = 0;
// //                           listShoots = [];
// //                           triggredShoot = 0;
// //                           if (state.sessionModel.playedShoots != 0) {
// //                             context.read<SessionBloc>().add(ShootEvent(
// //                                 sessionModel: state.sessionModel
// //                                     .copyWith(isSessionStart: false)));
// //                             Navigator.push(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                         builder: (context) =>
// //                                             const SessionCompletedView()))
// //                                 .then((v) {
// //                               if (context.mounted) {
// //                                 SessionModel model = state.sessionModel;
// //                                 model.isSessionStart = false;
// //                                 model.makeScoreVisible = null;
// //                                 model.shootModel = null;
// //                                 model.listShots = null;
// //                                 model.numberOfShots = null;
// //                                 model.playedShoots = 0;
// //                                 model.totalScores = 0;
// //                                 model.totalTime = null;
// //                                 model.isSessionPaused = false;
// //                                 context
// //                                     .read<SessionBloc>()
// //                                     .add(ShootEvent(sessionModel: model));
// //                               } else {
// //                                 toast(null);
// //                               }
// //                             });
// //                           } else {
// //                             print('in else end');
// //                             state.sessionModel.makeScoreVisible = null;
// //                             context.read<SessionBloc>().add(ShootEvent(
// //                                 sessionModel: state.sessionModel.copyWith(
// //                                     isSessionStart: false,
// //                                     isSessionPaused: false)));
// //                           }
// //                         },
// //                         style: TextButton.styleFrom(
// //                           padding: EdgeInsets.zero,
// //                           minimumSize: Size.zero,
// //                           fixedSize: Size(50.w, 36.h),
// //                           backgroundColor: AppColors.kPrimaryColor,
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(6.h),
// //                           ),
// //                         ),
// //                         child: Text(
// //                           'End Session',
// //                           style: TextStyle(
// //                               color: AppColors.white,
// //                               fontSize: 14.h,
// //                               fontFamily: AppFontFamily.bold),
// //                         ),
// //                       ),
// //                     ],
// //                   )
// //               ],
// //             ),
// //           );
// //         } else {
// //           return const SizedBox.shrink();
// //         }
// //       },
// //     );
// //   }
// //   // SessionModel scoreSessionModel = SessionModel();
// //   @override
// //   void initState() {
// //     super.initState();
// //   }
// // }
