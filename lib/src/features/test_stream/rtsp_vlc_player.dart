// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
//
// class VlcRtspView extends StatefulWidget {
//   final String url;
//   const VlcRtspView({required this.url, super.key});
//
//   @override
//   _VlcRtspViewState createState() => _VlcRtspViewState();
// }
//
// class _VlcRtspViewState extends State<VlcRtspView> {
//   late VlcPlayerController _vlcController;
//   bool _isControllerInitialized = false;
//   bool _isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initSocket();
//   }
//
//   Future<void> _initSocket() async {
//     const String cameraIp = '192.168.42.1'; // Your camera IP
//     const int commandPort = 7878; // Command port
//
//     try {
//       final socket = await Socket.connect(cameraIp, commandPort);
//
//       Map<String, dynamic> startSessionCmd = {"token": 0, "msg_id": 257};
//       String jsonString = jsonEncode(startSessionCmd);
//       socket.write(jsonString);
//
//       socket.listen(
//             (data) async {
//           String response = utf8.decode(data);
//           Map<String, dynamic> parsedResponse = jsonDecode(response);
//           if (parsedResponse["rval"] == 0) {
//             if (parsedResponse["param"] == null) {
//               print("ViewFinder set");
//             } else {
//               int token = parsedResponse["param"];
//               print("Session started, token: $token");
//               Map<String, dynamic> resetVfCmd = {"token": token, "msg_id": 259};
//               jsonString = jsonEncode(resetVfCmd);
//               socket.write(jsonString);
//
//               // Ensure VLC controller is initialized after receiving the token
//               await _initializeVlcController();
//             }
//           } else {
//             print("Failed to start session. Response: $parsedResponse");
//           }
//         },
//         onError: (error) {
//           print('Socket error: $error');
//           socket.destroy();
//         },
//         onDone: () {
//           print('Socket disconnected.');
//           socket.destroy();
//         },
//       );
//     } catch (e) {
//       print('Socket connection error: $e');
//     }
//   }
//
//   // Async function to initialize VLC player controller after the token is received
//   Future<void> _initializeVlcController() async {
//     setState(() {
//       _vlcController = VlcPlayerController.network(
//         widget.url,
//         hwAcc: HwAcc.full, // hardware acceleration
//         autoPlay: true,
//       );
//       _isControllerInitialized = true;
//     });
//   }
//
//   @override
//   void dispose() {
//     _vlcController.stop();
//     _vlcController.dispose();
//     super.dispose();
//   }
//
//   void _togglePlayPause() {
//     setState(() {
//       if (_isPlaying) {
//         _vlcController.pause();
//       } else {
//         _vlcController.play();
//       }
//       _isPlaying = !_isPlaying;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!_isControllerInitialized) {
//       return Center(child: CircularProgressIndicator());
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: Text('RTSP Stream',style: TextStyle(fontSize: 14.sp),)),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           VlcPlayer(
//             controller: _vlcController,
//             aspectRatio: 16 / 9,
//             placeholder: Center(child: CircularProgressIndicator()),
//           ),
//           SizedBox(height: 20),
//
//         ],
//       ),
//     );
//   }
// }
