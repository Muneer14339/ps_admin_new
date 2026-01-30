import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

// import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
// import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit_config.dart';
// import 'package:ffmpeg_kit_flutter_min_gpl/return_code.dart';
import 'package:ffmpeg_kit_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_min_gpl/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_min_gpl/return_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_usb_camera/flutter_usb_camera.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/frams_streaming/stream_manager.dart';
import '../../../../../test_stream/usb_manager.dart';
import 'socket_service.dart';

class RTSPController {
  RTSPController(this.rtspUrl);

  int? frameWidth;
  int? frameHeight;
  bool running = false;

  final String rtspUrl;
  final String tcpAddress = 'localhost';
  final int tcpPort = 4040;
  late ServerSocket serverSocket;
  late bool isRtspRunnning = false;
  late final CameraSocketHandler socketHandler;
  final splitter = MjpegSplitter();
  final streamController = StreamManager();

  Future<void> disposeRTSP() async {
    await stopStreaming();
  }

  Future<void> stopStreaming() async {
    print("🚀 Stopping RTSP Stream...");

    try {
      await FFmpegKit.cancel();
      _subscription?.cancel();

      await Future.delayed(const Duration(milliseconds: 500));
      print("✅ FFmpeg processes killed.");
    } catch (e) {
      print("❌ Error stopping FFmpeg: $e");
    }

    try {
      serverSocket.close();
      await Future.delayed(const Duration(milliseconds: 500));
      print("✅ TCP server closed.");
    } catch (e) {
      print("❌ Error closing TCP server: $e");
    }

    frameWidth = null;
    frameHeight = null;
    await Future.delayed(const Duration(seconds: 1));
    isStreaming = false;
  }

  Future<StreamInfo?> readStreamInfo() async {
    const ffmpegCommand =
        '-fflags +discardcorrupt -err_detect ignore_err -i rtsp://192.168.42.1/live -vf fps=30 -f image2pipe -';
    // const ffmpegCommand =
    //     '-loglevel debug -rtsp_transport tcp -stimeout 10000 -i rtsp://192.168.42.1/live -vframes 1 -f null -';

    print(ffmpegCommand);
    final session = await FFmpegKit.execute(ffmpegCommand);
    print('Return code_before: ${session.getAllLogs()}');
    ReturnCode? returnCode = await session.getReturnCode();

    print('Return code: $returnCode');

    if (ReturnCode.isSuccess(returnCode)) {
      final logs = await session.getAllLogsAsString();
      print('FFmpeg logs success: $logs');

      final streamInfo = _parseStreamInfo(logs ?? '');
      if (streamInfo != null) {
        print('Frame size: ${streamInfo.width}x${streamInfo.height}');
        frameWidth = streamInfo.width;
        frameHeight = streamInfo.height;
        // frameWidth = 1280;
        // frameHeight = 960;
        return streamInfo;
      } else {
        print('Failed to parse frame size from logs');
      }
    } else {
      final logs = await session.getAllLogsAsString();
      final msg = await session.getFailStackTrace();
      print(msg ?? '');

      final state =
          FFmpegKitConfig.sessionStateToString(await session.getState());
      final returnCode = await session.getReturnCode();
      final failStackTrace = await session.getFailStackTrace();
      final duration = await session.getDuration();
      final output = await session.getOutput();

      log('FFmpeg state: $state');
      log('FFmpeg returnCode: $returnCode');
      log('FFmpeg failStackTrace: $failStackTrace');
      log('FFmpeg duration: $duration');
      log('FFmpeg output: $output');

      print('FFmpeg logs: $logs');
      print('Failed to get frame size with return code: $returnCode');
    }

    return null;
  }

  Future<bool> readCableInfo() async {
    // UsbCameraManager.isCameraOpen,
    UsbCameraManager.initializeCallbacks();

    return true;
  }

  StreamInfo? _parseStreamInfo(String logs) {
    print("🔍 FFmpeg Raw Logs: $logs"); // Debugging logs

    final resolutionRegex = RegExp(r'(\d{3,4})x(\d{3,4})');
    final match = resolutionRegex.firstMatch(logs);

    if (match != null) {
      final width = int.tryParse(match.group(1) ?? '');
      final height = int.tryParse(match.group(2) ?? '');

      if (width != null && height != null) {
        print("✅ Parsed Resolution: ${width}x${height}");
        final fps = _extractFps(logs);
        return StreamInfo(width, height, fps);
      }
    }
    print("⚠ Failed to parse resolution.");
    return null;
  }

  int _extractFps(String logs) {
    int defaultFps = 30;
    final fpsRegex = RegExp(r'(\d+(\.\d+)?) fps');
    final match = fpsRegex.firstMatch(logs);
    if (match != null) {
      final fpsValue = match.group(1);
      if (fpsValue != null) {
        return int.tryParse(fpsValue.split('.')[0]) ?? defaultFps;
      }
    }
    return defaultFps;
  }

  // void startKeepAlive(Socket client) {
  //   Timer.periodic(const Duration(minutes: 30), (timer) {
  //     if (client != null && client.remoteAddress != null) {
  //       client.write("KEEP_ALIVE");
  //     } else {
  //       timer.cancel();
  //     }
  //   });
  // }

  bool isStreaming = false;

  // bool toggleStream() {
  //   if (isStreaming) {
  //     // Pause the stream
  //     return pauseStream();
  //   } else {
  //     // Resume or start the stream
  //     _readRTSP();
  //     return true;
  //   }
  // }

  bool pauseStream() {
    print('Pausing stream...');
    FFmpegKit.cancel(); // This cancels the ongoing FFmpeg session
    isStreaming = false;
    return false;
  }
  StreamSubscription<Uint8List>? _subscription;

  checkStr(
    dynamic Function(
      Uint8List frame,
      int frameWidth,
      int frameHeight,
    ) callback,
  ) {

    // FlutterUsbCamera.startStream(
    //   fps: 15,
    //   croppedWidth: 500,
    //   croppedHeight: 500,
    // );
    print("frameData.length.toString()");
    _subscription = FlutterUsbCamera.frames().listen(
          (frameBytes) {
        // Call your callback with each frame
            callback(frameBytes, 680, 680);
      },
      onError: (e) {
        print("Error receiving frame: $e");
      },
      cancelOnError: false,
    );
    //
    // FlutterUsbCamera.frames().listen(
    //   (Uint8List frameData) {
    //     print(frameData.length.toString());
    //     callback(frameData, 500, 500);
    //   },
    //   onError: (error) {
    //     debugPrint('❌ Frame stream error: $error');
    //   },
    //   onDone: () {
    //     debugPrint('📺 Frame stream closed');
    //   },
    // );

  }

  void startImageStream(
    dynamic Function(
      Uint8List frame,
      int frameWidth,
      int frameHeight,
    ) callback,
  ) async {
    try {
      serverSocket = await ServerSocket.bind(tcpAddress, tcpPort, shared: true);
      print("✅ TCP server started on $tcpAddress:$tcpPort");

      serverSocket.listen((Socket client) {
        client.setOption(SocketOption.tcpNoDelay, true);
        print(
            "📡 New client connected: ${client.remoteAddress.address}:${client.remotePort}");

        client.listen((Uint8List chunk) async {
          if (frameWidth != null && frameHeight != null) {
            splitter.addChunk(chunk, (Uint8List completeFrame) {
              // Now guaranteed to be a full JPEG → safe to decode
              callback(completeFrame, frameWidth!, frameHeight!);
            });

            // callback(data, frameWidth!, frameHeight!);
          } else {
            print('Frame size is null');
          }
          // if (frameWidth == null || frameHeight == null) {
          //   print("🚨 Frame size is null! Stopping stream...");
          //   // ✅ Close the client connection
          //   client.close();
          //   // ✅ Stop the RTSP stream to prevent further issues
          //   await disposeRTSP();
          //   return; // Exit the function early
          // }
          // ✅ Frame size is valid, invoke callback
          // callback(data, frameWidth ?? 720, frameHeight ?? 720);
        }, onDone: () {
          print("🔌 Client disconnected");
          client.close();
        });
      });
    } catch (v) {
      print("❌ Error(startImageStream): $v");
      if (v is SocketException &&
          v.osError?.message.contains('shared flag') == true) {
        print(
            "💡 Hint: Ensure the shared flag is set to true if binding to the same address and port multiple times.");
      }
    }

    _readRTSP(); // Start the FFmpeg stream
  }

  void _readRTSP() async {
    print('🚀 Starting a new FFmpeg RTSP stream');

    // ✅ Kill any existing FFmpeg process before starting a new one
    await FFmpegKit.cancel();
    await Future.delayed(const Duration(seconds: 1));

    /// Option A: High-quality MJPEG (1:1 square, JPEG Q=2)
    /// '-vf', 'crop=in_h:in_h:(in_w-in_h)/2:0,scale=720:720,unsharp=5:5:1.0:5:5:0.0,eq=brightness=0.1:contrast=1.2,format=yuv420p',
    final ffmpegCommandMjpeg = [
      '-fflags',
      '+discardcorrupt',
      '-err_detect',
      'ignore_err',
      '-rtsp_transport',
      'tcp',
      '-i',
      rtspUrl,
      '-vf',
      'crop=in_h:in_h:(in_w-in_h)/2:0,scale=500:500',
      '-r',
      '10',
      '-q:v',
      '1',
      '-f',
      'mjpeg',
      'tcp://$tcpAddress:$tcpPort',
    ].join(' ');

    ///testing
//     final ffmpegCommandMjpeg = [
//       // ─────── Reduce log noise ───────
//       // '-loglevel', 'error',
//
//       // ─────── Input timing & error handling ───────
//       '-fflags', '+genpts+discardcorrupt',    // regenerate PTS, drop bad packets
//       '-flags2', '+export_mvs',               // help error concealment
//       '-err_detect', 'ignore_err',            // continue on minor decoding errors
//
//       // ─────── RTSP over TCP + buffering ───────
//       '-rtsp_transport', 'tcp',
//       '-probesize', '32M',                    // look at more data before stream detection
//       '-analyzeduration', '3000000',          // give FFmpeg more time (in µs) to analyze
//       '-max_delay', '5000000',                // buffer up to 5 seconds of input
//
//       // ─────── Input → Filter → Output ───────
//       '-i', rtspUrl,
//       '-vf', 'crop=in_h:in_h:(in_w-in_h)/2:0,scale=720:720',
//       '-q:v', '1',
//       '-f', 'mjpeg',
//       'tcp://$tcpAddress:$tcpPort',
//     ].join(' ');

    //old query
    final ffmpegCommandold =
        '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl '
        '-vf "crop=in_h:in_h:(in_w-in_h)/2:0,scale=720:720,unsharp=5:5:1.0:5:5:0.0,eq=contrast=1.7,format=yuv420p" '
        '-f mjpeg tcp://$tcpAddress:$tcpPort';

    final ffmpegCommand = ffmpegCommandMjpeg;
    // final ffmpegCommand = ffmpegCommandold;
// final ffmpegCommand = ffmpegCommandH264;
// final ffmpegCommand = ffmpegCommandMjpegUpdated;

    FFmpegKit.executeAsync(
      ffmpegCommand,
      (session) async {
        final returnCode = await session.getReturnCode();
        if (ReturnCode.isSuccess(returnCode)) {
          print("✅ Stream finished successfully");
          await Future.delayed(Duration(seconds: 1));
          _readRTSP(); // Restart the stream if needed
        } else {
          print("❌ Stream stopped with return code: $returnCode");
        }
      },
      (log_) {
          final msg = log_.getMessage();
          // print(msg);

          // Example line:
          // frame=   31 ... speed=1.15x
          final match = RegExp(r'speed=\s*([0-9.]+)x').firstMatch(msg);
          if (match != null) {
            final value = double.tryParse(match.group(1)!);
            if (value != null) {
              print(value);
              _speedStatusFrom(value);
            }
          }
        },
      (statistics) {},
    );
    isStreaming = true;
  }
   _speedStatusFrom(double? speed) {
    if (speed == null) return streamController.addSpeedData(0);

    if (speed >= 1.0) {
       streamController.addSpeedData(1); // green
    } else if (speed < 1.0 && speed > 0.9) {
       streamController.addSpeedData(2); // yellow
    } else if (speed < 0.8) {
       streamController.addSpeedData(3); // red
    }
  }
  void startImageStreamForSimpleStream(
    dynamic Function(
      Uint8List frame,
      int frameWidth,
      int frameHeight,
    ) callback,
  ) async {
    try {
      serverSocket = await ServerSocket.bind(tcpAddress, tcpPort, shared: true);
      print("✅ TCP server started on $tcpAddress:$tcpPort");

      serverSocket.listen((Socket client) {
        client.setOption(SocketOption.tcpNoDelay, true);
        print(
            "📡 New client connected: ${client.remoteAddress.address}:${client.remotePort}");

        client.listen((Uint8List chunk) async {
          if (frameWidth != null && frameHeight != null) {
            splitter.addChunk(chunk, (Uint8List completeFrame) {
              // Now guaranteed to be a full JPEG → safe to decode
              callback(completeFrame, frameWidth!, frameHeight!);
            });

            // callback(data, frameWidth!, frameHeight!);
          } else {
            print('Frame size is null');
          }
        }, onDone: () {
          print("🔌 Client disconnected");
          client.close();
        });
      });
    } catch (v) {
      print("❌ Error(startImageStream): $v");
      if (v is SocketException &&
          v.osError?.message.contains('shared flag') == true) {
        print(
            "💡 Hint: Ensure the shared flag is set to true if binding to the same address and port multiple times.");
      }
    }

    _readRTSPForSimpleStream(); // Start the FFmpeg stream
  }

  void _readRTSPForSimpleStream() async {
    print('🚀 Starting a new FFmpeg RTSP stream');

    // ✅ Kill any existing FFmpeg process before starting a new one
    await FFmpegKit.cancel();
    await Future.delayed(const Duration(seconds: 1));

    /// Option A: High-quality MJPEG (1:1 square, JPEG Q=2)
    // final ffmpegCommandMjpeg = [
    //   '-fflags', '+discardcorrupt',
    //   '-err_detect', 'ignore_err',
    //   '-rtsp_transport', 'tcp',
    //   '-i', rtspUrl,
    //   // '-vf', 'crop=in_h:in_h:(in_w-in_h)/2:0,scale=720:720',
    //   '-q:v', '1',                // JPEG quality (1=best…31=worst)
    //   '-f', 'mjpeg',
    //   'tcp://$tcpAddress:$tcpPort',
    // ].join(' ');
    final ffmpegCommandMjpeg = [
      // INPUT: drop corrupt packets, disable buffering, generate PTS
      '-fflags', '+discardcorrupt+nobuffer+genpts',
      '-flags', 'low_delay',
      '-probesize', '32',
      '-analyzeduration', '0',
      '-max_delay', '0',
      '-err_detect', 'ignore_err',

      // Use UDP for RTSP to avoid TCP retransmit stalls
      '-rtsp_transport', 'udp',
      '-i', rtspUrl,

      // Highest-quality MJPEG
      '-q:v', '1',

      // Flush packets immediately to reduce muxer buffering
      '-flush_packets', '1',
      '-use_wallclock_as_timestamps', '1',

      // OUTPUT
      '-f', 'mjpeg',
      'tcp://$tcpAddress:$tcpPort',
    ].join(' ');
    final ffmpegCommand = ffmpegCommandMjpeg;

    FFmpegKit.executeAsync(
      ffmpegCommand,
      (session) async {
        final returnCode = await session.getReturnCode();
        if (ReturnCode.isSuccess(returnCode)) {
          print("✅ Stream finished successfully");
          await Future.delayed(Duration(seconds: 1));
          _readRTSPForSimpleStream(); // Restart the stream if needed
        } else {
          print("❌ Stream stopped with return code: $returnCode");
        }
      },
      (log_) {
        // print("log_.getMessage()");
        print(log_.getMessage());
      },
      (statistics) {},
    );
    isStreaming = true;
  }

  void stop() {
    FFmpegKit.cancel();

    isStreaming = false;
    print('Cancel');
  }
}

class MjpegSplitter {
  final _buffer = <int>[];

  // JPEG start and end markers
  static const _soi = [0xFF, 0xD8];
  static const _eoi = [0xFF, 0xD9];

  /// Call this on every chunk you receive
  void addChunk(Uint8List chunk, void Function(Uint8List frame) onFrame) {
    _buffer.addAll(chunk);

    while (true) {
      // find the SOI
      final start = _indexOf(_buffer, _soi, 0);
      if (start < 0) break;

      // find the EOI after that
      final end = _indexOf(_buffer, _eoi, start + _soi.length);
      if (end < 0) break;

      // extract complete JPEG
      final frameBytes = _buffer.sublist(start, end + _eoi.length);
      onFrame(Uint8List.fromList(frameBytes));

      // remove it from buffer
      _buffer.removeRange(0, end + _eoi.length);
    }

    // keep buffer from growing indefinitely
    if (_buffer.length > 1 << 20) {
      // drop old data if >1 MiB without a frame
      _buffer.clear();
    }
  }

  /// Helper: find a sequence of bytes
  int _indexOf(List<int> data, List<int> pattern, int from) {
    for (var i = from; i <= data.length - pattern.length; i++) {
      var match = true;
      for (var j = 0; j < pattern.length; j++) {
        if (data[i + j] != pattern[j]) {
          match = false;
          break;
        }
      }
      if (match) return i;
    }
    return -1;
  }
}

class StreamInfo {
  final int width;
  final int height;
  final int fps;
  int? error;

  StreamInfo(this.width, this.height, this.fps, {this.error});
}

///Extra Data
// void startImageStream(
//   dynamic Function(
//     Uint8List frame,
//     int frameWidth,
//     int frameHeight,
//   ) callback,
// ) async {
//   try{
//
//     serverSocket = await ServerSocket.bind(tcpAddress, tcpPort);
//     print("TCP server started on $tcpAddress:$tcpPort");
//
//     serverSocket.listen((Socket client) {
//       client.setOption(SocketOption.tcpNoDelay, true);
//       // startKeepAlive(client);
//       print("New client connected: ${client.remoteAddress.address}:${client.remotePort}");
//
//       client.listen((Uint8List data) {
//         if (frameWidth != null && frameHeight != null) {
//           callback(data, frameWidth!, frameHeight!);
//         } else {
//           print('frame size is null');
//         }
//       }, onDone: () {
//         print("Client disconnected");
//         client.close();
//       });
//     });
//   }catch(v){
//   }
//   _readRTSP();
// }
//
//
// void _readRTSP() {
//   print('Run a new ffmpeg command to read rtsp stream');
//   FFmpegKit.cancel();
//   final ffmpegCommand =
//       // '-rtsp_transport tcp -i $rtspUrl -c:v mjpeg -f mjpeg tcp://$tcpAddress:$tcpPort';
//
//   '-rtsp_transport tcp -i $rtspUrl -f mjpeg tcp://$tcpAddress:$tcpPort';
//   //  '-rtsp_transport tcp -i $rtspUrl -c:v mpeg4 -f mjpeg tcp://$tcpAddress:$tcpPort';
//
//   FFmpegKit.executeAsync(
//     ffmpegCommand,
//         (session) async {
//       final returnCode = await session.getReturnCode();
//       if (ReturnCode.isSuccess(returnCode)) {
//
//         _readRTSP();
//         // It's done here
//         print("Stream finished successfully");
//         final state = FFmpegKitConfig.sessionStateToString(
//             await session.getState());
//         final returnCode = await session.getReturnCode();
//         final failStackTrace = await session.getFailStackTrace();
//         final duration = await session.getDuration();
//         final output = await session.getOutput();
//
//
//
//         // it's not showing?
//         //no , now its not showing simple stream
//       } else {
//         print("Stream stopped with return code: $returnCode");
//         final logs = await session.getAllLogsAsString();
//         // log('FFmpeg logs: $logs');
//       }
//     },
//         (log_) {
//       // Handle FFmpeg log messages if necessary
//       //print("Bytes${log_.getMessage().length}");
//       // log('hereeeeee: ${log_.getMessage()}');
//       final logMessage = log_.getMessage();
//       final defaultDup = 0;
//       final maxDups = 100;
//
//       // parse the log message to get the `dup` value
//           final dupRegex = RegExp(r'dup=(\d+)');
//       final match = dupRegex.firstMatch(logMessage);
//           if (match != null) {
//             final dupValue = match.group(1);
//             if (dupValue != null) {
//               final dup = int.tryParse(dupValue) ?? defaultDup; // Convert to integer
//             if (dup > maxDups) {
//               print('Too many duplicated frames.');
//               // _readRTSP();
//               return;
//             }
//             }
//           }
//     },
//         (statistics) {
//       // Handle FFmpeg statistics if necessary
//     },
//   );
// }

///New_One_Stream_with_Bloc
// void startImageStream(
//   dynamic Function(
//     Uint8List frame,
//     int frameWidth,
//     int frameHeight,
//   ) callback,
// ) async {
//   try {
//     serverSocket = await ServerSocket.bind(tcpAddress, tcpPort, shared: true);
//     print("TCP server started on $tcpAddress:$tcpPort");
//
//     serverSocket.listen((Socket client) {
//       client.setOption(SocketOption.tcpNoDelay, true);
//       print(
//           "New client connected: ${client.remoteAddress.address}:${client.remotePort}");
//       client.listen((Uint8List data) {
//         if (frameWidth != null && frameHeight != null) {
//           // Invoke pushFrame here
//           callback(data, frameWidth!, frameHeight!);
//         } else {
//           print('Frame size is null');
//         }
//       }, onDone: () {
//         print("Client disconnected");
//         client.close();
//       });
//     });
//   } catch (v) {
//     print('Error(startImageStream): $v');
//     if (v is SocketException &&
//         v.osError?.message.contains('shared flag') == true) {
//       print(
//           'Hint: Ensure the shared flag is set to true if binding to the same address and port multiple times.');
//     }
//   }
//   _readRTSP(); // Start the FFmpeg stream
// }

///query
// final ffmpegCommand =
//     '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl -f mjpeg tcp://$tcpAddress:$tcpPort';

///Old
// final ffmpegCommand =
//     '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl '
//     '-vf "crop=720:720:280:0,scale=720:720,unsharp=5:5:1.0:5:5:0.0,eq=brightness=0.3:contrast=1.7,format=yuv420p" '
//     '-f mjpeg tcp://$tcpAddress:$tcpPort';

// final ffmpegCommand =
//     '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl '
//     '-vf "crop=720:720:280:0,scale=720:720,unsharp=5:5:1.0:5:5:0.0,format=yuv420p" '
//     '-f mjpeg tcp://$tcpAddress:$tcpPort';
///
//  final ffmpegCommand =
//      '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl '
//      '-vf "crop=min(iw\\,ih):min(iw\\,ih):(iw-min(iw\\,ih))/2:(ih-min(iw\\,ih))/2,scale=1080:1080,format=yuv420p" '
//      '-f mjpeg tcp://$tcpAddress:$tcpPort';

// final ffmpegCommand =
//     '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl '
//     '-vf "crop=min(iw\\,ih):min(iw\\,ih):(iw-min(iw\\,ih))/2:(ih-min(iw\\,ih))/2,'
//     'scale=720:720,'
//     'unsharp=7:7:3.0:7:7:0,'
//     'eq=brightness=0.1:contrast=1.3,'
//     'format=yuv420p" '
//     '-f mjpeg tcp://$tcpAddress:$tcpPort';

// final ffmpegCommand =
//     '-analyzeduration 10000000 -probesize 5000000 '
//     '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl '
//     '-vf "crop=in_h:in_h:(in_w-in_h)/2:0,scale=1080:1080:flags=lanczos,format=yuvj420p,setsar=1" '
//     '-q:v 2 -g 1 -c:v mjpeg -bsf:v mjpeg2jpeg '
//     '-f mjpeg tcp://$tcpAddress:$tcpPort';
///
// final ffmpegCommand =
//     '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl '
//     '-vf "unsharp=5:5:1.0:5:5:0.0,eq=brightness=0.2:contrast=1.7" '
//     '-f mjpeg tcp://$tcpAddress:$tcpPort';
///Currently working Data
// final ffmpegCommand =
//     '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl '
//     '-vf "crop=in_h:in_h:(in_w-in_h)/2:0,scale=1080:1080,unsharp=5:5:1.0:5:5:0.0,eq=brightness=0.3:contrast=1.4,format=yuv420p" '
//     '-f mjpeg tcp://$tcpAddress:$tcpPort';
//,unsharp=5:5:1.0:5:5:0.0,eq=brightness=0.3:contrast=1.9,format=yuv420p
// final ffmpegCommand =
//'-rtsp_transport tcp -i $rtspUrl -vf "scale=1280:720,format=yuv420p" -c:v libx264 -preset fast -tune zerolatency -b:v 1000k -f mpegts $tcpAddress';

///first query
// const ffmpegCommand =
//     '-rtsp_transport tcp -i rtsp://192.168.42.1/live -fflags +discardcorrupt -err_detect ignore_err -vf fps=30 -f image2pipe -';
// const ffmpegCommand =
//     '-rtsp_transport tcp -fflags nobuffer -flush_packets 1 -i rtsp://192.168.42.1/live -fflags +discardcorrupt -err_detect ignore_err -vf fps=30 -f image2pipe -';
// const ffmpegCommand =
//     '-rtsp_transport tcp -fflags nobuffer -flush_packets 1 -i rtsp://192.168.42.1/live '
//     '-vf "crop=720:720:0:0,scale=720:720,format=yuv420p" '
//     '-s 720x720 '
//     '-fflags +discardcorrupt -err_detect ignore_err -f image2pipe -';

// void startImageStream(
//   dynamic Function(
//     Uint8List frame,
//     int frameWidth,
//     int frameHeight,
//   ) callback,
// ) async {
//   try {
//     serverSocket = await ServerSocket.bind(tcpAddress, tcpPort);
//     print("TCP server started on $tcpAddress:$tcpPort");
//
//     serverSocket.listen((Socket client) {
//       client.setOption(SocketOption.tcpNoDelay, true);
//       print("New client connected: ${client.remoteAddress.address}:${client.remotePort}");
//       client.listen((Uint8List data) {
//         if (frameWidth != null && frameHeight != null) {
//           callback(data, frameWidth!, frameHeight!);
//         } else {
//           print('Frame size is null');
//         }
//       }, onDone: () {
//         print("Client disconnected");
//         client.close();
//       });
//     });
//   } catch (v) {
//     print('Error(startImageStream): $v');
//   }
//   _readRTSP(); // Start the FFmpeg stream
// }
/// New_One_Stream_with_Bloc
//   void _readRTSP() {
//     print('Run a new ffmpeg command to read RTSP stream');
//     // final ffmpegCommand = '-rtsp_transport tcp -i $rtspUrl -f mjpeg tcp://$tcpAddress:$tcpPort';
//     // final ffmpegCommand = '-err_detect ignore_err -rtsp_transport tcp -i $rtspUrl -f mjpeg tcp://$tcpAddress:$tcpPort';
//     final ffmpegCommand =
//         '-fflags +discardcorrupt -err_detect ignore_err -rtsp_transport tcp -i $rtspUrl -f mjpeg tcp://$tcpAddress:$tcpPort';
//
//     FFmpegKit.executeAsync(
//       ffmpegCommand,
//       (session) async {
//         final returnCode = await session.getReturnCode();
//         if (ReturnCode.isSuccess(returnCode)) {
//           print("Stream finished successfully");
//           _readRTSP(); // Restart the stream if needed
//         } else {
//           print("Stream stopped with return code: $returnCode");
//         }
//       },
//       (log_) {
//         // Handle FFmpeg log messages if necessary
//         print(log_.getMessage());
//       },
//       (statistics) {
//         // Handle FFmpeg statistics if necessary
//       },
//     );
//
//     isStreaming = true;
//   }

// StreamInfo? _parseStreamInfo(String logs) {
//   final widthRegex = RegExp(r'(\d+)x\d+');
//   final heightRegex = RegExp(r'\d+x(\d+)');
//
//   final widthMatch = widthRegex.firstMatch(logs);
//   final heightMatch = heightRegex.firstMatch(logs);
//
//   if (widthMatch != null && heightMatch != null) {
//     final width = int.tryParse(widthMatch.group(1) ?? '');
//     final height = int.tryParse(heightMatch.group(1) ?? '');
//     if (width != null && height != null) {
//       final fps = _extractFps(logs);
//       return StreamInfo(width, height, fps);
//     }
//   }
//   return null;
// }
