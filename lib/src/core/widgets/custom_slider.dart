// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
// import 'package:flutter_xlider/flutter_xlider.dart';
//
// import '../../features/train/session/presentation/bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
// import '../../features/train/session/presentation/component/fram_streaming_widget.dart';
//
// class CustomSeekbar extends StatefulWidget {
//   const CustomSeekbar({super.key, required this.distance});
//   final int distance;
//
//   @override
//   _CustomSeekbarState createState() => _CustomSeekbarState();
// }
//
// class _CustomSeekbarState extends State<CustomSeekbar> {
//   double _sliderValue = 2;
//
//   ValueNotifier<String?> fovOption = ValueNotifier<String?>(null);
//   ValueNotifier<double> currentSliderValue = ValueNotifier<double>(60);
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     if(widget.distance==1){
//       currentSliderValue.value = 42.0;
//     }else if (widget.distance==2){
//       currentSliderValue.value = 30.0;
//     }else{
//       currentSliderValue.value = 100.00;
//     }
//
//
//
//       if (widget.distance == 1) {
//         currentSliderValue.value =42.00;
//       } else if (widget.distance == 2 || widget.distance == 3 || widget.distance == 4 || widget.distance == 5) {
//         currentSliderValue.value =30.00;
//       } else if (widget.distance == 6) {
//         currentSliderValue.value =100.0;
//       } else if (widget.distance == 7) {
//         currentSliderValue.value =80.0;
//       } else if (widget.distance == 8 || widget.distance == 9) {
//         currentSliderValue.value =65.0;
//       } else if (widget.distance == 10 || widget.distance == 11) {
//         currentSliderValue.value =55.0;
//       } else if (widget.distance == 12 || widget.distance == 13) {
//         currentSliderValue.value =45.0;
//       } else if (widget.distance == 15 || widget.distance == 14 || widget.distance == 16) {
//         currentSliderValue.value =35.0;
//       } else if (widget.distance == 20) {
//         currentSliderValue.value =30.0;
//       } else {
//         currentSliderValue.value =100.0;
//       }
//       // await socketHandler.setLowResolution();
//
//
//
//   }
//   // Function to decrease slider value
//   void _decreaseValue() {
//     if (slRtspStreamingBloc.isStreamStarted) {
//       double newValue = (currentSliderValue.value + 10)
//           .clamp(30, 100); // Ensure it stays within range
//       currentSliderValue.value = newValue;
//       slRtspStreamingBloc
//           .add(RtspStreamingEvent.setFovOptionsEvent(newValue.toString()));
//       currentSliderValue.notifyListeners();
//     }
//   }
//
//   void _increaseValue() {
//     if (slRtspStreamingBloc.isStreamStarted) {
//       double newValue = (currentSliderValue.value - 10)
//           .clamp(30, 100); // Ensure it stays within range
//       currentSliderValue.value = newValue;
//       slRtspStreamingBloc
//           .add(RtspStreamingEvent.setFovOptionsEvent(newValue.toString()));
//       currentSliderValue.notifyListeners();
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RtspStreamingBloc, RtspStreamingState>(
//       builder: (context, state) {
//         bool isLoading = state.isFovLoading;
//         return isLoading
//             ? const LinearProgressIndicator()
//             : Row(
//                 children: [
//                   InkWell(
//                     onTap: isLoading ? null : _decreaseValue,
//                     child: Container(
//                       width: 30.w,
//                       height: 35.h,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: AppColors.white,
//                           width: 1.0,
//                         ),
//                         color: Colors.transparent,
//                       ),
//                       child: Icon(
//                         Icons.remove,
//                         color: AppColors.white,
//                         size: 25.h,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6.w),
//                         color: AppColors.white,
//                       ),
//                       height: 20.h,
//                       child: Stack(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(6.w),
//                                       bottomLeft: Radius.circular(6.w)),
//                                   color: AppColors.kPrimaryColor,
//                                 ),
//                                 margin: EdgeInsets.fromLTRB(1.h, 1.h, 0, 0),
//                                 width: 30.h,
//                                 height: 18.h,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColors.sliderDotsColor,
//                                     shape: BoxShape.circle),
//                                 // margin: EdgeInsets.all(4.h),
//                                 height: 6.h,
//                                 width: 6.w,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColors.sliderDotsColor,
//                                     shape: BoxShape.circle),
//                                 // margin: EdgeInsets.all(4.h),
//                                 height: 6.h,
//                                 width: 6.w,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColors.sliderDotsColor,
//                                     shape: BoxShape.circle),
//                                 // margin: EdgeInsets.all(4.h),
//                                 height: 6.h,
//                                 width: 6.w,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColors.sliderDotsColor,
//                                     shape: BoxShape.circle),
//                                 // margin: EdgeInsets.all(4.h),
//                                 height: 6.h,
//                                 width: 6.w,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColors.sliderDotsColor,
//                                     shape: BoxShape.circle),
//                                 // margin: EdgeInsets.all(4.h),
//                                 height: 6.h,
//                                 width: 6.w,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColors.sliderDotsColor,
//                                     shape: BoxShape.circle),
//                                 // margin: EdgeInsets.all(4.h),
//                                 height: 6.h,
//                                 width: 6.w,
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     color: AppColors.sliderDotsColor,
//                                     shape: BoxShape.circle),
//                                 // margin: EdgeInsets.all(6.h),
//                                 height: 6.h,
//                                 width: 6.w,
//                               )
//                             ],
//                           ),
//                           // ValueListenableBuilder<double>(
//                           //   valueListenable: currentSliderValue,
//                           //   builder: (context, value, child) {
//                           //     // double mappedValue = ((value - 30) / 70) * 7 + 1;
//                           //     // mappedValue = double.parse(
//                           //     //     mappedValue.toStringAsFixed(
//                           //     //         2)); // Round to 2 decimal places
//                           //     double reversedValue = 100 - (value - 30); // Mapping 30 → 100 and 100 → 30
//                           //     double mappedValue = ((value - 30) / 70) * 7 + 1;
//                           //     mappedValue = double.parse(mappedValue.toStringAsFixed(2)); // Round to 2 decimal places
//                           //
//                           //
//                           //     return FlutterSlider(
//                           //       values: [value],
//                           //       // label: value.round().toString(),
//                           //       // value: value,
//                           //       min: 30,
//                           //       max: 100,
//                           //       // disabled: true,
//                           //       step: const FlutterSliderStep(
//                           //         step: 1,
//                           //         isPercentRange: false,
//                           //       ),
//                           //       jump: true,
//                           //       handler: FlutterSliderHandler(
//                           //         decoration: const BoxDecoration(),
//                           //         child: Container(
//                           //           height: 18.h,
//                           //           width: 16.w,
//                           //           margin: EdgeInsets.all(1.h),
//                           //           decoration: BoxDecoration(
//                           //             borderRadius: BorderRadius.circular(6.w),
//                           //             color: AppColors.kPrimaryColor,
//                           //           ),
//                           //         ),
//                           //       ),
//                           //       trackBar: FlutterSliderTrackBar(
//                           //         activeTrackBarHeight: 18.h,
//                           //         inactiveTrackBarHeight: 20.h,
//                           //         activeTrackBar: BoxDecoration(
//                           //           color: AppColors.kPrimaryColor,
//                           //           borderRadius: BorderRadius.circular(20.w),
//                           //         ),
//                           //         inactiveTrackBar: BoxDecoration(
//                           //           color: Colors.transparent,
//                           //           borderRadius: BorderRadius.circular(20.w),
//                           //         ),
//                           //       ),
//                           //       tooltip: FlutterSliderTooltip(
//                           //         textStyle: TextStyle(
//                           //             fontSize: 10.h, color: Colors.black),
//                           //         boxStyle: FlutterSliderTooltipBox(
//                           //           decoration: BoxDecoration(
//                           //             color: Colors.white,
//                           //             borderRadius: BorderRadius.circular(8),
//                           //             border: Border.all(
//                           //                 color: Colors.grey.shade400),
//                           //           ),
//                           //         ),
//                           //         format: (val) =>
//                           //             "${mappedValue.toStringAsFixed(1)}x", // ✅ Tooltip shows 1-8
//                           //       ),
//                           //       onDragCompleted:
//                           //           (handlerIndex, lowerValue, upperValue) {
//                           //         if (isLoading) {
//                           //         } else if (slRtspStreamingBloc.isStreamStarted){
//                           //           // slRtspStreamingBloc.add(
//                           //           //     const RtspStreamingEvent
//                           //           //         .disposeBloc());
//                           //           String newValue = value.toInt().toString();
//                           //           print('onDragCompleted');
//                           //           print(newValue);
//                           //           slRtspStreamingBloc.add(RtspStreamingEvent.setFovOptionsEvent(newValue));
//                           //           fovOption.value = newValue;
//                           //           // currentSliderValue.value =newValue);
//                           //           // Handle slider value change end logic here
//                           //           // setState(() {
//                           //           //   _sliderValue = lowerValue;
//                           //           // });
//                           //         }
//                           //       },
//                           //       onDragging:
//                           //           (handlerIndex, lowerValue, upperValue) {
//                           //         if (isLoading) {
//                           //         } else if (slRtspStreamingBloc.isStreamStarted) {
//                           //           currentSliderValue.value = lowerValue;
//                           //           // currentSliderValue.value =newValue);
//                           //           // Handle slider value change end logic here
//                           //           // setState(() {
//                           //           //   _sliderValue = lowerValue;
//                           //           // });
//                           //         }
//                           //       },
//                           //     );
//                           //     // return Slider(
//                           //     //   label: value.round().toString(),
//                           //     //   value: value,
//                           //     //   onChanged: (newValue) {
//                           //     //     // print(newValue.toString());
//                           //     //     currentSliderValue.value = newValue;
//                           //     //     // fovOption.value = newValue;
//                           //     //     // currentSliderValue.value =newValue!);
//                           //     //   },
//                           //     //   onChangeEnd: (value) {
//                           //     //     String newValue = value.toInt().toString();
//                           //     //     print(newValue);
//                           //     //     fovOption.value = newValue;
//                           //     //     currentSliderValue.value =newValue);
//                           //     //     // Handle slider value change end logic here
//                           //     //   },
//                           //     //
//                           //     //   // divisions: 70,
//                           //     //   min: 30,
//                           //     //   max: 100,
//                           //     // );
//                           //   },
//                           // ),
//                           ValueListenableBuilder<double>(
//                             valueListenable: currentSliderValue,
//                             builder: (context, value, child) {
//                               double reversedValue = 100 - (value - 30); // Maps 30 → 100 and 100 → 30
//
//                               double mappedValue = ((reversedValue - 30) / 70) * 7 + 1; // Adjust mapped value
//                               mappedValue = double.parse(mappedValue.toStringAsFixed(2)); // Round to 2 decimal places
//
//                               return FlutterSlider(
//                                 values: [reversedValue],
//                                 min: 30,
//                                 max: 100,
//                                 step: const FlutterSliderStep(
//                                   step: 1,
//                                   isPercentRange: false,
//                                 ),
//                                 jump: true,
//
//                                 handler: FlutterSliderHandler(
//                                   decoration: const BoxDecoration(),
//                                   child: Container(
//                                     height: 18.h,
//                                     width: 16.w,
//                                     margin: EdgeInsets.all(1.h),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6.w),
//                                       color: AppColors.kPrimaryColor,
//                                     ),
//                                   ),
//                                 ),
//
//                                 trackBar: FlutterSliderTrackBar(
//                                   activeTrackBarHeight: 18.h,
//                                   inactiveTrackBarHeight: 20.h,
//                                   activeTrackBar: BoxDecoration(
//                                     color: AppColors.kPrimaryColor,
//                                     borderRadius: BorderRadius.circular(20.w),
//                                   ),
//                                   inactiveTrackBar: BoxDecoration(
//                                     color: Colors.transparent,
//                                     borderRadius: BorderRadius.circular(20.w),
//                                   ),
//                                 ),
//
//                                 tooltip: FlutterSliderTooltip(
//                                   textStyle: TextStyle(fontSize: 10.h, color: Colors.black),
//                                   boxStyle: FlutterSliderTooltipBox(
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(8),
//                                       border: Border.all(color: Colors.grey.shade400),
//                                     ),
//                                   ),
//                                   format: (val) => "${mappedValue.toStringAsFixed(1)}x", // ✅ Tooltip shows 1-8
//                                 ),
//
//                                 onDragCompleted: (handlerIndex, lowerValue, upperValue) {
//                                   if (!isLoading && slRtspStreamingBloc.isStreamStarted) {
//                                     double actualValue = 100.0 - (lowerValue - 30.0); // ✅ Convert back to normal value
//                                     String newValue = actualValue.toInt().toString();
//                                     print('onDragCompleted - Reversed: $lowerValue | Actual: $newValue');
//
//                                     slRtspStreamingBloc.add(RtspStreamingEvent.setFovOptionsEvent(newValue));
//                                     fovOption.value = newValue;
//                                   }
//                                 },
//
//                                 onDragging: (handlerIndex, lowerValue, upperValue) {
//                                   if (!isLoading && slRtspStreamingBloc.isStreamStarted) {
//                                     double actualValue = 100.0 - (lowerValue - 30.0); // ✅ Convert back to normal value
//                                     print('onDragging - Reversed: $lowerValue | Actual: $actualValue');
//                                     currentSliderValue.value = actualValue;
//                                   }
//                                 },
//                               );
//                             },
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: isLoading ? null : _increaseValue,
//                     child: Container(
//                       width: 30.w,
//                       height: 35.h,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: AppColors.white,
//                           width: 1.0,
//                         ),
//                         color: Colors.transparent,
//                       ),
//                       child: Icon(
//                         Icons.add,
//                         color: AppColors.white,
//                         size: 25.h,
//                       ),
//                     ),
//                   )
//                 ],
//               );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/train/session/presentation/bloc/rtsp_streaming/rtsp_streaming_bloc.dart';
import '../../features/train/session/presentation/component/fram_streaming_widget.dart';
import '../theme/theme_data/theme_data.dart';

class ShotStopsDemo extends StatelessWidget {
  const ShotStopsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Example usage with your labels and default selected “10”
    // 3 for 6 y
    // 4 for 7 y,
    // 9 for 10 y
    // 11 for 12 y
    // 13 for 15 y
    // 20 for 20 y
    return ShotStopsSelector(
      labels: const [
        '6',
        '7',
        '10',
        '12',
        '15',
        '20'
      ],
      initialIndex: 1, // "10"
      onChanged: (index, label) {
        // handle selection change
        // print('Selected $label at $index');
      },
    );
  }
}

class ShotStopsSelector extends StatefulWidget {
  final List<String> labels;
  final int initialIndex;
  final void Function(int index, String label)? onChanged;

  const ShotStopsSelector({
    super.key,
    required this.labels,
    this.initialIndex = 1,
    this.onChanged,
  });

  @override
  State<ShotStopsSelector> createState() => _ShotStopsSelectorState();
}

class _ShotStopsSelectorState extends State<ShotStopsSelector> {
  late int _sliderValue;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.initialIndex;
  }

  void _setIndex(int value) {
    setState(() {
      _sliderValue = value;
    });
    int index = value.toInt();
    widget.onChanged?.call(index, widget.labels[index]);
  }

  @override
  Widget build(BuildContext context) {
    final bg = AppTheme.primary(context).withOpacity(0.2); // dark track
    final chipInactive = const Color(0xFFE8E8E8);
    final chipActive =
        const Color(0xFFFFE3CE); // light peach on the orange fill
    final orange = AppTheme.primary(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: BlocBuilder<RtspStreamingBloc, RtspStreamingState>(
        builder: (context, state) {
          bool isLoading = state.isFovLoading ||  state.isLoading;
          return isLoading
              ? const LinearProgressIndicator()
              : Row(
                  children: [
                    _RoundIconButton(
                        icon: Icons.remove,
                        onTap: isLoading
                            ? () {}
                            : () {
                                if (_sliderValue > 0) {
                                  int i = _sliderValue - 1;
                                  _setIndex(i);
                                  // 3 , 4 5 6 7 8 9 10 11 12 13 15 20
                          //         3 for 6 y , 0
                          //         4 for 7 y, 1
                          // 9 for 10 y , 6
                          // 11 for 12 y 8
                          // 13 for 15 y 10
                          // 20 for 20 y
                                  if (i == 0) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '90', false));
                                  }
                                  else if (i == 1) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '85', false));
                                  }
                                  else if (i == 2) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '60', false));
                                  }
                                  else if (i == 3) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '50', false));
                                  }
                                  else if (i == 4) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '40', false));
                                  }
                                  else if (i == 5) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '30', false));
                                  }
                                  else {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '85', false));
                                  }
                                }
                              }),
                    const SizedBox(width: 8),
                    // The pill track with orange fill behind chips
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          final fillFactor =
                              (_sliderValue + 1) / widget.labels.length;
                          final fillWidth = width * fillFactor;

                          return Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              // Base track
                              Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: bg,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              // Orange fill up to selected chip
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 220),
                                curve: Curves.easeOut,
                                width: fillWidth,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [orange.withOpacity(0.85), orange],
                                  ),
                                ),
                              ),
                              // Chips row
                              Row(
                                children:
                                    List.generate(widget.labels.length, (i) {
                                  final label = widget.labels[i];
                                  final isSelected = i == _sliderValue.toInt();
                                  final isOnOrange = i <= _sliderValue.toInt();

                                  final chipColor = isSelected
                                      ? orange
                                      : (isOnOrange
                                          ? chipActive
                                          : chipInactive);

                                  final textColor = isSelected
                                      ? AppTheme.textPrimary(context)
                                      : (isOnOrange
                                          ? Colors.black87
                                          : Colors.black87);

                                  return Expanded(
                                    child: Center(
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () {
                                          _setIndex(i);
                                          print("new_FOV_ ; $i");
                                          if (i == 0) {
                                            slRtspStreamingBloc.add(
                                                RtspStreamingEvent.setFovOptionsEvent(
                                                    '90', false));
                                          }
                                          else if (i == 1) {
                                            slRtspStreamingBloc.add(
                                                RtspStreamingEvent.setFovOptionsEvent(
                                                    '85', false));
                                          }
                                          else if (i == 2) {
                                            slRtspStreamingBloc.add(
                                                RtspStreamingEvent.setFovOptionsEvent(
                                                    '60', false));
                                          }
                                          else if (i == 3) {
                                            slRtspStreamingBloc.add(
                                                RtspStreamingEvent.setFovOptionsEvent(
                                                    '50', false));
                                          }
                                          else if (i == 4) {
                                            slRtspStreamingBloc.add(
                                                RtspStreamingEvent.setFovOptionsEvent(
                                                    '40', false));
                                          }
                                          else if (i == 5) {
                                            slRtspStreamingBloc.add(
                                                RtspStreamingEvent.setFovOptionsEvent(
                                                    '30', false));
                                          }
                                          else {
                                            slRtspStreamingBloc.add(
                                                RtspStreamingEvent.setFovOptionsEvent(
                                                    '85', false));
                                          }

                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 180),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: chipColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.05),
                                                blurRadius: 2,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            label,
                                            style: TextStyle(
                                              fontWeight: isSelected
                                                  ? FontWeight.w700
                                                  : FontWeight.w600,
                                              color: textColor,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    _RoundIconButton(
                        icon: Icons.add,
                        onTap: isLoading
                            ? () {}
                            : () {
                                if (_sliderValue < 6) {
                                  int i = _sliderValue + 1;
                                  _setIndex(i);
                                  if (i == 0) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '90', false));
                                  }
                                  else if (i == 1) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '85', false));
                                  }
                                  else if (i == 2) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '60', false));
                                  }
                                  else if (i == 3) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '50', false));
                                  }
                                  else if (i == 4) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '40', false));
                                  }
                                  else if (i == 5) {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '30', false));
                                  }
                                  else {
                                    slRtspStreamingBloc.add(
                                        RtspStreamingEvent.setFovOptionsEvent(
                                            '85', false));
                                  }
                                  // if (i == 0) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '90', false));
                                  // } else if (i == 1) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '85', false));
                                  // } else if (i == 2) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '80', false));
                                  // } else if (i == 3) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '75', false));
                                  // } else if (i == 4) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '70', false));
                                  // } else if (i == 5) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '65', false));
                                  // } else if (i == 6) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '60', false));
                                  // } else if (i == 7) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '55', false));
                                  // } else if (i == 8) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '50', false));
                                  // } else if (i == 9) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '45', false));
                                  // } else if (i == 10) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '40', false));
                                  // } else if (i == 11) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '35', false));
                                  // } else if (i == 12) {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '30', false));
                                  // } else {
                                  //   slRtspStreamingBloc.add(
                                  //       RtspStreamingEvent.setFovOptionsEvent(
                                  //           '65', false));
                                  // }

                                }
                              }),
                  ],
                );
        },
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.primary(context).withOpacity(0.2),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 30,
          height: 30,
          child: Icon(icon, size: 16, color: AppTheme.textPrimary(context)),
        ),
      ),
    );
  }
}

// class ShotStopsDemo extends StatelessWidget {
//   const ShotStopsDemo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Example usage with your labels and default selected “10”
//     return ShotStopsSelector(
//       labels: const ['•', '6', '7', '8', '10', '12', '15', '20'],
//       initialIndex: 4, // "10"
//       onChanged: (index, label) {
//         // handle selection change
//         // print('Selected $label at $index');
//       },
//     );
//   }
// }
//
// class ShotStopsSelector extends StatefulWidget {
//   final List<String> labels;
//   final int initialIndex;
//   final void Function(int index, String label)? onChanged;
//
//   const ShotStopsSelector({
//     super.key,
//     required this.labels,
//     this.initialIndex = 0,
//     this.onChanged,
//   });
//
//   @override
//   State<ShotStopsSelector> createState() => _ShotStopsSelectorState();
// }
//
// class _ShotStopsSelectorState extends State<ShotStopsSelector> {
//   late int _index;
//
//   @override
//   void initState() {
//     super.initState();
//     _index = widget.initialIndex.clamp(0, widget.labels.length - 1);
//   }
//
//   void _setIndex(int i) {
//     setState(() => _index = i.clamp(0, widget.labels.length - 1));
//     widget.onChanged?.call(_index, widget.labels[_index]);
//   }
//
//   void _increment() => _setIndex(_index + 1);
//   void _decrement() => _setIndex(_index - 1);
//
//   @override
//   Widget build(BuildContext context) {
//     final bg = const Color(0xFF5A5A5A);      // dark track
//     final chipInactive = const Color(0xFFE8E8E8);
//     final chipActive = const Color(0xFFFFE3CE); // light peach on the orange fill
//     final orange = const Color(0xFFFF7A00);
//
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Row(
//         children: [
//           _RoundIconButton(icon: Icons.remove, onTap: _decrement),
//           const SizedBox(width: 3),
//           // The pill track with orange fill behind chips
//           Expanded(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 final width = constraints.maxWidth;
//                 final fillFactor = (_index + 1) / widget.labels.length;
//                 final fillWidth = width * fillFactor;
//
//                 return Stack(
//                   alignment: Alignment.centerLeft,
//                   children: [
//                     // Base track
//                     Container(
//                       height: 55,
//                       decoration: BoxDecoration(
//                         color: bg,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     // Orange fill up to selected chip
//                     AnimatedContainer(
//                       duration: const Duration(milliseconds: 220),
//                       curve: Curves.easeOut,
//                       width: fillWidth,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [orange.withOpacity(0.85), orange],
//                         ),
//                       ),
//                     ),
//                     // Chips row
//                     Row(
//                       children: List.generate(widget.labels.length, (i) {
//                         final label = widget.labels[i];
//                         final isSelected = i == _index;
//                         final isOnOrange = i <= _index;
//
//                         final chipColor = isSelected
//                             ? orange
//                             : (isOnOrange ? chipActive : chipInactive);
//
//                         final textColor = isSelected
//                             ? Colors.white
//                             : (isOnOrange ? Colors.black87 : Colors.black87);
//
//                         return Expanded(
//                           child: Center(
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(10),
//                               onTap: () => _setIndex(i),
//                               child: AnimatedContainer(
//                                 duration: const Duration(milliseconds: 180),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 6),
//                                 decoration: BoxDecoration(
//                                   color: chipColor,
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Text(
//                                   label,
//                                   style: TextStyle(
//                                     fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
//                                     color: textColor,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           const SizedBox(width: 8),
//           _RoundIconButton(icon: Icons.add, onTap: _increment),
//         ],
//       ),
//     );
//   }
// }
//
// class _RoundIconButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//   const _RoundIconButton({required this.icon, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: const Color(0xFFE0E0E0),
//       shape: const CircleBorder(),
//       child: InkWell(
//         customBorder: const CircleBorder(),
//         onTap: onTap,
//         child:  SizedBox(
//           width: 30,
//           height: 30,
//           child: Icon(icon, size: 16, color: Colors.black54),
//         ),
//       ),
//     );
//   }
// }
