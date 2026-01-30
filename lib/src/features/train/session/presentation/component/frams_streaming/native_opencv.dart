import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:isolate';
import 'package:ffi/ffi.dart';

// C function signatures
typedef _CVersionFunc = ffi.Pointer<Utf8> Function();
typedef _CScoreFunc = ffi.Int32 Function(
  ffi.Pointer<ffi.Uint8>,
  ffi.Int32,
  ffi.Int32,
  ffi.Int32,
  ffi.Int32,
  ffi.Pointer<ffi.Uint8>,
    ffi.Pointer<ffi.Uint8>,
    ffi.Pointer<Utf8>,
);
typedef _CLock = ffi.Void Function();
typedef _CUnlock = ffi.Void Function();
typedef _CStop = ffi.Void Function();
typedef _CPause = ffi.Void Function();
typedef _CResume = ffi.Void Function();
typedef _CIsBleActive = ffi.Void Function();
typedef _CIsBleStop = ffi.Void Function();
typedef _CInputLock = ffi.Void Function();
typedef _CInputUnlock = ffi.Void Function();
typedef _CDetectOnlyLock = ffi.Void Function();
typedef _CDetectOnlyUnlock = ffi.Void Function();

// Dart function signatures
typedef _VersionFunc = ffi.Pointer<Utf8> Function();
typedef _ScoreFunc = int Function(
  ffi.Pointer<ffi.Uint8>,
  int,
  int,
  int,
  int,
  ffi.Pointer<ffi.Uint8>,
    ffi.Pointer<ffi.Uint8>,
    ffi.Pointer<Utf8>
);
typedef _LockFunc = void Function();
typedef _UnlockFunc = void Function();
typedef _StopFunc = void Function();
typedef _PauseFunc = void Function();
typedef _IsBleActiveFunc = void Function();
typedef _IsBleStopFunc = void Function();
typedef _ResumeFunc = void Function();
typedef _InputLockFunc = void Function();
typedef _InputUnlockFunc = void Function();
typedef _DetectOnlyLockFunc = void Function();
typedef _DetectOnlyUnlockFunc = void Function();

// Getting a library that holds needed symbols
ffi.DynamicLibrary _openDynamicLibrary() {
  if (Platform.isAndroid) {
    return ffi.DynamicLibrary.open('libnative_opencv.so');
  } else if (Platform.isWindows) {
    return ffi.DynamicLibrary.open("native_opencv_windows_plugin.dll");
  }

  return ffi.DynamicLibrary.process();
}

ffi.DynamicLibrary _lib = _openDynamicLibrary();

// Looking for the functions
final _VersionFunc _version =
    _lib.lookup<ffi.NativeFunction<_CVersionFunc>>('version').asFunction();
final _ScoreFunc _score =
    _lib.lookup<ffi.NativeFunction<_CScoreFunc>>('score').asFunction();

final _LockFunc _lock =
    _lib.lookup<ffi.NativeFunction<_CLock>>('lock').asFunction();
final _UnlockFunc _unlock =
    _lib.lookup<ffi.NativeFunction<_CUnlock>>('unlock').asFunction();
final _StopFunc _stop =
    _lib.lookup<ffi.NativeFunction<_CStop>>('stop').asFunction();

final _ResumeFunc _resume =
    _lib.lookup<ffi.NativeFunction<_CResume>>('resumeS').asFunction();
final _PauseFunc _pause =
    _lib.lookup<ffi.NativeFunction<_CPause>>('pauseS').asFunction();

final _IsBleActiveFunc _isBleActive =
    _lib.lookup<ffi.NativeFunction<_CIsBleActive>>('isBleActive').asFunction();
final _IsBleStopFunc _isBleStop =
    _lib.lookup<ffi.NativeFunction<_CIsBleStop>>('isBleStop').asFunction();

final _InputLockFunc _inputLock =
    _lib.lookup<ffi.NativeFunction<_CInputLock>>('inputLock').asFunction();
final _InputUnlockFunc _inputUnlock =
    _lib.lookup<ffi.NativeFunction<_CInputUnlock>>('inputUnlock').asFunction();

final _DetectOnlyLockFunc _detectOnlyLock =
_lib.lookup<ffi.NativeFunction<_CDetectOnlyLock>>('detectOnlyLock').asFunction();
final _DetectOnlyUnlockFunc _detectOnlyUnlock =
_lib.lookup<ffi.NativeFunction<_CDetectOnlyUnlock>>('detectOnlyUnlock').asFunction();

String opencvVersion() {
  return _version().toDartString();
}

Future<void> score(ScoreArguments args) async {
  final ret = _score(
    ffi.Pointer.fromAddress(args.inputBufferAddress),
    args.platform,
    args.fps,
    args.frameWidth,
    args.frameHeight,
    ffi.Pointer.fromAddress(args.bufferAddress),
    ffi.Pointer.fromAddress(args.detectOnlyAddress),
      args.outputPath.toNativeUtf8()
  );
  SendPort? sendPort = args.sendPort;
  if (ret >= 0) {
    sendPort.send('success');
  }
  sendPort.send('error');
}

void outputLock() {
  _lock();
}

void outputUnlock() {
  _unlock();
}

void inputLock() {
  _inputLock();
}

void inputUnlock() {
  _inputUnlock();
}

void stop() {
  _stop();
}

void pause() {
  _pause();
}

void isBleStop() {
  print("object");
  _isBleStop();
}
void isBleActive() {
  print("objecta");

  _isBleActive();
}

void resume() {
  _resume();
}

void detectOnlyLock() {
  _detectOnlyLock();
}

void detectOnlyUnlock() {
  _detectOnlyUnlock();
}

class ScoreArguments {
  final int inputBufferAddress;
  final int platform;
  final int fps;
  final int frameWidth;
  final int frameHeight;
  final int bufferAddress;
  final int detectOnlyAddress;
  final SendPort sendPort;
  final String outputPath;

  ScoreArguments(
    this.inputBufferAddress,
    this.platform,
    this.fps,
    this.frameWidth,
    this.frameHeight,
    this.bufferAddress,
    this.detectOnlyAddress,
    this.sendPort,
    this.outputPath,
  );
}
