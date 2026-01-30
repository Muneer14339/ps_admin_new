// // native_opencv_bridge.dart
//
// import 'dart:ffi' as ffi;
// import 'dart:io';
// import 'package:ffi/ffi.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:uuid/uuid.dart';
// import 'package:file_picker/file_picker.dart';
//
// /// Dart-side typedef matching C signature:
// /// int process_video(const char* input_path, const char* output_path);
// typedef _CProcessVideo = ffi.Int32 Function(
//     ffi.Pointer<Utf8> inputPath,
//     ffi.Pointer<Utf8> outputPath,
//     );
// typedef _DartProcessVideo = int Function(
//     ffi.Pointer<Utf8> inputPath,
//     ffi.Pointer<Utf8> outputPath,
//     );
//
// /// Load the native library
// ffi.DynamicLibrary _openNativeLib() {
//   if (Platform.isAndroid) {
//     return ffi.DynamicLibrary.open('libnative_opencv.so');
//   } else if (Platform.isWindows) {
//     return ffi.DynamicLibrary.open('native_opencv_windows_plugin.dll');
//   }
//   return ffi.DynamicLibrary.process();
// }
//
// final ffi.DynamicLibrary _nativeLib = _openNativeLib();
//
// /// Lookup the C function
// final _DartProcessVideo _processVideo = _nativeLib
//     .lookup<ffi.NativeFunction<_CProcessVideo>>('process_video')
//     .asFunction();
//
// /// Public Dart wrapper
// /// Returns 0 on success, negative on error.
// Future<int> processVideo(String inputPath, String outputPath) async {
//   final inputPtr = inputPath.toNativeUtf8();
//   final outputPtr = outputPath.toNativeUtf8();
//
//   final result = _processVideo(inputPtr, outputPtr);
//
//   calloc.free(inputPtr);
//   calloc.free(outputPtr);
//   return result;
// }
//
// /// Prompt the user to pick a video file and return its path, or null if canceled.
// Future<String?> pickVideoFile() async {
//   final result = await FilePicker.platform.pickFiles(
//     type: FileType.video,
//   );
//   if (result == null || result.files.isEmpty) return null;
//   return result.files.first.path;
// }
//
// /// Select a video, generate an output path, and process via FFI
// Future<void> runVideoProcessing() async {
//   final inputPath = await pickVideoFile();
//   if (inputPath == null) {
//     print('Video selection canceled.');
//     return;
//   }
//
//   final dir = await getApplicationDocumentsDirectory();
//   final uuid = Uuid().v4();
//   final outputPath = '${dir.path}/${uuid}video.mp4';
//
//   print('Processing video...');
//   final code = await processVideo(inputPath, outputPath);
//
//   if (code == 0) {
//     print('Video processed successfully: $outputPath');
//   } else {
//     print('Processing failed with code: $code');
//   }
// }
//
//
//
