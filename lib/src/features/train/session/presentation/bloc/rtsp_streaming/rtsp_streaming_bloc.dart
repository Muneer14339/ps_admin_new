import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:typed_data';
import 'package:ffi/ffi.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/timer_bloc/listning_timer_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/frams_streaming/rtsp_service.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/frams_streaming/socket_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../../core/services/locator/locator.dart';
import '../../../../connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../../stage/data/local/service/stage_db_helper.dart';
import '../../../../stage/data/model/stage_entity.dart';
import '../../../../train_view.dart';
import '../../../data/model/image_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/session_model.dart';
import '../../component/fram_streaming_widget.dart';
import '../../component/frams_streaming/native_opencv.dart';
import '../../component/frams_streaming/stream_manager.dart';
import '../../view/session_start_view.dart';
import '../../view/session_start_view_updated.dart';
import '../session_bloc/session_bloc.dart';

part 'rtsp_streaming_event.dart';

part 'rtsp_streaming_state.dart';

part 'rtsp_streaming_bloc.freezed.dart';

// final List<ImageModel> imageModels = [];

@injectable
class RtspStreamingBloc extends Bloc<RtspStreamingEvent, RtspStreamingState> {
  ///For_streaming
  bool isSocketHandler = false;
  bool isVideoPlaying = false;
  String pipe = 'input';
  var url = 'rtsp://192.168.42.1/live';
  late RTSPController rtspController;
  // var serverIp = '192.168.42.1';
  // var serverPort = 7878;
  int frameIndex = 0;
  int fps = 0;
  Completer fpsCompleter = Completer<void>();
  bool isFrameSizeInitialize = false;
  bool isBufferInitialized = false;
  bool isStreamStarted = false;
  bool detectOnlyMode = true;
  String? btry;

  Completer frameInitializeCompleter = Completer<void>();
  DateTime? lastFrameTime;
   int frameWidth = 500;
   int frameHeight= 500;
  String tempPath = '';
  late Directory dir;
  var uuid = const Uuid();
  int imageIndex = 0;
  int sessionId = 0;
  late CameraSocketHandler  socketHandler;
  var inputBufferSize = 10 * 1024 * 1024 + 2;
  var outputBufferSize = 3 * 1024 * 1024;
  final sizeOfInt32 = ffi.sizeOf<ffi.Int32>();
  ffi.Pointer<ffi.Uint8>? inputBuffer;
  ffi.Pointer<ffi.Uint8>? outputBuffer;
  ffi.Pointer<ffi.Uint8>? detectOnlyBuffer;
  var slSessionBloc = locator<SessionBloc>();

  RtspStreamingBloc() : super(const RtspStreamingState.initial()) {
    on<RtspStreamingEvent>((event, emit) async {
      await event.when(
          started: (streamMode, distance , withCable) => _startedEvent(emit, streamMode, distance , withCable),
          setFovOptionsEvent: (val , isReset) => _setFovOptionsEvent(emit, val , isReset),
          socketConnectEvent: () => _socketConnectEvent(emit),
          setIsoOptionsEvent: (val) => _setIsoOptionsEvent(emit, val),
          setLightFreqEvent: (val) => _setLightFreqOptionsEvent(emit, val),
          setEvOptionsEvent: (val) => _setEvOptionsEvent(emit, val),
          setVideoResolutionsEvent: (val) => _setVideoResolutionsEvent(emit,  val),
          disposeBloc: (onDisposeSessions) => _disposeBloc(onDisposeSessions, emit),
          stopCircleDetection: () => _stopCircleDetection(emit),
          startStreaming: (bool withCable) => _startStreaming(emit,withCable),
          startFrameProcessing: () => _startFrameProcessing(emit),
          detectCircleProcessingEvent: () => _detectCircleProcessing(emit));
    }
    );
  }


  Future<String?> startBatteryMonitoring() async {
    // Timer.periodic(Duration(seconds: 3), (timer) async {
      BatteryInfo? battery = await socketHandler.getBatteryPower();
      if (battery != null) {

        print('Battery_check_v1: ${battery.status}');
        return battery.status;
      }else{
        return null;
      }
    // });
  }
  Future<void> _requestPermission() async {
    // Use scoped storage permissions for Android 13+
    await Permission.videos.request();
    await Permission.photos.request();
    var status = await Permission.photos.request();
    print("status");
    print(status);
     dir = await getApplicationDocumentsDirectory();
    //   var uuid = const Uuid();
    //   // tempPath = '${dir.path}/${uuid.v4()}.mp4';
    // if (await Permission.videos.request().isGranted) {
    //   // Permission is granted
    //     var uuid = const Uuid();
    //     tempPath = '${dir.path}/${uuid.v4()}.mp4';
    //     print("tempPath=1====$tempPath");
    // } else {
    //   // Permission is not granted
    //   // Handle permission denied scenario
    // }
  }


  Future<void> _socketConnectEvent(Emitter<RtspStreamingState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    // if (!isSocketHandler) {
    //   print('CheckConnectivity_new === 4');
    //     socketHandler = CameraSocketHandler(
    //       onSessionStarted: (int token) async {
    //         print('CheckConnectivity_new==== Init_1');
    //         if(!isSocketHandler){
    //         }
    //         // whenComplete(() async {
    //         //   await socketHandler.resetLiveView('85');
    //         // });
    //
    //         // add(RtspStreamingEvent.setFovOptionsEvent('85', false));
    //         // startBatteryMonitoring();
    //
    //       },
    //       onBatteryInfoReceived: (batteryInfo) {
    //         print('batteryInfo : 🔋 ${batteryInfo.status}');
    //         // Update your UI here
    //       },
    //     );
    //     // isSocketHandler = true;
    //   }


    if (!isSocketHandler) {
      socketHandler = CameraSocketHandler(
        onSessionStarted: (int token) async {
          add(RtspStreamingEvent.setFovOptionsEvent('85', false));
          // startBatteryMonitoring();

        },
        onBatteryInfoReceived: (batteryInfo) {
          print('batteryInfo : 🔋 ${batteryInfo.status}');
          // Update your UI here
        },
      );

      isSocketHandler = true;
    }

      await socketHandler.initSocket();
      // await socketHandler.resetLiveView('85');


    emit(
      state.copyWith(
        isLoading: false,
      ),
    );

  }

  Future<void> _startedEvent(
      Emitter<RtspStreamingState> emit, int streamMode, int dis , bool withCable) async {

    if (!isVideoPlaying) {
      emit(
        state.copyWith(
          isLoading: true,
          isSimpleStream: false,
          error: '',
          isStreamDisposed: false,
          onDisposeSessions: false,
          startText: 'Open stream',
        ),
      );

      try {
        isBufferInitialized = false;
        isFrameSizeInitialize = false;
        frameIndex = 0;
        fps = 0;
        lastFrameTime = null;
        inputBuffer = calloc<ffi.Uint8>(inputBufferSize);
        outputBuffer = calloc<ffi.Uint8>(outputBufferSize);
        detectOnlyBuffer = calloc<ffi.Uint8>(10 * sizeOfInt32);
        fpsCompleter = Completer<void>();
        frameInitializeCompleter = Completer<void>();
        if(!withCable){
        // if (!isSocketHandler) {
        //   socketHandler = CameraSocketHandler(
        //     onSessionStarted: (int token) async {
        //      add(RtspStreamingEvent.setFovOptionsEvent('85', false));
           btry =  await startBatteryMonitoring();
        //
        //     },
        //     onBatteryInfoReceived: (batteryInfo) {
        //       print('batteryInfo : 🔋 ${batteryInfo.status}');
        //       // Update your UI here
        //     },
        //   );
        //
        //   isSocketHandler = true;
        // }

      }

        rtspController = RTSPController(url);
        await _requestPermission();
        // dir = (await getDownloadsDirectory())!;
        // // Handle null case (e.g. some platforms don’t support Downloads)
        // if (dir == null) {
        //   throw Exception("Downloads directory not available on this platform");
        // }
        // Generate UUID
        // final uuid = const Uuid();
        // Construct file path
        //  tempPath = '${dir.path}/${uuid.v4()}_${sessionId}_log.txt';
        // Create the file if it doesn’t exist
        // final file = File(tempPath);
        // if (!await file.exists()) {
        //   await file.create(recursive: true);
        // }
        // dir = await getApplicationDocumentsDirectory();
        // uuid = const Uuid();
        // tempPath = '${dir.path}/${uuid.v4()}${sessionId}log.txt';
        // final dir = await getApplicationDocumentsDirectory();
        // var uuid = const Uuid();
        // tempPath = '${dir.path}/${uuid.v4()}.mp4';
        // print("tempPath=2====$tempPath");

        // await Future<void>.delayed(const Duration(seconds: 2));
        if (streamMode == 1) {
          emit(
            state.copyWith(
              isLoading: false,
              isFovLoading: false,
              isSimpleStream: true,
              error: '',
              streamState: 'initial',
                batteryP: btry??''
            ),
          );
        }
        else {
          emit(
            state.copyWith(
              isLoading: false,
              isFovLoading: false,
              isSimpleStream: true,
              error: '',
              streamState: 'simple_streaming',
                batteryP: btry??''

            ),
          );
        }

        slRtspStreamingBloc.add( RtspStreamingEvent.startStreaming(withCable));
      } catch (e) {
        print('Error__: $e');
        emit(
          state.copyWith(
            error: e.toString(),
            isLoading: false,
            isFovLoading: false,
          ),
        );
      }
    }
  }

  Future<void> _startStreaming(Emitter<RtspStreamingState> emit,bool withCable) async {
    emit(
      state.copyWith(
        isLoading: true,
        isSimpleStream: false,
        error: '',
        isStreamDisposed: false,
        isFovLoading: false,
      ),
    );

    try {
      if (state.streamState == 'initial') {
        isBufferInitialized = false;
        isStreamStarted = true;
        if(!withCable) {
          int checkError = await socketHandler.initSocket();

          if (checkError == 200) {
            print("checkError: -- $checkError");
             Future<void>.delayed(const Duration(seconds: 3), () {
              slRtspStreamingBloc.add(
                  RtspStreamingEvent
                      .setFovOptionsEvent(
                      '85', true));
            });


            final StreamInfo? streamInfo = await rtspController
                .readStreamInfo();

            if (streamInfo != null) {
              // print('frame size_bloc: ${streamInfo.width ?? ""} ${streamInfo.height ?? ""}');
              rtspController.startImageStream(pushFrame);
              // rtspController.checkStr(pushFrame);
              pipe = 'input';
              showFrame();
              fps = 10;
              isFrameSizeInitialize = true;
              print('stream fps $fps');
              print('show frame');
              emit(
                state.copyWith(
                  isLoading: false,
                  isPauseStream: false,
                  streamState: 'detect_circles',
                  startText: 'Detect circles',
                ),
              );
              isVideoPlaying = true;
            }
            else {
              emit(
                state.copyWith(
                  error: '404',
                  isLoading: false,
                ),
              );
            }
          }
          else {
            emit(
              state.copyWith(
                error: '404',
                isLoading: false,
              ),
            );
          }
        }
        else{

            // final bool streamInfo = await rtspController
            //     .readCableInfo();
            // if (streamInfo) {

              rtspController.checkStr(pushFrame);

              pipe = 'input';
              showFrame();
              fps = 15;
              isFrameSizeInitialize = true;
              print('stream fps $fps');
              print('show frame');
              emit(
                state.copyWith(
                  isLoading: false,
                  isPauseStream: false,
                  streamState: 'detect_circles',
                  startText: 'Detect circles',
                ),
              );
              isVideoPlaying = true;
            // } else {
            //   emit(
            //     state.copyWith(
            //       error: '404',
            //       isLoading: false,
            //     ),
            //   );
            // }

        }
      }
      else if (state.streamState == 'simple_streaming') {
        isBufferInitialized = false;
        isStreamStarted = true;
        int checkError = await socketHandler.initSocket();
        if (checkError == 200) {
          print("simple_streaming_checkError: -- $checkError");
          final StreamInfo? streamInfo = await rtspController.readStreamInfo();
          if (streamInfo != null) {
            print(
                'frame size_bloc: ${streamInfo.width ?? ""} ${streamInfo.height ?? ""}');
            rtspController.startImageStreamForSimpleStream(pushFrame);
            pipe = 'input';
            showFrame();
            fps = streamInfo.fps;
            isFrameSizeInitialize = true;
            print('stream fps $fps');
            print('show frame');
            emit(
              state.copyWith(
                isLoading: false,
                isPauseStream: false,
                streamState: 'simple_streaming',
                startText: 'simple_streaming',
              ),
            );
            isVideoPlaying = true;
          } else {
            emit(
              state.copyWith(
                error: '404',
                isLoading: false,
              ),
            );
          }
        } else {
          emit(
            state.copyWith(
              error: '404',
              isLoading: false,
            ),
          );
        }
      }
    } catch (e) {
      print("_startStreaming$e");
      emit(
        state.copyWith(
          error: e.toString(),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _detectCircleProcessing(Emitter<RtspStreamingState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        isStreamDisposed: false,
        isSimpleStream: false,
        error: '',
      ),
    );
    try {
      detectOnlyLock();
      writeInt32ToBuffer(detectOnlyBuffer!, 1);
      detectOnlyUnlock();
      // detectOnlyLock();
      // writeInt32ToBuffer(detectOnlyBuffer!, 0);
      // detectOnlyUnlock();
      //
      // runFP(emit);
      runFP(emit);
      emit(
        state.copyWith(
          isLoading: false,
          isPauseStream: false,
          isStreamDisposed: false,
          streamState: 'open_stream',
          startText: 'Detect circles',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _startFrameProcessing(Emitter<RtspStreamingState> emit) async {
    // emit(
    //   state.copyWith(
    //     isLoading: true,
    //     isStreamDisposed: false,
    //     isSimpleStream: false,
    //     error: '',
    //   ),
    // );
    try {
      // run();

      detectOnlyMode = false;
      detectOnlyLock();
      writeInt32ToBuffer(detectOnlyBuffer!, 0);
      detectOnlyUnlock();
      // runFP(emit);
      // emit(
      //   state.copyWith(
      //     isLoading: false,
      //     isPauseStream: false,
      //     isStreamDisposed: false,
      //   ),
      // );
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
          isLoading: false,
        ),
      );
    }
    // emit(
    //   state.copyWith(
    //     isLoading: false,
    //     isPauseStream: false,
    //     isStreamDisposed: false,
    //   ),
    // );
  }

  Future<void> _setFovOptionsEvent(
      Emitter<RtspStreamingState> emit, String val, bool isReset) async
  {
    emit(
      state.copyWith(
        isFovLoading: true,
        isSimpleStream: false,
        error: '',
        isStreamDisposed: false,
        isReSetting: isReset ? true:false,
      ),
    );

    try {
      await socketHandler.resetLiveView(val);

      await Future<void>.delayed(const Duration(seconds: 3), () {});
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
          isFovLoading: false,
        ),
      );
    }
    emit(
      state.copyWith(
        isFovLoading: false,
        isReSetting: false,

      ),
    );
  }

  Future<void> _setIsoOptionsEvent(
      Emitter<RtspStreamingState> emit, String val) async {
    emit(
      state.copyWith(
        isFovLoading: true,
        isSimpleStream: false,
        error: '',
        isStreamDisposed: false,
      ),
    );

    try {
      await socketHandler.rebootView();

      await Future<void>.delayed(const Duration(seconds: 3), () {});
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
          isFovLoading: false,
        ),
      );
    }
    emit(
      state.copyWith(
        isFovLoading: false,
      ),
    );
  }

  Future<void> _setLightFreqOptionsEvent(
      Emitter<RtspStreamingState> emit, String val) async {
    emit(
      state.copyWith(
        isFovLoading: true,
        isSimpleStream: false,
        error: '',
        isStreamDisposed: false,
      ),
    );

    try {
      await socketHandler.setLightFreq(val);

      await Future<void>.delayed(const Duration(seconds: 3), () {});
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
          isFovLoading: false,
        ),
      );
    }
    emit(
      state.copyWith(
        isFovLoading: false,
      ),
    );
  }

  Future<void> _setEvOptionsEvent(
      Emitter<RtspStreamingState> emit, String val) async {
    emit(
      state.copyWith(
        isFovLoading: true,
        isSimpleStream: false,
        error: '',
        isStreamDisposed: false,
      ),
    );

    try {
      await socketHandler.setEv(val);
      await Future<void>.delayed(const Duration(seconds: 3), () {});
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
          isFovLoading: false,
        ),
      );
    }
    emit(
      state.copyWith(
        isFovLoading: false,
      ),
    );
  }

  Future<void> _setVideoResolutionsEvent(
      Emitter<RtspStreamingState> emit, String val) async {
    emit(
      state.copyWith(
        // isLoading: true,
        isSimpleStream: false,
        error: '',
        isStreamDisposed: false,
      ),
    );

    try {
      // await socketHandler.setLowResolution(val);
      await socketHandler.setWhiteBalance(val);

      await Future<void>.delayed(const Duration(seconds: 3), () {});
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
          isLoading: false,
        ),
      );
    }
    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }

  // void pushFrame(Uint8List frame, int inputWidth, int inputHeight) {
  //   frameWidth = inputWidth;
  //   frameHeight = inputHeight;
  //   if (!isBufferInitialized) {
  //     inputBuffer = calloc<ffi.Uint8>(inputBufferSize);
  //     writeInt32ToBuffer(inputBuffer!, -1);
  //     outputBuffer = calloc<ffi.Uint8>(outputBufferSize);
  //     writeInt32ToBuffer(outputBuffer!, -1);
  //     detectOnlyBuffer = calloc<ffi.Uint8>(10 * sizeOfInt32);
  //     isBufferInitialized = true;
  //     if (!frameInitializeCompleter.isCompleted) {
  //       frameInitializeCompleter.complete();
  //     }
  //   }
  //   inputLock();
  //   frameIndex++;
  //   writeInt32ToBuffer(inputBuffer!, frameIndex);
  //   writeInt32ToBuffer(inputBuffer! + sizeOfInt32, fps);
  //   writeInt32ToBuffer(inputBuffer! + 2 * sizeOfInt32, -1);
  //
  //   writeInt32ToBuffer(inputBuffer! + 3 * sizeOfInt32, frame.length);
  //
  //   writeUint8ListToPointer(inputBuffer! + 4 * sizeOfInt32, frame);
  //   inputUnlock();
  //   if (fps > 0 && !fpsCompleter.isCompleted) {
  //     fpsCompleter.complete();
  //   }
  // }

  void pushFrame(Uint8List frame, int inputWidth, int inputHeight) {
    frameBytesMissingShot = frame;
      frameWidth = inputWidth;
      frameHeight = inputHeight;

    if (!isBufferInitialized) {
      print("🚀 Initializing Buffers...");

      inputBuffer = calloc<ffi.Uint8>(inputBufferSize);
      writeInt32ToBuffer(inputBuffer!, -1);

      outputBuffer = calloc<ffi.Uint8>(outputBufferSize);
      writeInt32ToBuffer(outputBuffer!, -1);

      detectOnlyBuffer = calloc<ffi.Uint8>(10 * sizeOfInt32);

      isBufferInitialized = true;
      print("✅ Buffers Initialized.");

      if (!frameInitializeCompleter.isCompleted) {
        frameInitializeCompleter.complete();
      }
    }

    // ✅ Ensure buffers are still valid before using them
    if (inputBuffer == null || outputBuffer == null) {
      print(
          "🚨 Error: Buffers were not initialized correctly. Skipping frame.");
      return;
    }

    inputLock();
    frameIndex++;
    writeInt32ToBuffer(inputBuffer!, frameIndex);
    writeInt32ToBuffer(inputBuffer! + sizeOfInt32, fps);
    writeInt32ToBuffer(inputBuffer! + 2 * sizeOfInt32, -1);
    writeInt32ToBuffer(inputBuffer! + 3 * sizeOfInt32, frame.length);
    writeUint8ListToPointer(inputBuffer! + 4 * sizeOfInt32, frame);
    inputUnlock();



    if (fps > 0 && !fpsCompleter.isCompleted) {
      fpsCompleter.complete();
    }
  }

  void writeInt32ToBuffer(ffi.Pointer<ffi.Uint8> buffer, int value) {
    final int32Value = value;

    buffer[0] = (int32Value & 0xFF);
    buffer[1] = ((int32Value >> 8) & 0xFF);
    buffer[2] = ((int32Value >> 16) & 0xFF);
    buffer[3] = ((int32Value >> 24) & 0xFF);
  }

  void writeUint8ListToPointer(ffi.Pointer<ffi.Uint8> pointer, Uint8List list) {
    final pointerView = pointer.asTypedList(list.length);
    pointerView.setAll(0, list);
  }

  // Future<void> runFP(Emitter<RtspStreamingState> emit) async {
  //   print('====================== Start run()');
  //
  //   await fpsCompleter.future;
  //
  //   print('====================== fps completed');
  //
  //   int platform = -1; // unknown platform
  //   if (Platform.isAndroid) {
  //     platform = 0;
  //   } else if (Platform.isIOS) {
  //     platform = 1;
  //   }
  //
  //   final port = ReceivePort();
  //
  //   final args = ScoreArguments(
  //     inputBuffer!.address,
  //     platform,
  //     fps,
  //     frameWidth,
  //     frameHeight,
  //     outputBuffer!.address,
  //     detectOnlyBuffer!.address,
  //     port.sendPort,
  //     tempPath,
  //   );
  //
  //   Isolate.spawn<ScoreArguments>(
  //     score,
  //     args,
  //     onError: port.sendPort,
  //     onExit: port.sendPort,
  //   ).then((isolate) {
  //     port.listen((message) {
  //       if (message == 'success') {
  //         emit(
  //           state.copyWith(
  //             isLoading: false,
  //             isPauseStream: false,
  //             streamState: 'finished',
  //             startText: 'Running',
  //           ),
  //         );
  //       }
  //     });
  //   });
  //   print('====================== Called score()');
  //   Future<void>.delayed(const Duration(seconds: 2), () {
  //     pipe = 'output';
  //   });
  // }

  Future<void> runFP(Emitter<RtspStreamingState> emit) async {
    print('====================== Start run()');

    await fpsCompleter.future;
    print('====================== fps completed');

    int platform = -1; // unknown platform
    if (Platform.isAndroid) {
      platform = 0;
    } else if (Platform.isIOS) {
      platform = 1;
    }

    final port = ReceivePort();

    final args = ScoreArguments(
      inputBuffer!.address,
      platform,
      fps,
      frameWidth,
      frameHeight,
      outputBuffer!.address,
      detectOnlyBuffer!.address,
      port.sendPort,
      tempPath,
    );

    Isolate.spawn<ScoreArguments>(
      score,
      args,
      onError: port.sendPort,
      onExit: port.sendPort,
    ).then((isolate) {
      port.listen((message) {
        if (message == 'success') {
          if (!emit.isDone) {
            // ✅ Check before emitting
            emit(
              state.copyWith(
                isLoading: false,
                isPauseStream: false,
                isStreamDisposed: false,
                streamState: 'finished',
                startText: 'Running',
              ),
            );
          } else {
            print("🚨 Bloc is closed, skipping emit()");
          }
        }
      });
    });

    print('====================== Called score()');
    // emit(
    //   state.copyWith(
    //     isLoading: false,
    //     isPauseStream: false,
    //     isStreamDisposed: false,
    //     streamState: 'open_stream',
    //     startText: 'Detect circles',
    //   ),
    // );
    Future<void>.delayed(const Duration(seconds: 2), () {
      pipe = 'output';
    });
  }

  // void showFrame() async {
  //   var prevFrameIndex = -1;
  //   final streamController = StreamManager();
  //
  //   await frameInitializeCompleter.future;
  //
  //   while (true) {
  //     if (state == 'initial' || state == 'finished') {
  //       break;
  //     }
  //     outputLock();
  //
  //     var uint8ListView = Uint8List(0);
  //     if (pipe == 'output' && outputBuffer!=null) {
  //       uint8ListView = outputBuffer!.asTypedList(outputBufferSize);
  //     } else if (pipe == 'input' && inputBuffer!=null) {
  //       uint8ListView = inputBuffer!.asTypedList(outputBufferSize);
  //     }else{
  //       return ;
  //     }
  //
  //     // Read first 4 bytes as a int32
  //     final currentFrameIndex =
  //         uint8ListView.buffer.asInt32List(0, sizeOfInt32)[0];
  //
  //     // If there is a new frame has been pushed, read it
  //     if (currentFrameIndex > 0 && currentFrameIndex > prevFrameIndex) {
  //       prevFrameIndex = currentFrameIndex;
  //       // |frame_index|FPS|last_score|num_bytes|frame_bytes|
  //       final numberOfBytes =
  //           uint8ListView.buffer.asInt32List(3 * sizeOfInt32, sizeOfInt32)[0];
  //
  //       final frameBytes = uint8ListView.sublist(
  //           4 * sizeOfInt32, 4 * sizeOfInt32 + numberOfBytes);
  //
  //       if (pipe == 'output') {
  //         final lastScore =
  //             uint8ListView.buffer.asInt32List(2 * sizeOfInt32, sizeOfInt32)[0];
  //         if (listeningTimerBloc.timer!=null) {
  //         if (lastScore > 0 && listeningTimerBloc.timer!.isActive) {
  //           String imgPath = '${dir.path}/${uuid.v4()}$sessionId$imageIndex.png';
  //           final imageFile = File(imgPath);
  //           imageFile.writeAsBytes(frameBytes);
  //           // imageModels.add(ImageModel(lastScore: lastScore, imagePath: imgPath));
  //           totalScores = totalScores + lastScore;
  //           shootModel = ShootModel(
  //               parTime: 0,
  //               shootImagePath: imgPath,
  //               shootNumber: stateBle_counter,
  //               shootScore: lastScore);
  //           listShoots.add(shootModel);
  //           print('last score: ${shootModel.shootScore}');
  //           imageIndex++;
  //           listeningTimerBloc.add(const ListningTimerEvent.onShotDetectedEvent());
  //         }
  //         }
  //       }
  //       // Add data to the stream
  //       streamController.addData(frameBytes);
  //     }
  //     outputUnlock();
  //
  //     // Simulate some processing time
  //     await Future.delayed(const Duration(milliseconds: 10));
  //   }
  //
  //   // Close the stream when the queue is empty
  //   print('Display frame stopped');
  //   streamController.dispose();
  // }

  ///27 jun
//   void showFrame() async {
//     final seenFrames = <int>{};
//
//     var prevFrameIndex = -1;
//     final streamController = StreamManager();
//
//     // Wait until frame initialization is complete.
//     await frameInitializeCompleter.future;
//
//     // Decide if you're in detect-only mode.
//     // In detect-only mode, the 3rd int32 field is the circle count.
//     // In normal mode, the 3rd int32 field is the last score.
//
//     while (true) {
//       if (state == 'initial' || state == 'finished') {
//         break;
//       }
//       outputLock();
//
//       Uint8List uint8ListView = Uint8List(0);
//       if (pipe == 'output' && outputBuffer != null) {
//         uint8ListView = outputBuffer!.asTypedList(outputBufferSize);
//       } else if (pipe == 'input' && inputBuffer != null) {
//         uint8ListView = inputBuffer!.asTypedList(outputBufferSize);
//       } else {
//         outputUnlock();
//         return;
//       }
//
//       // Read the first 4 bytes (frame_index).
//       final currentFrameIndex =
//           uint8ListView.buffer.asInt32List(0, sizeOfInt32)[0];
//       // 2) Parse header (4 × int32)
//       // final header = uint8ListView.buffer.asInt32List(0, 4);
//       // final frameIndex     = header[0];
//       // final fps            = header[1];
//       // int lastScore      = header[2];
//       // final imageByteCount = header[3];
//
//       // Process only if there's a new frame.
//       if (currentFrameIndex > 0 && !seenFrames.contains(currentFrameIndex)) {
//         seenFrames.add(currentFrameIndex);
//         // && currentFrameIndex > prevFrameIndex && currentFrameIndex != prevFrameIndex) {
//         // print('Track_Double_shots frame_index====  : $currentFrameIndex > $prevFrameIndex');
//         prevFrameIndex = currentFrameIndex;
//         // Layout: |frame_index|FPS|scoreOrCircleCount|num_bytes|frame_bytes|
//         final numberOfBytes =
//             uint8ListView.buffer.asInt32List(3 * sizeOfInt32, sizeOfInt32)[0];
//         // Extract PNG/JPEG (etc.) bytes for this frame.
//         final frameBytes = uint8ListView.sublist(
//             4 * sizeOfInt32, 4 * sizeOfInt32 + numberOfBytes);
//         if (pipe == 'output') {
//           // Read the 3rd int32 — either last score or circle count.
//           final int detectedValue =
//               uint8ListView.buffer.asInt32List(2 * sizeOfInt32, sizeOfInt32)[0];
//           final int detectedValue1 =
//               uint8ListView.buffer.asInt32List(2 * sizeOfInt32, sizeOfInt32)[1];
//           // print('Track_Double_shots detectedValue1 ==== 1 : $detectedValue1');
//
//           if (detectOnlyMode) {
//             print('Number of detected circles detectOnlyMode: $detectedValue');
//             streamController.addRingsData(detectedValue);
//
//           } else {
//             if (listeningTimerBloc.timer != null) {
//                       print('🔢 Current frame detectedValue #$detectedValue1 score: $detectedValue');
//                       // print('🔢 Current frame frameIndex #$frameIndex score: $lastScore');
//
//               if (detectedValue > 0 && listeningTimerBloc.timer!.isActive) {
//                 String imgPath =
//                     '${dir.path}/${uuid.v4()}$sessionId$imageIndex.png';
//                 final imageFile = File(imgPath);
//                 imageFile.writeAsBytes(frameBytes);
//                 // imageModels.add(ImageModel(lastScore: lastScore, imagePath: imgPath));
//                 shootModel = ShootModel(
//                     parTime: 0,
//                     shootImagePath: imgPath,
//                     shootNumber: stateBle_counter,
//                     shootScore: detectedValue,
//                     shotDirection: "↘ SE");
//                 listShoots.add(shootModel);
//                 print('last score: ${shootModel.shootScore}');
//
//                 imageIndex++;
//                 // listeningTimerBloc.timer = null;
//                 listeningTimerBloc
//                     .add(const ListningTimerEvent.onShotDetectedEvent());
//               }
//             }
//           }
//         }
//
//         // Pass frame to any UI consumers.
//         streamController.addData(frameBytes);
//       }
//       outputUnlock();
//
//       // Small delay to avoid tight loop.
//       await Future.delayed(const Duration(milliseconds: 20));
//     }
//
//     // Close the stream when done.
//     print('Display frame stopped');
//     streamController.dispose();
//   }
  ///Latest One_

  void showFrame() async {
    final seenFrames = <int>{};
    final streamController = StreamManager();

    // Wait until frame initialization is complete.
    await frameInitializeCompleter.future;

    int intBytes = sizeOfInt32; // typically 4

    while (true) {
      if (state == 'initial' || state == 'finished') {
        break;
      }

      outputLock();
      Uint8List uint8ListView;
      if (pipe == 'output' && outputBuffer != null) {
        uint8ListView = outputBuffer!.asTypedList(outputBufferSize);
      } else if (pipe == 'input' && inputBuffer != null) {
        uint8ListView = inputBuffer!.asTypedList(outputBufferSize);
      } else {
        outputUnlock();
        return;
      }

      final header = uint8ListView.buffer.asInt32List(0, 4);
      final frameIndex = header[0];
      final fps = header[1];
      int lastScore = header[2];
      final imageByteCount = header[3];

      // 4) Process only new frames
      if (frameIndex > 0 && !seenFrames.contains(frameIndex)) {
        seenFrames.add(frameIndex);

        // Extract the image bytes
        final start = 4 * intBytes;
        final frameBytes = uint8ListView.sublist(start, start + imageByteCount);

        if (pipe == 'output') {
          if (detectOnlyMode) {
            streamController.addRingsData(lastScore);
            // streamController.addRingsData(6);
          } else {
            // Only proceed if the timer is active
            final int detectedValue = uint8ListView.buffer
                .asInt32List(2 * sizeOfInt32, sizeOfInt32)[0];
            // final timer = listeningTimerBloc.timer;
            String directionName;
            switch (fps) {
              case 0:
                directionName = '⏺ C';
                break; // West
              case 8:
                directionName = '← W';
                break; // West
              case 1:
                directionName = '↖ NW';
                break; // Northwest
              case 2:
                directionName = '↑ N';
                break; // North
              case 3:
                directionName = '↗ NE';
                break; // Northeast
              case 4:
                directionName = '→ E';
                break; // East
              case 5:
                directionName = '↘ SE';
                break; // Southeast
              case 6:
                directionName = '↓ S';
                break; // South
              case 7:
                directionName = '↙ SW';
                break; // Southwest
              default:
                directionName = '🔴';
                break; //🔴🔁⛔🛑⭕❌🚫 fallback
            }
            DateTime currentTime = DateTime.now();

            double timeDifference = startTimeCheck != null
                ? currentTime
                .difference(startTimeCheck!)
                .inMilliseconds /
                1000.0
                : 0.000;
            // if( timeDifference>0.500){
            //   frameBytesMissingShot = frameBytes;
            // }
            // if (detectedValue > 4 && timer != null && timer.isActive) {

            if (detectedValue >=0 &&  timeDifference>0.500) {
              if(!listeningTimerBloc.isBleActiveBloc){
                stateBle_counter++;
                shootModel = ShootModel(
                    parTime: 0,
                    shootImagePath: "imgPath",
                    shootNumber: stateBle_counter,
                    shootScore: 0,
                    splitTime: '0.00',
                    shotDirection: '⏳');
                listShoots.add(shootModel);
              }
              // Save the image to disk
              final imgPath =
                  '${dir.path}/${uuid.v4()}$sessionId$imageIndex.png';
              File(imgPath).writeAsBytesSync(frameBytes);

              final shot = ShootModel(
                parTime: 0,
                shootImagePath: imgPath,
                shootNumber: stateBle_counter,
                shootScore: detectedValue,
                shotDirection: directionName,
              );
              // print("timeDifferenceCheck===$timeDifference");
              frameBytesMissingShot = null;
              if(timeDifference>0.500){
                listShoots[listShoots.length-1] = shot;
              }
              startTimeCheck = currentTime;
              // Log the shot details
              print('🎯Shot #$imageIndex: '
                  'Score=${listShoots[listShoots.length-1].shootScore}, '
                  'Path=${listShoots[listShoots.length-1].shootImagePath}');

              imageIndex++;

              // Prevent duplicate logs by cancelling the timer
              // timer.cancel();

              // Notify the bloc that a shot was detected
              listeningTimerBloc
                  .add(const ListningTimerEvent.onShotDetectedEvent(false));
            }
            // else if (detectedValue == 0) {
            //   listeningTimerBloc
            //       .add(const ListningTimerEvent.onShotDetectedEvent(false));
            //   print('🎯Shot_missing #$imageIndex: '
            //       'Score=$detectedValue, ');
            // }
            else {
              //   if (listeningTimerBloc.state is! TimerRunning || listeningTimerBloc.state is! Initial || listeningTimerBloc.state is OnShotDetected) {
              //   listeningTimerBloc.add(const ListningTimerEvent.stopTimer());
              //   print("check_listeningTime_inRtspBloc=====${listeningTimerBloc.state}");
              // }

            }
          }
        }
        streamController.addData(frameBytes);
      }

      outputUnlock();

      // Small delay to avoid a tight loop
      await Future.delayed(const Duration(milliseconds: 20));
    }

    print('🛑 Display frame stopped');
    streamController.dispose();
  }

  Future<void> _disposeBloc(
      bool onDisposeSessions, Emitter<RtspStreamingState> emit) async {
    debugPrint("RtspStreamingBloc is being disposed");
    // add(RtspStreamingEvent.setFovOptionsEvent('80',true));
    // await Future.delayed(const Duration(milliseconds: 400));

    pipe = 'input';
    isStreamStarted = false;
    detectOnlyMode = true;
    if (!isClosed) {
      stop();
    } else {
      debugPrint("❌ RtspStreamingBloc == isClosed");
    }
    await Future.delayed(const Duration(milliseconds: 400));

    try {
      await rtspController.disposeRTSP();
    } catch (e) {
      debugPrint("❌ Error disposing rtspController: $e");
    }

    await Future.delayed(const Duration(milliseconds: 100));
    try {
      await socketHandler.disposeSocket();
    } catch (e) {
      debugPrint("❌ Error disposing disposeSocket: $e");
    }
    if (inputBuffer != null) {
      malloc.free(inputBuffer!);
      inputBuffer = null;
    }
    if (outputBuffer != null) {
      malloc.free(outputBuffer!);
      outputBuffer = null;
    }
    if (detectOnlyBuffer != null) {
      malloc.free(detectOnlyBuffer!);
      detectOnlyBuffer = null;
    }

    // 🚀 Complete async operations safely
    if (!fpsCompleter.isCompleted) fpsCompleter.complete();
    if (!frameInitializeCompleter.isCompleted) {
      frameInitializeCompleter.complete();
    }
    isVideoPlaying = false;
    await Future.delayed(const Duration(milliseconds: 100));

    onDisposeSessions
        ? emit(
            state.copyWith(
              error: '',
              isLoading: false,
              isSimpleStream: false,
              isStreamDisposed: false,
              onDisposeSessions: true,
            ),
          )
        : emit(
            state.copyWith(
              error: '',
              isLoading: false,
              isSimpleStream: false,
              isStreamDisposed: true,
            ),
          );
  }

  Future<void> _stopCircleDetection(Emitter<RtspStreamingState> emit) async {
    debugPrint("RtspStreamingBloc is being disposed");
    pipe = 'input';
    // isStreamStarted = false;
    detectOnlyMode = true;
    if (!isClosed) {
      stop();
    } else {
      debugPrint("RtspStreamingBloc == isClosed");
    }
    emit(
      state.copyWith(
        isLoading: false,
        isPauseStream: false,
        streamState: 'detect_circles',
        startText: 'Detect circles',
      ),
    );

    // onDisposeSessions
    //     ? emit(
    //         state.copyWith(
    //           error: '',
    //           isLoading: false,
    //           isSimpleStream: false,
    //           isStreamDisposed: false,
    //           onDisposeSessions: true,
    //         ),
    //       )
    //     : emit(
    //         state.copyWith(
    //           error: '',
    //           isLoading: false,
    //           isSimpleStream: false,
    //           isStreamDisposed: true,
    //         ),
    //       );
  }

//
// @override
// Future<void> close() async {
//   debugPrint("RtspStreamingBloc is being disposed");
//   // Stop streaming and release RTSP controller
//   stop();
//   pipe = 'input';
//   // add(const RtspStreamingEvent.started());
//   // await Future.delayed(const Duration(milliseconds: 200));
//   try {
//     await rtspController.disposeRTSP();
//   } catch (e) {
//     debugPrint("Error disposing rtspController: $e");
//   }
//   // Release FFI memory allocations
//   if (inputBuffer != null) {
//     malloc.free(inputBuffer!);
//     inputBuffer = calloc<ffi.Uint8>(inputBufferSize);
//   }
//   if (outputBuffer != null) {
//     malloc.free(outputBuffer!);
//     outputBuffer = calloc<ffi.Uint8>(outputBufferSize);
//   }
//   if (detectOnlyBuffer != null) {
//     malloc.free(detectOnlyBuffer!);
//     detectOnlyBuffer = calloc<ffi.Uint8>(10 * sizeOfInt32);
//   }
//   // Cancel any active async operations
//   if (!fpsCompleter.isCompleted) {
//     fpsCompleter.complete();
//   }
//   if (!frameInitializeCompleter.isCompleted) {
//     frameInitializeCompleter.complete();
//   }
//
//   // Dispose ValueNotifiers
//   fovOption = ValueNotifier<String?>(null);
//   currentSliderValue = ValueNotifier<double>(100);
//
//   return super.close();
// }
}
