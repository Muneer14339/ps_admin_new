

import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:typed_data';
import 'package:ffi/ffi.dart';

import 'dart:async';
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/frams_streaming/rtsp_service.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/frams_streaming/socket_service.dart';
import 'package:uuid/uuid.dart';

import '../../../data/model/image_model.dart';

// ///For_streaming
// String state = 'initial';
// String startText = 'Open stream';
// String pipe = 'input';
// const url = 'rtsp://192.168.42.1/live';
// late RTSPController rtspController;
// const serverIp = '192.168.42.1';
// const serverPort = 7878;
// int frameIndex = 0;
// int fps = 0;
// Completer fpsCompleter = Completer<void>();
// bool isFrameSizeInitialize = false;
// bool isBufferInitialized = false;
//
// Completer frameInitializeCompleter = Completer<void>();
// DateTime? lastFrameTime;
// late int frameWidth;
// late int frameHeight;
// String tempPath = 'asssddd';
// late Directory dir;
// var uuid = const Uuid();
// int imageIndex = 0;
// int sessionId = 0;
// final List<ImageModel> imageModels = [];
// late final CameraSocketHandler socketHandler;
// const inputBufferSize = 10 * 1024 * 1024 + 2;
// const outputBufferSize = 3 * 1024 * 1024;
// final sizeOfInt32 = ffi.sizeOf<ffi.Int32>();
// ffi.Pointer<ffi.Uint8>? inputBuffer;
// ffi.Pointer<ffi.Uint8>? outputBuffer;
// ffi.Pointer<ffi.Uint8>? detectOnlyBuffer;
// ValueNotifier<String?> fovOption = ValueNotifier<String?>(null);
// ValueNotifier<double> currentSliderValue = ValueNotifier<double>(100);
// bool isPause = false;
//
