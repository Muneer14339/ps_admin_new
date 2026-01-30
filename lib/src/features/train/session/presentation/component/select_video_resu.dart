import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import 'fram_streaming_widget.dart';

class ResolutionDropdown extends StatefulWidget {
  const ResolutionDropdown({super.key});

  @override
  _ResolutionDropdownState createState() => _ResolutionDropdownState();
}

class _ResolutionDropdownState extends State<ResolutionDropdown> {
  List<String> supportedResolutions = [
    "3840x2160 30P 16:9",
    "2704x2028 30P 4:3",
    "2704x1520 30P 16:9",
    "2560x1440 30P 16:9",
    "1920x1440 30P 4:3",
    "1920x1080 60P 16:9",
    "1920x1080 30P 16:9",
    "1280x960 30P 4:3",
    "1280x720 60P 16:9",
    "1280x720 30P 16:9"
  ];

  String? selectedResolution; // To store the selected resolution

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.settings, size: 30, color: Colors.blue),
      onSelected: (String value) {
        setState(() {
          selectedResolution = value;
        });
      },
      color: Colors.black,
      itemBuilder: (BuildContext context) {
        return supportedResolutions.map((String resolution) {
          return PopupMenuItem<String>(
            value: resolution,
            onTap: (){
              slRtspStreamingBloc
                  .add(RtspStreamingEvent.setVideoResolutionsEvent(resolution));
            },
            child: Text(
              resolution,
              style: TextStyle(
                fontSize: 7.sp,
                color: Colors.white,
              ),
            ),
          );
        }).toList();
      },
    );

    //   Scaffold(
    //   body: Center(
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         // Icon Button that triggers the dropdown menu
    //
    //         // SizedBox(width: 10),
    //         //
    //         // // Display selected resolution
    //         // Text(
    //         //   selectedResolution ?? "Select Resolution",
    //         //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //         // ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
