// import 'dart:io';
// import 'dart:isolate';
// import 'package:flutter/material.dart';
//
// import 'dart:async';
// import 'dart:ffi';
// import 'dart:ffi' as ffi;
// import 'dart:typed_data';
// import 'package:ffi/ffi.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//
// import 'package:keep_screen_on/keep_screen_on.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:scoring_cam_app/src/core/dependency%20injection/injection_container_new.dart';
// import 'package:scoring_cam_app/src/features/start_session_screen/presentation/view/test_new/socket_service.dart';
// import 'package:scoring_cam_app/src/features/start_session_screen/presentation/view/test_new/stream_manager.dart';
// import 'package:uuid/uuid.dart';
//
// import '../../../../../core/base/app_base.dart';
// import '../../../../../core/constants/assets.gen.dart';
// import '../../../../../core/data/db_helper.dart';
// import '../../../../../core/data/sessions_model.dart';
// import '../../../../../core/theme/colors/app_colors.dart';
// import '../../../../../core/theme/fonts/app_font.dart';
// import '../../../../../core/theme/theme/app_colors.dart';
// import '../../../../../core/utiles/widgets/custom_button.dart';
// import '../../../../bottom_nev/presntation/view/tabs_view.dart';
// import '../../../../home_screen/presentation/view/home_screen.dart';
// import '../../../../saved_session_screen/presentation/view/saved_session_screen.dart';
// import '../../../../train_tab/bloc/app_ble_device_bloc.dart';
// import '../../../../train_tab/bloc/timer_bloc/listning_timer_bloc.dart';
// import 'native_opencv.dart';
// import 'rtsp_service.dart';
//
// bool isBufferInitialized = false;
//
// ListningTimerBloc listeningTimerBloc = getIt<ListningTimerBloc>();
//
// class MyHomePage extends StatefulWidget {
//   final int sessionId;
//   final String gunType;
//   final String bulletType;
//   final String noOfShots;
//
//   const MyHomePage(
//       {super.key,
//       required this.sessionId,
//       required this.gunType,
//       required this.bulletType,
//       required this.noOfShots});
//
//   @override
//   MyHomePageState createState() => MyHomePageState();
// }
//
// class MyHomePageState extends State<MyHomePage> {
//   String _state = 'initial';
//   String startText = 'Open stream';
//   String pipe = 'input';
//   final url = 'rtsp://192.168.42.1/live';
//   late RTSPController rtspController;
//   final serverIp = '192.168.42.1';
//   final serverPort = 7878;
//   int frameIndex = 0;
//   int fps = 0;
//   Completer fpsCompleter = Completer<void>();
//   bool isFrameSizeInitialize = false;
//   Completer frameInitializeCompleter = Completer<void>();
//   DateTime? lastFrameTime;
//   late int frameWidth;
//   late int frameHeight;
//
//   late String tempPath;
//   late Directory dir;
//   var uuid = const Uuid();
//   int _imageIndex = 0;
//   final List<ImageModel> _imageModels = [];
//   late final CameraSocketHandler socketHandler;
//
//   final inputBufferSize = 10 * 1024 * 1024 + 2;
//   final outputBufferSize = 3 * 1024 * 1024;
//   final sizeOfInt32 = ffi.sizeOf<ffi.Int32>();
//   ffi.Pointer<ffi.Uint8>? inputBuffer;
//   ffi.Pointer<ffi.Uint8>? outputBuffer;
//   ffi.Pointer<ffi.Uint8>? detectOnlyBuffer;
//
//   @override
//   void initState() {
//     super.initState();
//     _state = 'initial';
//     startText = 'Open stream';
//     isBufferInitialized = false;
//     isFrameSizeInitialize = false;
//     frameIndex = 0;
//     fps = 0;
//     lastFrameTime = null;
//       inputBuffer = calloc<ffi.Uint8>(inputBufferSize);
//       outputBuffer = calloc<ffi.Uint8>(outputBufferSize);
//       detectOnlyBuffer = calloc<ffi.Uint8>(10 * sizeOfInt32);
//       fpsCompleter = Completer<void>();
//       frameInitializeCompleter = Completer<void>();
//
//     // Initialize RTSP controller
//     socketHandler = CameraSocketHandler(
//       cameraIp: serverIp,
//       commandPort: serverPort,
//       onSessionStarted: _onSessionStarted,
//     );
//     rtspController = RTSPController(url);
//     _requestPermission();
//     KeepScreenOn.turnOn(); // Keep the screen always on
//   }
//
//   @override
//   void dispose() {
//     try {
//       _state = 'initial';
//       startText = 'Open stream';
//       releaseD();
//     } catch (e) {
//       print('Error during dispose: $e');
//     }
//
//     super.dispose();
//   }
//
//   // void pushFrame(Uint8List frame, int inputWidth, int inputHeight) {
//   //   frameWidth = inputWidth;
//   //   frameHeight = inputHeight;
//   //
//   //   // DateTime now = DateTime.now();
//   //   // if (lastFrameTime != null) {
//   //   //   double elapsedSeconds =
//   //   //       now.difference(lastFrameTime!).inMilliseconds / 1000.0;
//   //   //
//   //   //   setState(() {
//   //   //     if (elapsedSeconds > 0) {
//   //   //       double calculatedFps = 1 / elapsedSeconds;
//   //   //       if (calculatedFps.isFinite) {
//   //   //         fps = min(30, calculatedFps.round());
//   //   //       } else {
//   //   //         fps = 0;
//   //   //       }
//   //   //     } else {
//   //   //       fps = 0;
//   //   //     }
//   //   //   });
//   //   // }
//   //   // lastFrameTime = now;
//   //
//   //   // run it
//   //
//   //   if (!isBufferInitialized) {
//   //     // Allocate buffers to communicate with C++ backend
//   //     // inputBuffer = calloc<ffi.Uint8>(inputBufferSize);
//   //     writeInt32ToBuffer(inputBuffer, -1);
//   //
//   //     writeInt32ToBuffer(outputBuffer, -1);
//   //
//   //     detectOnlyBuffer = calloc<ffi.Uint8>(10 * sizeOfInt32);
//   //
//   //     setState(() {
//   //       isBufferInitialized = true;
//   //       if (!frameInitializeCompleter.isCompleted) {
//   //         frameInitializeCompleter.complete();
//   //       }
//   //     });
//   //   }
//   //
//   //   // write image bytes into the input buffer
//   //   inputLock();
//   //   if (mounted) {
//   //     setState(() {
//   //       frameIndex++;
//   //     });
//   //   }
//   //
//   //   // |frame_index|FPS|last_score|num_bytes|frame_bytes|
//   //   writeInt32ToBuffer(inputBuffer, frameIndex);
//   //   writeInt32ToBuffer(inputBuffer + sizeOfInt32, fps);
//   //   writeInt32ToBuffer(inputBuffer + 2 * sizeOfInt32, -1);
//   //
//   //   writeInt32ToBuffer(inputBuffer + 3 * sizeOfInt32, frame.length);
//   //
//   //   writeUint8ListToPointer(inputBuffer + 4 * sizeOfInt32, frame);
//   //   inputUnlock();
//   //
//   //   // Check if fps > 0 and complete the completer
//   //   if (fps > 0 && !fpsCompleter.isCompleted) {
//   //     fpsCompleter.complete();
//   //   }
//   // }
//
//   void pushFrame(Uint8List frame, int inputWidth, int inputHeight) {
//     frameWidth = inputWidth;
//     frameHeight = inputHeight;
//     if (!isBufferInitialized) {
//       inputBuffer = calloc<ffi.Uint8>(inputBufferSize);
//       writeInt32ToBuffer(inputBuffer!, -1);
//
//       outputBuffer = calloc<ffi.Uint8>(outputBufferSize);
//       writeInt32ToBuffer(outputBuffer!, -1);
//
//       detectOnlyBuffer = calloc<ffi.Uint8>(10 * sizeOfInt32);
//       if(mounted){
//         setState(() {
//           isBufferInitialized = true;
//           if (!frameInitializeCompleter.isCompleted) {
//             frameInitializeCompleter.complete();
//           }
//         });
//       }
//     }
//
//     inputLock();
//     setState(() {
//       frameIndex++;
//     });
//     writeInt32ToBuffer(inputBuffer!, frameIndex);
//     writeInt32ToBuffer(inputBuffer! + sizeOfInt32, fps);
//     writeInt32ToBuffer(inputBuffer! + 2 * sizeOfInt32, -1);
//
//     writeInt32ToBuffer(inputBuffer! + 3 * sizeOfInt32, frame.length);
//
//     writeUint8ListToPointer(inputBuffer! + 4 * sizeOfInt32, frame);
//     inputUnlock();
//     if (fps > 0 && !fpsCompleter.isCompleted) {
//       fpsCompleter.complete();
//     }
//   }
//
//   void writeInt32ToBuffer(ffi.Pointer<ffi.Uint8> buffer, int value) {
//     final int32Value = value;
//
//     buffer[0] = (int32Value & 0xFF);
//     buffer[1] = ((int32Value >> 8) & 0xFF);
//     buffer[2] = ((int32Value >> 16) & 0xFF);
//     buffer[3] = ((int32Value >> 24) & 0xFF);
//   }
//
//   void writeUint8ListToPointer(ffi.Pointer<ffi.Uint8> pointer, Uint8List list) {
//     final pointerView = pointer.asTypedList(list.length);
//     pointerView.setAll(0, list);
//   }
//
//   Future<void> run() async {
//     print('====================== Start run()');
//
//     await fpsCompleter.future;
//
//     print('====================== fps completed');
//
//     int platform = -1; // unknown platform
//     if (Platform.isAndroid) {
//       platform = 0;
//     } else if (Platform.isIOS) {
//       platform = 1;
//     }
//
//     final port = ReceivePort();
//
//     final args = ScoreArguments(
//       inputBuffer!.address,
//       platform,
//       fps,
//       frameWidth,
//       frameHeight,
//       outputBuffer!.address,
//       detectOnlyBuffer!.address,
//       port.sendPort,
//       tempPath,
//     );
//
//     Isolate.spawn<ScoreArguments>(
//       score,
//       args,
//       onError: port.sendPort,
//       onExit: port.sendPort,
//     ).then((isolate) {
//       port.listen((message) {
//         if (message == 'success') {
//           setState(() {
//             _state = 'finished';
//           });
//         }
//       });
//     });
//     print('====================== Called score()');
//
//     Future<void>.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         print('====================== Started output listener');
//         // _state = 'predict';
//         pipe = 'output';
//         // showFrame(outputStreamController);
//       });
//     });
//   }
//   void showFrame(
//       ) async {
//     var prevFrameIndex = -1;
//     final streamController = StreamManager();
//
//     await frameInitializeCompleter.future;
//
//     while (true) {
//       if (_state == 'initial' || _state == 'finished') {
//         break;
//       }
//       outputLock();
//
//       var uint8ListView = Uint8List(0);
//       if (pipe == 'output') {
//         uint8ListView = outputBuffer!.asTypedList(outputBufferSize);
//       } else {
//         uint8ListView = inputBuffer!.asTypedList(outputBufferSize);
//       }
//
//       // Read first 4 bytes as a int32
//       final currentFrameIndex =
//       uint8ListView.buffer.asInt32List(0, sizeOfInt32)[0];
//
//       // If there is a new frame has been pushed, read it
//       if (currentFrameIndex > 0 && currentFrameIndex > prevFrameIndex) {
//         prevFrameIndex = currentFrameIndex;
//         // |frame_index|FPS|last_score|num_bytes|frame_bytes|
//         final numberOfBytes =
//         uint8ListView.buffer.asInt32List(3 * sizeOfInt32, sizeOfInt32)[0];
//
//         final frameBytes = uint8ListView.sublist(
//             4 * sizeOfInt32, 4 * sizeOfInt32 + numberOfBytes);
//
//         if (pipe == 'output') {
//           final lastScore =
//           uint8ListView.buffer.asInt32List(2 * sizeOfInt32, sizeOfInt32)[0];
//           if (lastScore > 0) {
//             String imgPath = getImagePath();
//             final imageFile = File(imgPath);
//             imageFile.writeAsBytes(frameBytes);
//             _imageModels
//                 .add(ImageModel(lastScore: lastScore, imagePath: imgPath));
//
//             print('last score: $lastScore');
//             print('last score image path: $imgPath');
//             _imageIndex++;
//           }
//         }
//         // Add data to the stream
//         streamController.addData(frameBytes);
//       }
//       outputUnlock();
//
//       // Simulate some processing time
//       await Future.delayed(const Duration(milliseconds: 10));
//     }
//
//     // Close the stream when the queue is empty
//     print('Display frame stopped');
//     streamController.dispose();
//   }
//
//   getImagePath() {
//     return '${dir.path}/${uuid.v4()}${widget.sessionId}$_imageIndex.png';
//   }
//
//   Future<void> _requestPermission() async {
//     if (await Permission.manageExternalStorage.request().isGranted ||
//         await Permission.storage.request().isGranted) {
//       dir = await getApplicationDocumentsDirectory();
//         uuid = const Uuid();
//         tempPath = '${dir.path}/${uuid.v4()}${widget.sessionId}video.mp4';
//         print("tempPath");
//         print(tempPath);
//
//     } else {
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
//   ValueNotifier<String?> fovOption = ValueNotifier<String?>(null);
//   ValueNotifier<double> currentSliderValue = ValueNotifier<double>(100);
//   bool isPause = false;
//
//   void _onSessionStarted(int token) {
//     socketHandler.resetLiveView(fovOption.value ?? 'wide');
//   }
//
//   void resetStreamManager() {
//     StreamManager().dispose(); // Dispose of old stream
//     StreamManager().ensureStreamController(); // Reinitialize
//     print('Stream manager reset successfully.');
//   }
//   void disposeBuffers() {
//     try {
//       print('Cleaning up resources...');
//       rtspController.stop(); // Stop the RTSP stream
//       StreamManager().dispose(); // Dispose of old stream
//       StreamManager().ensureStreamController(); // Reinitialize
//       // Free allocated buffers
//       if (inputBuffer != null) {
//         calloc.free(inputBuffer!);
//         inputBuffer = null;
//       }
//       if (outputBuffer != null) {
//         calloc.free(outputBuffer!);
//         outputBuffer = null;
//       }
//       if (detectOnlyBuffer != null) {
//         calloc.free(detectOnlyBuffer!);
//         detectOnlyBuffer = null;
//       }
//
//       // Reset state variables
//       isBufferInitialized = false;
//       fpsCompleter = Completer<void>();
//       frameInitializeCompleter = Completer<void>();
//       frameIndex = 0;
//       fps = 0;
//       isFrameSizeInitialize = false;
//       lastFrameTime = null;
//     } catch (e) {
//       print('Error during cleanup: $e');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//
//         body: Stack(children: [
//           Positioned.fill(
//             child: Image.asset(
//               Assets.images.background.path, // Load image from file
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned.fill(
//             child: Container(
//               color: AppColors.black
//                   .withOpacity(0.5), // Semi-transparent black overlay
//             ),
//           ),
//           Positioned(
//             bottom: 100, // 100px from the bottom
//             right: 20, // 20px from the right edge
//             child: SpeedDial(
//               backgroundColor: AppColors.orange,
//               overlayColor: AppColors.transparent,
//               activeForegroundColor: AppColors.transparent,
//               foregroundColor: AppColors.transparent,
//               child: Text(
//                 "2x",
//                 style: TextStyle(color: AppColors.white),
//               ),
//               children: [
//                 SpeedDialChild(
//                   child: Icon(Icons.zoom_in_map),
//                   label: '4x',
//                   onTap: () => print('Accessibility Clicked'),
//                 ),
//                 SpeedDialChild(
//                   child: Icon(Icons.zoom_in_map),
//                   label: '6x',
//                   onTap: () => print('Brush Clicked'),
//                 ),
//                 SpeedDialChild(
//                   child: Icon(Icons.zoom_in_map),
//                   label: '8x',
//                   onTap: () => print('Camera Clicked'),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               SafeArea(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Icon(
//                       Icons.location_searching_sharp,
//                       color: AppColors.white,
//                     ),
//                     Icon(
//                       Icons.toggle_on_rounded,
//                       color: AppColors.orange,
//                       size: 33,
//                     ),
//                     Icon(
//                       Icons.battery_3_bar,
//                       color: AppColors.white,
//                     ),
//                     Icon(
//                       Icons.settings,
//                       color: AppColors.white,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 100,
//               ),
//               (_state == 'open_stream' ||
//                           _state == 'detect_circles' ||
//                           _state == 'predict') &&
//                       isFrameSizeInitialize
//                   ? StreamBuilder<Uint8List>(
//                       stream: StreamManager().stream,
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           return Image.memory(
//                             snapshot.data!,
//                             gaplessPlayback: true,
//                             errorBuilder: (context, error, stackTrace) {
//                               return const Center(
//                                 child: Text('Error displaying image'),
//                               );
//                             },
//                           );
//                         } else if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         } else if (snapshot.connectionState ==
//                                 ConnectionState.done &&
//                             !snapshot.hasData) {
//                           return const Center(child: Text('Stream ended'));
//                         } else if (snapshot.hasError) {
//                           return Center(
//                               child: Text('Error: ${snapshot.error}'));
//                         } else {
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         }
//                       },
//                     )
//                   : SizedBox(),
//               Spacer(),
//               BlocProvider.value(
//                 value: appBleDeviceBloc,
//                 child: BlocBuilder<AppBleDeviceBloc, AppBleDeviceState>(
//                   builder: (context, state) {
//                     int counter = 0;
//                     if (state is CounterUpdated) {
//                       counter = state.counter;
//                     }
//                     return Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Shot: $counter',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleSmall!
//                                 .copyWith(
//                                   color: AppColors.white,
//                                 ),
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Center(
//                 child: Stack(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text('0X'),
//                             ValueListenableBuilder<double>(
//                               valueListenable: currentSliderValue,
//                               builder: (context, value, child) {
//                                 return Slider(
//                                   label: value.round().toString(),
//                                   value: value,
//                                   onChanged: (newValue) {
//                                     // print(newValue.toString());
//                                     currentSliderValue.value = newValue;
//                                     // fovOption.value = newValue;
//                                     // socketHandler.resetLiveView(newValue!);
//                                   },
//                                   onChangeEnd: (value) {
//                                     String newValue = value.toInt().toString();
//                                     print(newValue);
//                                     fovOption.value = newValue;
//                                     socketHandler.resetLiveView(newValue);
//                                     // Handle slider value change end logic here
//                                   },
//
//                                   // divisions: 70,
//                                   min: 30,
//                                   max: 100,
//                                 );
//                               },
//                             ),
//                             const Text('8X'),
//                           ],
//                         ),
//                         // ValueListenableBuilder<String?>(
//                         //   valueListenable: fovOption,
//                         //   builder: (context, selectedFov, child) {
//                         //     return Container(
//                         //       decoration: BoxDecoration(
//                         //         color: Theme.of(context).cardColor,
//                         //         borderRadius:
//                         //             BorderRadius.all(Radius.circular(12)),
//                         //       ),
//                         //       child: DropdownButton<String>(
//                         //         value: selectedFov,
//                         //         hint: const Text('Select FOV'),
//                         //         isExpanded: true,
//                         //         padding: EdgeInsets.all(6),
//                         //         underline: SizedBox(),
//                         //         style: Theme.of(context).textTheme.titleSmall!,
//                         //         dropdownColor: Theme.of(context).cardColor,
//                         //         items: const [
//                         //           DropdownMenuItem(
//                         //               value: 'ultra_wide',
//                         //               child: Text('Ultra Wide')),
//                         //           DropdownMenuItem(
//                         //               value: 'super_wide',
//                         //               child: Text('Super Wide')),
//                         //           DropdownMenuItem(
//                         //               value: 'very_wide',
//                         //               child: Text('Very Wide')),
//                         //           DropdownMenuItem(
//                         //               value: 'wide', child: Text('Wide')),
//                         //           DropdownMenuItem(
//                         //               value: 'medium', child: Text('Medium')),
//                         //           DropdownMenuItem(
//                         //               value: 'narrow', child: Text('Narrow')),
//                         //           DropdownMenuItem(
//                         //               value: 'very_narrow',
//                         //               child: Text('Very Narrow')),
//                         //           DropdownMenuItem(
//                         //               value: 'ultra_narrow',
//                         //               child: Text('Ultra Narrow')),
//                         //           DropdownMenuItem(
//                         //               value: '100', child: Text('100')),
//                         //           DropdownMenuItem(
//                         //               value: '55', child: Text('55')),
//                         //           DropdownMenuItem(
//                         //               value: '65', child: Text('65')),
//                         //           DropdownMenuItem(
//                         //               value: '90', child: Text('90')),
//                         //         ],
//                         //         onChanged: (value) {
//                         //           fovOption.value = value;
//                         //           socketHandler.resetLiveView(value!);
//                         //         },
//                         //       ),
//                         //     );
//                         //   },
//                         // ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               BlocProvider.value(
//                 value: listeningTimerBloc,
//                 child: BlocListener<ListningTimerBloc, ListningTimerState>(
//                   listener: (context, state) {
//                     if (state is TimerRunning) {
//                       if (state.secondsLeft == 0) {
//                         String imgPath = getImagePath();
//                         // final imageFile = File(imgPath);
//                         _imageModels
//                             .add(ImageModel(lastScore: 0, imagePath: imgPath));
//                         _imageIndex++;
//                       }
//                     }
//                   },
//                   child: BlocBuilder<ListningTimerBloc, ListningTimerState>(
//                     builder: (context, state) {
//                       return state.when(
//                         initial: () => Text(
//                           "Ready for Shot...",
//                           style:
//                               Theme.of(context).textTheme.titleSmall!.copyWith(
//                                     color: AppColors.white,
//                                   ),
//                         ),
//                         running: (secondsLeft) => Text(
//                           "after $secondsLeft seconds shot will be consider as a missing shot",
//                           style:
//                               Theme.of(context).textTheme.titleSmall!.copyWith(
//                                     color: AppColors.white,
//                                   ),
//                         ),
//                         // completed: () =>GestureDetector(
//                         //     onTap: () {
//                         //       // context.read<ListningTimerBloc>().add(const StartTimerEvent());
//                         //       listeningTimerBloc
//                         //           .add(const ListningTimerEvent.startTimer());
//                         //     },child: Text("Timer Completed!",style: Theme.of(context).textTheme.titleSmall!.copyWith(),)),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               IconButton(
//                   onPressed: () {
//                     setState(() {
//                       // isPause = rtspController.toggleStream();
//                       if (!isPause) {
//                         isPause = true;
//                         // run();
//                         resume();
//                       }else{
//                         isPause = false;
//
//                         pause();
//                       }
//                     });
//                   },
//                   icon: Icon(
//                     isPause ? Icons.pause_circle : Icons.play_circle,
//                     color: AppColors.white,
//                     size: 34,
//                   )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: CustomButton(
//                         text: startText,
//                         onClick: () async {
//                           if (_state == 'initial') {
//                             resetStreamManager();
//                             if(mounted){
//                             setState(() {
//                               isBufferInitialized = false;
//                               _state = 'open_stream';
//                               startText = 'Detect circles';
//                             });}
//                             socketHandler.initSocket();
//                             // await rtspController.initialize(url, serverIp, serverPort);
//                             final streamInfo =
//                                 await rtspController.readStreamInfo();
//                             print('frame size: ${streamInfo!.width ?? ""} ${streamInfo.height ?? ""}');
//                             // Push the camera frame into the input buffer
//                             rtspController.startImageStream(pushFrame);
//                             isPause = true;
//
//                             // Display frame
//                             if(mounted){
//
//                               setState(() {
//                                 print('frame_size_testing:');
//
//                                 pipe = 'input';
//                                 showFrame();
//                                 fps = streamInfo.fps;
//                                 isFrameSizeInitialize = true;
//                                 print('stream fps $fps');
//                                 print('show frame');
//                               });
//                             }
//
//
//                           }
//                           else if (_state == 'open_stream') {
//                             setState(() {
//                               startText = 'Start scoring';
//                               _state = 'detect_circles';
//                             });
//
//                             // detectOnly lock
//                             detectOnlyLock();
//                             writeInt32ToBuffer(detectOnlyBuffer!, 1);
//                             detectOnlyUnlock();
//
//                             // run();
//                             // detectOnly unlock
//                           }
//                           else if (_state == 'detect_circles') {
//                             setState(() {
//                               startText = 'Running';
//                             });
//                             appBleDeviceBloc.add(
//                               const StartListening(),
//                             );
//
//                             // Start scoring
//                             detectOnlyLock();
//                             writeInt32ToBuffer(detectOnlyBuffer!, 0);
//                             detectOnlyUnlock();
//                             run();
//                           }
//                         },
//                         // onClick: () async {
//                         //   if (_state == 'initial') {
//                         //     try {
//                         //       // Ensure resources are properly reset
//                         //       resetStreamManager();
//                         //       // Update UI state
//                         //       // Initialize socket connection
//                         //       socketHandler.initSocket();
//                         //
//                         //       // Read stream info and start the stream
//                         //       final streamInfo =
//                         //           await rtspController.readStreamInfo();
//                         //       if (streamInfo != null) {
//                         //
//                         //         print(
//                         //             'frame size: ${streamInfo.width ?? ""} ${streamInfo.height ?? ""} ${streamInfo.fps ?? ""}');
//                         //         print('stream fps= $fps');
//                         //
//                         //         // Start the RTSP image stream
//                         //         rtspController.startImageStream(pushFrame);
//                         //         setState(() {
//                         //           pipe = 'input';
//                         //           fps = streamInfo.fps;
//                         //           showFrame(); // Call showFrame to start rendering
//                         //           _state = 'open_stream';
//                         //           startText = 'Detect circles';
//                         //           isFrameSizeInitialize = true;
//                         //           print('stream fps= $fps');
//                         //         });
//                         //         // Display frame
//                         //
//                         //
//                         //
//                         //       }
//                         //       else {
//                         //         print('Error: Stream info is null.');
//                         //       }
//                         //     } catch (e) {
//                         //       print('Error initializing stream: $e');
//                         //     }
//                         //   } else if (_state == 'open_stream') {
//                         //     setState(() {
//                         //       startText = 'Start scoring';
//                         //       _state = 'detect_circles';
//                         //     });
//                         //
//                         //     // Enable detection mode
//                         //     detectOnlyLock();
//                         //     writeInt32ToBuffer(detectOnlyBuffer!, 1);
//                         //     detectOnlyUnlock();
//                         //   } else if (_state == 'detect_circles') {
//                         //     setState(() {
//                         //       startText = 'Running';
//                         //     });
//                         //
//                         //     // Start scoring
//                         //     detectOnlyLock();
//                         //     writeInt32ToBuffer(detectOnlyBuffer!, 0);
//                         //     detectOnlyUnlock();
//                         //
//                         //     run();
//                         //   }
//                         // }
//                         ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: CustomButton(
//                       text: 'Stop',
//                       onClick: () {
//                         // setState(() {
//                         //   // _state = 'finished';
//                         //   _state = 'initial';
//                         //   startText = 'Run';
//                         //    _state = 'initial';
//                         //    startText = 'Open stream';
//                         //   // final outputStreamController = StreamController<Uint8List>();
//                         //    pipe = 'input';
//                         // });
//                         stop();
//                         releaseD();
//                         // Navigator.pop(context);
//                         // Navigator.of(context).pop();
//                         // Navigator.pushAndRemoveUntil(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //       builder: (context) => AppTabsView())
//                         //       // (route) => false, // Remove all previous routes
//                         // );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: CustomButton(
//                         text: 'DISCARD',
//                         onClick: () async {
//                           try {
//                             // Reset application state
//                             print('Resetting state...');
//                             _state = 'initial';
//                             startText = 'Open stream';
//                             frameIndex = 0;
//                             fps = 0;
//                             isFrameSizeInitialize = false;
//                             isBufferInitialized = false;
//                             lastFrameTime = null;
//                             // Dispose of buffers
//                             releaseD();
//                             // Stop Bluetooth operations
//                             appBleDeviceBloc.add(const StopListening());
//                             // Stop RTSP controller and other resources
//                             stop();
//                             // Initialize Bluetooth for next use
//                             appBleDeviceBloc.add(const InitializeBluetooth());
//
//                             // Navigate back to the main view and clear all previous routes
//                             Navigator.pushAndRemoveUntil(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => AppTabsView()),
//                               (route) => false, // Remove all previous routes
//                             );
//                             print('Navigation completed.');
//                           } catch (e) {
//                             // Log any unexpected errors
//                             print('Error during DISCARD operation: $e');
//                           }
//                         },
//                       ),
//                     ),
//
//                     // Expanded(
//                     //   child: CustomButton(
//                     //       text: 'DISCARD',
//                     //       onClick: () async {
//                     //         // Reset state to initial
//                     //         _state = 'initial';
//                     //         startText = 'Open stream';
//                     //         disposeBuffers();
//                     //         try {
//                     //           StreamManager().dispose();
//                     //         } catch (e) {
//                     //           print('Error disposing StreamManager: $e');
//                     //         }
//                     //         frameIndex = 0;
//                     //         fps = 0;
//                     //         isFrameSizeInitialize = false;
//                     //         isBufferInitialized = false;
//                     //         lastFrameTime = null;
//                     //         fpsCompleter = Completer<void>();
//                     //         frameInitializeCompleter = Completer<void>();
//                     //         appBleDeviceBloc.add(const StopListening());
//                     //         stop();
//                     //         rtspController.stop();
//                     //         // release();
//                     //
//                     //         appBleDeviceBloc.add(const InitializeBluetooth());
//                     //
//                     //         Navigator.pushAndRemoveUntil(
//                     //           context,
//                     //           MaterialPageRoute(
//                     //               builder: (context) => AppTabsView()),
//                     //           (route) => false, // Remove all routes.
//                     //         );
//                     //       }),
//                     // ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Expanded(
//                       child: CustomButton(
//                           text: 'SAVE',
//                           onClick: () async {
//                             final imageListJson =
//                                 ImageModel.listToJson(_imageModels);
//
//                             Dbhelper myDb = Dbhelper();
//                             int nextSessionId = await myDb.getNextSessionId();
//                             SessionsModel model = SessionsModel(
//                                 sessionId: nextSessionId,
//                                 gunType: widget.gunType,
//                                 bulletType: widget.bulletType,
//                                 noOfShots: _imageModels.length.toString(),
//                                 newestScore: '7',
//                                 totalScore: '7',
//                                 totalShots: '7',
//                                 averageScore: '7',
//                                 highestScore: '7',
//                                 lowestScore: '71',
//                                 missingScore: '71',
//                                 timeInterval: '71',
//                                 avgTimeInterval: tempPath,
//                                 shotImages: imageListJson);
//                             await myDb.insertSession(model);
//
//                             stop();
//                             rtspController.stop();
//                             releaseD();
//                             appBleDeviceBloc.add(const InitializeBluetooth());
//
//                             Navigator.pushAndRemoveUntil(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const AppTabsView()),
//                               (route) => false, // Remove all routes.
//                             );
//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (context) =>
//                             //             const SavedSession()));
//                           }),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20.h,
//               )
//             ],
//           ),
//         ]));
//   }
//
//   // void showFrame(
//   //   StreamController<Uint8List> streamController,
//   // ) async {
//   //   var prevFrameIndex = -1;
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
//   //       uint8ListView = outputBuffer.asTypedList(outputBufferSize);
//   //     } else {
//   //       uint8ListView = inputBuffer.asTypedList(outputBufferSize);
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
//   //         final state = listeningTimerBloc.state;
//   //         if (lastScore > 0) {
//   //           if (state is TimerInitial) {
//   //             print("state is TimerInitial");
//   //           } else if (state is TimerRunning) {
//   //             print("state is TimerRunning${state.secondsLeft}");
//   //             if (lastScore > 0) {
//   //               String imgPath = getImagePath();
//   //               final imageFile = File(imgPath);
//   //               imageFile.writeAsBytes(frameBytes);
//   //               _imageModels
//   //                   .add(ImageModel(lastScore: lastScore, imagePath: imgPath));
//   //
//   //               print('last score: $lastScore');
//   //               print('last score image path: $imgPath');
//   //               _imageIndex++;
//   //               listeningTimerBloc.add(const ListningTimerEvent.stopTimer());
//   //             }
//   //           }
//   //         }
//   //       }
//   //       // Add data to the stream
//   //       streamController.add(frameBytes);
//   //     }
//   //     outputUnlock();
//   //
//   //     // Simulate some processing time
//   //     await Future.delayed(const Duration(milliseconds: 10));
//   //   }
//   //
//   //   // Close the stream when the queue is empty
//   //   print('Display frame stopped');
//   //   streamController.close();
//   // }
//
//   void releaseD() {
//     disposeBuffers();
//     if(mounted){
//       setState(() {
//         frameIndex = 0;
//         fps = 0;
//         isFrameSizeInitialize = false;
//         isBufferInitialized = false;
//         lastFrameTime = null;
//         fpsCompleter = Completer<void>();
//         frameInitializeCompleter = Completer<void>();
//         startText = 'Open stream';
//         // final outputStreamController = StreamController<Uint8List>();
//         pipe = 'input';
//         _state = 'initial';
//       });
//       print('calling free');
//     }
//   }
// }
//
//
