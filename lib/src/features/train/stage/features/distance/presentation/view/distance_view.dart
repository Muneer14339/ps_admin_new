
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/exit_save_button.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/stage/features/distance/data/local/service/distance_db_helper.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';

import '../../../../../../../core/services/locator/locator.dart';

class DistanceView extends StatefulWidget {
  final StageEntity stageEntity;
  const DistanceView({super.key, required this.stageEntity});

  @override
  State<DistanceView> createState() => _DistanceViewState();
}

class _DistanceViewState extends State<DistanceView> {
  int selectedDistance = 0;
  List<int> selectedDigits = [0, 0, 0, 0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDigits =
        convertDistanceStringToDigits(widget.stageEntity.distance ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StageBloc, StageState>(
      builder: (context, state) {
        return CustomPaint(
          painter: TrainBackgroundPainter(context),
          child: Scaffold(
            appBar: appBarCustom(ctx: context, title: 'Distance'),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Select Distance',
                        style: TextStyle(
                            fontSize: 18.sp,
                            // color: AppColors.blackTextColor,
                            fontFamily: AppFontFamily.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 33.h),
                  Container(
                    height: 217.h,
                    width: 312.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: AppColors.borderOutline, width: 2)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: 'MIN:',
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        fontFamily: AppFontFamily.bold,
                                        fontSize: 14.sp),
                                    children: [
                                      TextSpan(
                                          text: ' 1 meter',
                                          style: TextStyle(
                                              color: AppColors.greyTextColor,
                                              fontFamily: AppFontFamily.regular,
                                              fontSize: 14.sp))
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: 'MAX:',
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                        // color: AppColors.blackTextColor,
                                        fontFamily: AppFontFamily.bold,
                                        fontSize: 14.sp),
                                    children: [
                                      TextSpan(
                                          text: ' 5000 meters',
                                          style: TextStyle(
                                              color: AppColors.greyTextColor,
                                              fontFamily: AppFontFamily.regular,
                                              fontSize: 14.sp))
                                    ]),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 40.h, 0, 32.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: (state is DistanceUpdated)
                                ? [
                                    buildNumberPicker(
                                        0,
                                        getMaxValueForFirstPicker(
                                            state.selectedDigits),
                                        state
                                            .selectedDigits), // First picker (thousands)
                                    buildNumberPicker(
                                        1,
                                        getMaxValueForOtherPickers(
                                            1, state.selectedDigits),
                                        state
                                            .selectedDigits), // Second picker (hundreds)
                                    buildNumberPicker(
                                        2,
                                        getMaxValueForOtherPickers(
                                            2, selectedDigits),
                                        state
                                            .selectedDigits), // Third picker (tens)
                                    buildNumberPicker(
                                        3,
                                        getMaxValueForOtherPickers(
                                            3, selectedDigits),
                                        state
                                            .selectedDigits), // Fourth picker (ones)
                                  ]
                                : [
                                    buildNumberPicker(
                                        0,
                                        getMaxValueForFirstPicker(
                                            selectedDigits),
                                        selectedDigits), // First picker (thousands)
                                    buildNumberPicker(
                                        1,
                                        getMaxValueForOtherPickers(
                                            1, selectedDigits),
                                        selectedDigits), // Second picker (hundreds)
                                    buildNumberPicker(
                                        2,
                                        getMaxValueForOtherPickers(
                                            2, selectedDigits),
                                        selectedDigits), // Third picker (tens)
                                    buildNumberPicker(
                                        3,
                                        getMaxValueForOtherPickers(
                                            3, selectedDigits),
                                        selectedDigits), // Fourth picker (ones)
                                  ],
                          ),
                        ),
                        Text(
                          'Selected Distance: ${state is DistanceUpdated ? getTotalDistance(state.selectedDigits) : getTotalDistance(selectedDigits)} meter',
                          style: TextStyle(
                              fontFamily: AppFontFamily.regular,
                              // color: AppColors.blackTextColor,
                              fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  ExitSaveButton(
                      firstButton: 'Exit',
                      onTapFirstButton: () => Navigator.pop(context),
                      secondButton: 'Save',
                      onTapSecondButton: () async {
                        widget.stageEntity.distance =
                            '${state is DistanceUpdated ? getTotalDistance(state.selectedDigits) : getTotalDistance(selectedDigits)} meter';
                        await DistanceDbHelper().updateDistanceinStage(
                            locator<LocalStorageService>().userIdString,
                            '${state is DistanceUpdated ? getTotalDistance(state.selectedDigits) : getTotalDistance(selectedDigits)}');
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<int> convertDistanceStringToDigits(String distanceString) {
    // Step 1: Extract the numeric part from the string
    String numericPart = distanceString.split(' ').first;

    // Step 2: Convert the extracted string to an integer
    int distance = int.tryParse(numericPart) ?? 0;

    // Step 3: Convert the distance into a list of digits (thousands, hundreds, tens, ones)
    List<int> digits = [0, 0, 0, 0]; // Initialize a list for 4 digits

    if (distance >= 1000) {
      digits[0] = (distance ~/ 1000); // Thousands place
      distance %= 1000; // Reduce the number by thousands
    }
    if (distance >= 100) {
      digits[1] = (distance ~/ 100); // Hundreds place
      distance %= 100; // Reduce the number by hundreds
    }
    if (distance >= 10) {
      digits[2] = (distance ~/ 10); // Tens place
      distance %= 10; // Reduce the number by tens
    }
    digits[3] = distance; // Ones place

    return digits;
  }

  // Function to calculate the total selected distance based on digits
  int getTotalDistance(List<int> selectedDigs) {
    return selectedDigs[0] * 1000 +
        selectedDigs[1] * 100 +
        selectedDigs[2] * 10 +
        selectedDigs[3];
  }

  // Function to determine the max value for the first picker (thousands)
  int getMaxValueForFirstPicker(List<int> theSelectedDigs) {
    if (theSelectedDigs[1] > 0 ||
        theSelectedDigs[2] > 0 ||
        theSelectedDigs[3] > 0) {
      return 4; // If any digit other than the first is greater than 0, cap the first picker at 4
    } else {
      return 5; // Otherwise, allow the first picker to go up to 5
    }
  }

  // Function to determine the max value for the first picker (thousands)
  int getMaxValueForOtherPickers(int index, List<int> theSelectedDigs) {
    if (theSelectedDigs[0] == 5) {
      return 0; // If the first picker is set to 5, the others must be 0
    }
    return 9; // Otherwise, allow the pickers to go up to 9
  }

  // Widget to build individual number pickers for each digit
  Widget buildNumberPicker(int index, int maxValue, List<int> pickedDigits) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 12.h),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor, //AppColors.greyTextfieldBack,
            borderRadius: BorderRadius.circular(6.h)),
        child: NumberPicker(
          // decoration: BoxDecoration(color: AppColors.greyTextfieldBack),
          value: pickedDigits[index],
          itemCount: 1,
          minValue: 0,
          maxValue: maxValue,
          itemWidth: 40,
          itemHeight: 45.h,
          selectedTextStyle:
              TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
          textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),

          onChanged: (value) {
            List<int> updatedDigits = List.from(pickedDigits);
            updatedDigits[index] = value;
            context
                .read<StageBloc>()
                .add(DistanceChanged(updatedDigits, value, index));
            // setState(() {
            //   selectedDigits[index] = value;
            //   if (selectedDigits[0] == 5) {
            //     // If the first digit is 5, reset the other digits to 0
            //     selectedDigits[1] = 0;
            //     selectedDigits[2] = 0;
            //     selectedDigits[3] = 0;
            //   }
            // });
          },
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:numberpicker/numberpicker.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';// import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
// import 'package:pa_sreens/src/core/theme/widgets/exit_save_button.dart';
// import 'package:pa_sreens/src/features/stage_screen/domain/stage_entity.dart';
// import 'package:pa_sreens/src/features/stage_screen/presentation/stage_bloc/stage_bloc.dart';

// class DistanceView extends StatefulWidget {
//   StageEntity stageEntity;
//   DistanceView({super.key, required this.stageEntity});

//   @override
//   State<DistanceView> createState() => _DistanceViewState();
// }

// class _DistanceViewState extends State<DistanceView> {
//   int selectedDistance = 0;
//   List<int> selectedDigits = [0, 0, 0, 0];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         toolbarHeight: 100.h,
//         backgroundColor: AppColors.white,
//         centerTitle: true,
//         title: Text(
//           'Distance',
//           style: TextStyle(
//               fontSize: 20.sp,
//               color: AppColors.blackTextColor,
//               fontFamily: AppFontFamily.bold),
//         ),
//         leading: InkWell(
//             onTap: () => Navigator.pop(context),
//             child: const Icon(Icons.arrow_back_ios_new)),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 0.w),
//         child: Column(
//           children: [
//             // Padding(
//             //   padding: EdgeInsets.symmetric(horizontal: 24.w),
//             //   child:
//             //    Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     children: [
//             //       Text(
//             //         'Set your preferred distance',
//             //         style: TextStyle(
//             //             fontSize: 18.sp,
//             //             color: AppColors.blackTextColor,
//             //             fontFamily: AppFontFamily.bold),
//             //       ),
//             //       InkWell(
//             //         onTap: () => Navigator.push(
//             //             context,
//             //             MaterialPageRoute(
//             //                 builder: (context) => const SetDistanceView())),
//             //         child: Icon(
//             //           Icons.add,
//             //           color: AppColors.kPrimaryColor,
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             SizedBox(
//               height: 32.h,
//             ),

//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   'Select Distance',
//                   style: TextStyle(
//                       fontSize: 18.sp,
//                       color: AppColors.blackTextColor,
//                       fontFamily: AppFontFamily.bold),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 33.h,
//             ),
//             Container(
//               height: 217.h,
//               width: 312.w,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: AppColors.borderOutline, width: 2)),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                               text: 'MIN:',
//                               style: TextStyle(
//                                   color: AppColors.blackTextColor,
//                                   fontFamily: AppFontFamily.bold,
//                                   fontSize: 14.sp),
//                               children: [
//                                 TextSpan(
//                                     text: ' 1 meter',
//                                     style: TextStyle(
//                                         color: AppColors.greyTextColor,
//                                         fontFamily: AppFontFamily.regular,
//                                         fontSize: 14.sp))
//                               ]),
//                         ),
//                         RichText(
//                           text: TextSpan(
//                               text: 'MAX:',
//                               style: TextStyle(
//                                   color: AppColors.blackTextColor,
//                                   fontFamily: AppFontFamily.bold,
//                                   fontSize: 14.sp),
//                               children: [
//                                 TextSpan(
//                                     text: ' 5000 meters',
//                                     style: TextStyle(
//                                         color: AppColors.greyTextColor,
//                                         fontFamily: AppFontFamily.regular,
//                                         fontSize: 14.sp))
//                               ]),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 40.h, 0, 32.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         buildNumberPicker(0,
//                             getMaxValueForFirstPicker()), // First picker (thousands)
//                         buildNumberPicker(
//                             1,
//                             getMaxValueForOtherPickers(
//                                 1)), // Second picker (hundreds)
//                         buildNumberPicker(
//                             2,
//                             getMaxValueForOtherPickers(
//                                 2)), // Third picker (tens)
//                         buildNumberPicker(
//                             3,
//                             getMaxValueForOtherPickers(
//                                 3)), // Fourth picker (ones)
//                       ],
//                     ),
//                   ),
//                   Text(
//                     'Selected Distance: ${getTotalDistance()} meter',
//                     style: TextStyle(
//                         fontFamily: AppFontFamily.regular,
//                         color: AppColors.blackTextColor,
//                         fontSize: 14.sp),
//                   )
//                 ],
//               ),
//             ),

//             const Spacer(),
//             ExitSaveButton(
//                 firstButton: 'Exit',
//                 onTapFirstButton: () => Navigator.pop(context),
//                 secondButton: 'Save',
//                 onTapSecondButton: () {
//                   widget.stageEntity.distance = '${getTotalDistance()} meter';
//                   context
//                       .read<StageBloc>()
//                       .add(StageUpdateEvent(stageEntity: widget.stageEntity));
//                   Navigator.pop(context);
//                 }),
//             SizedBox(
//               height: 20.h,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to calculate the total selected distance based on digits
//   int getTotalDistance() {
//     return selectedDigits[0] * 1000 +
//         selectedDigits[1] * 100 +
//         selectedDigits[2] * 10 +
//         selectedDigits[3];
//   }

//   // Function to determine the max value for the first picker (thousands)
//   int getMaxValueForFirstPicker() {
//     if (selectedDigits[1] > 0 ||
//         selectedDigits[2] > 0 ||
//         selectedDigits[3] > 0) {
//       return 4; // If any digit other than the first is greater than 0, cap the first picker at 4
//     } else {
//       return 5; // Otherwise, allow the first picker to go up to 5
//     }
//   }

//   // Function to determine the max value for the first picker (thousands)
//   int getMaxValueForOtherPickers(int index) {
//     if (selectedDigits[0] == 5) {
//       return 0; // If the first picker is set to 5, the others must be 0
//     }
//     return 9; // Otherwise, allow the pickers to go up to 9
//   }

//   // Widget to build individual number pickers for each digit
//   Widget buildNumberPicker(int index, int maxValue) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 6.w),
//       child: Container(
//         padding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 12.h),
//         decoration: BoxDecoration(
//             color: AppColors.greyTextfieldBack,
//             borderRadius: BorderRadius.circular(6.h)),
//         child: NumberPicker(
//           // decoration: BoxDecoration(color: AppColors.greyTextfieldBack),
//           value: selectedDigits[index],
//           itemCount: 1,
//           minValue: 0,
//           maxValue: maxValue,
//           itemWidth: 40,
//           itemHeight: 45.h,
//           selectedTextStyle:
//               TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
//           textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//           onChanged: (value) {
//             setState(() {
//               selectedDigits[index] = value;
//               if (selectedDigits[0] == 5) {
//                 // If the first digit is 5, reset the other digits to 0
//                 selectedDigits[1] = 0;
//                 selectedDigits[2] = 0;
//                 selectedDigits[3] = 0;
//               }
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
