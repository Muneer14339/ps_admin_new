// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';// import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

// import 'package:pa_sreens/src/core/theme/widgets/custom_textfield.dart';
// import 'package:pa_sreens/src/core/theme/widgets/dropdown_custom.dart';
// import 'package:pa_sreens/src/core/theme/widgets/exit_save_button.dart';
// import 'package:pa_sreens/src/core/theme/widgets/pa_dropdown.dart';
// import 'package:pa_sreens/src/features/distance_screen/presentation/view/distance_screen.dart';

// class SetDistanceScreen extends StatefulWidget {
//   const SetDistanceScreen({super.key});

//   @override
//   State<SetDistanceScreen> createState() => _SetDistanceScreenState();
// }

// class _SetDistanceScreenState extends State<SetDistanceScreen> {
//   TextEditingController distanceController = TextEditingController();
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
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Set distance parameters',
//                   style: TextStyle(
//                       fontSize: 18.sp,
//                       color: AppColors.blackTextColor,
//                       fontFamily: AppFontFamily.bold),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 48.h,
//           ),
//           const PaDropdown(
//             hint: 'Type',
//             items: ['Feet', 'Meter', 'Miles', 'Yards'],
//           ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: CustomTextField(
//               controller: distanceController,
//               hintText: '10',
//             ),
//           ),
//           const Spacer(),
//           ExitSaveButton(
//               firstButton: 'Exit',
//               onTapFirstButton: () => Navigator.pop(context),
//               secondButton: 'Save'),
//           SizedBox(
//             height: 20.h,
//           )
//         ],
//       ),
//     );
//   }
// }
