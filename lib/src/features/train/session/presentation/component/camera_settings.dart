import 'package:flutter/material.dart';

import '../bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import 'fram_streaming_widget.dart';

class CameraSettingsScreen extends StatefulWidget {
  const CameraSettingsScreen({super.key});

  @override
  _CameraSettingsScreenState createState() => _CameraSettingsScreenState();
}

class _CameraSettingsScreenState extends State<CameraSettingsScreen> {
  String selectedIso = 'auto';  // Default value for ISO
  String selectedEv = '0.0';    // Default value for EV
  String selectedLightFreq = '50HZ';    // Default value for EV

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ISO Selection Dropdown
        Row(
          children: [
            DropdownButton<String>(
              value: selectedIso,
              onChanged: (String? newValue) {
                setState(() {
                  selectedIso = newValue!;
                });
                // setIso(selectedIso);
                slRtspStreamingBloc
                    .add(RtspStreamingEvent.setVideoResolutionsEvent(selectedIso));
              },

              items: ["auto", "incandescent", "D4000", "D5000",
                                  "sunny", "cloudy", "D9000", "D10000", "flash",
                                   "fluorescent", "water", "outdoor"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value , style: TextStyle(fontSize: 12),),
                );
              }).toList(),
            ),
            SizedBox(width: 10),
            // EV Value Selection Dropdown
            DropdownButton<String>(
              value: selectedEv,
              onChanged: (String? newValue) {
                setState(() {
                  selectedEv = newValue!;
                });
                // setEvValue(selectedEv);
                slRtspStreamingBloc
                    .add(RtspStreamingEvent.setEvOptionsEvent(selectedEv));
              },
              items: [
                "-2.0",
                "-1.5",
                "-1.0",
                "-0.5",
                "0.0",
                "+0.3",
                "+0.5",
                "+1.0",
                "+1.5",
                "+1.7",
                "+2.0"
              ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value , style: TextStyle(fontSize: 12),),
                );
              }).toList(),
            ),
            SizedBox(width: 10),
            // EV Value Selection Dropdown
            DropdownButton<String>(
              value: selectedLightFreq,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLightFreq = newValue!;
                });
                slRtspStreamingBloc
                    .add(RtspStreamingEvent.setLightFreqEvent(selectedLightFreq));
              },
              items: ["Auto", "50HZ" , "60HZ" ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value , style: TextStyle(fontSize: 12),),
                );
              }).toList(),
            ),
          ],
        ),

      ],
    );
  }

  // // Function to set ISO value
  // void setIso(String iso) async {
  //   await setIso(iso);
  // }
  //
  // // Function to set EV value
  // void setEvValue(String evValue) async {
  //   await setEvValue(evValue);
  // }
}
