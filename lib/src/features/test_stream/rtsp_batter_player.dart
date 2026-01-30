//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';
// import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
// import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_session.dart';
// import 'package:ffmpeg_kit_flutter_min_gpl/log.dart';
// import 'package:ffmpeg_kit_flutter_min_gpl/statistics.dart';
// import 'package:ffmpeg_kit_flutter_min_gpl/return_code.dart';
//
// class FfmpegRtspView extends StatefulWidget {
//   final String url;
//   const FfmpegRtspView({required this.url, super.key});
//
//   @override
//   _FfmpegRtspViewState createState() => _FfmpegRtspViewState();
// }
//
// class _FfmpegRtspViewState extends State<FfmpegRtspView> {
//   late Directory _hlsDir;
//   late String _indexPath;
//   late String _segmentPattern;
//   VideoPlayerController? _videoController;
//   bool _isReady = false;
//   bool _isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _setupHls().then((_) => _startFfmpeg());
//   }
//
//   @override
//   void dispose() {
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   Future<void> _setupHls() async {
//     _hlsDir = await getTemporaryDirectory();
//     _hlsDir = Directory('${_hlsDir.path}/rtsp_hls');
//     if (await _hlsDir.exists()) {
//       await _hlsDir.delete(recursive: true);
//     }
//     await _hlsDir.create(recursive: true);
//
//     _indexPath      = '${_hlsDir.path}/index.m3u8';
//     _segmentPattern = '${_hlsDir.path}/seg%03d.ts';
//   }
//
//   void _startFfmpeg() {
//     // final cmd = [
//     //   '-rtsp_transport', 'tcp',
//     //   '-fflags', 'nobuffer',
//     //   '-flags', 'low_delay',
//     //   '-analyzeduration', '0',
//     //   '-probesize', '32',
//     //   '-i', widget.url,
//     //   '-c:v', 'copy',
//     //   '-an',
//     //   '-f', 'hls',
//     //   '-hls_time', '1',
//     //   '-hls_list_size', '3',
//     //   '-hls_flags', 'delete_segments+append_list+omit_endlist',
//     //   '-hls_allow_cache', '0',
//     //   '-hls_segment_filename', _segmentPattern,
//     //   _indexPath,
//     // ].join(' ');
//
//     final cmd = 'ffmpeg -rtsp_transport tcp -fflags +nobuffer+flush_packets+genpts -flags low_delay -analyzeduration 100000 -probesize 32 -max_delay 0 -buffer_size 102400 -avoid_negative_ts make_zero -i rtsp://192.168.42.1/live -c:v copy -an -f hls -hls_time 0.5 -hls_list_size 3 -hls_flags delete_segments+append_list+omit_endlist -hls_allow_cache 0 -hls_segment_filename /your/temp/seg%03d.ts /your/temp/index.m3u8';
//
//
//     FFmpegKit.executeAsync(cmd, (FFmpegSession session) async {
//       final returnCode = await session.getReturnCode();
//       if (ReturnCode.isSuccess(returnCode)) {
//         print('[FFmpegKit] Success');
//       } else {
//         print('[FFmpegKit] Failed with rc=${returnCode?.getValue()}');
//       }
//     }, (Log log) {
//       // optional: print ffmpeg logs
//       // print('[FFmpegKit][LOG] ${log.getMessage()}');
//     }, (Statistics stats) {
//       // optional: print encoding statistics
//       // print('[FFmpegKit][STATS] time=${stats.getTime()}');
//     });
//
//     // wait a moment for the first playlist chunks
//     Future.delayed(Duration(seconds: 2), _initializeVideoPlayer);
//   }
//
//   Future<void> _initializeVideoPlayer() async {
//     final file = File(_indexPath);
//     if (!await file.exists()) {
//       await Future.delayed(Duration(seconds: 1));
//     }
//     _videoController = VideoPlayerController.file(file);
//     await _videoController!.initialize();
//     setState(() {
//       _isReady = true;
//       _isPlaying = true;
//     });
//     _videoController!.play();
//   }
//
//   void _togglePlayPause() {
//     if (!_isReady) return;
//     setState(() {
//       if (_isPlaying) {
//         _videoController!.pause();
//       } else {
//         _videoController!.play();
//       }
//       _isPlaying = !_isPlaying;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!_isReady) {
//       return Scaffold(
//         appBar: AppBar(title: Text('RTSP → HLS with FFmpeg')),
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: Text('RTSP → HLS with FFmpeg')),
//       body: Column(
//         children: [
//           AspectRatio(
//             aspectRatio: _videoController!.value.aspectRatio,
//             child: VideoPlayer(_videoController!),
//           ),
//           SizedBox(height: 12),
//           IconButton(
//             icon: Icon(
//               _isPlaying ? Icons.pause : Icons.play_arrow,
//               size: 32,
//             ),
//             onPressed: _togglePlayPause,
//           ),
//         ],
//       ),
//     );
//   }
// }
