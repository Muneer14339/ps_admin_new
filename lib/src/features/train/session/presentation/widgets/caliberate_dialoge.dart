import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/constants.dart';

class CalibirateDialoge extends StatelessWidget {
  final ValueNotifier<bool> isVisibleNotifier =
      ValueNotifier(locator<LocalStorageService>().getSessionAlert2Visiblity);

  CalibirateDialoge({super.key, required this.isSessionAuto});
  final bool isSessionAuto;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isVisibleNotifier,
      builder: (context, isVisible, child) {
        return Visibility(
          visible: isVisible,
          // child: Container(
          //   margin: EdgeInsets.all( 12),
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).cardColor,
          //     borderRadius: BorderRadius.circular(6),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         Align(
          //           alignment: Alignment.topRight,
          //           child: InkWell(
          //             child: Icon(
          //               Icons.close,
          //               size: 24.h,
          //             ),
          //             onTap: () {
          //               isVisibleNotifier.value = false;
          //               locator<LocalStorageService>()
          //                   .saveSessionAlert2Visiblity(false);
          //             },
          //           ),
          //         ),
          //         Icon(
          //           Icons.error_outline_rounded,
          //           color: AppColors.kPrimaryColor,
          //         ),
          //         Text(
          //           'Note',
          //           style: TextStyle(
          //             color: AppColors.kPrimaryColor,
          //             fontSize: 20.h,
          //             fontFamily: AppFontFamily.bold,
          //           ),
          //         ),
          //         RichText(
          //           textAlign: TextAlign.center,
          //           text: TextSpan(
          //             children: [
          //               TextSpan(
          //                 text: 'Please Calibrate',
          //                 style: TextStyle(
          //                   color: AppColors.greyTextColor,
          //                   fontFamily: AppFontFamily.regular,
          //                   fontSize: 16.h,
          //                 ),
          //               ),
          //               WidgetSpan(
          //                 child: Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 2.0.w),
          //                   child: Image.asset(
          //                     'assets/icons/calibration.png',
          //                     color: AppColors.greyTextColor,
          //                     height: 16.h,
          //                   ),
          //                 ),
          //               ),
          //               TextSpan(
          //                 text: 'the Camera by clicking the calibration button',
          //                 style: TextStyle(
          //                   color: AppColors.greyTextColor,
          //                   fontFamily: AppFontFamily.regular,
          //                   fontSize: 16.h,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          child: Container(
              margin: EdgeInsets.only(top:  8.h , right: 4.w , left: 4.w),

          color: AppTheme.primary(context).withOpacity(0.2),
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.85),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isSessionAuto? autoModeTitle:continuingTitle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,color:  AppTheme.textPrimary(context)),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        RichText(
                          text: _parseText(isSessionAuto? autoModeContent:continuingContent,context),
                        ),
                        SizedBox(height: 5.h),
                        // TextButton(
                        //   onPressed: () => Navigator.of(context).pop(),
                        //   style: TextButton.styleFrom(
                        //     padding: EdgeInsets.zero,
                        //     minimumSize: Size.zero,
                        //     fixedSize: Size(50.w, 36.h),
                        //     backgroundColor: AppColors.kPrimaryColor,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(6.h),
                        //     ),
                        //   ),
                        //   child: Text(
                        //     'OK',
                        //     style: TextStyle(
                        //         color: AppColors.white,
                        //         fontSize: 18.h,
                        //         fontFamily: AppFontFamily.bold),
                        //   ),
                        // ),

                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 5.h),
                // TextButton(
                //   onPressed: () => Navigator.of(context).pop(),
                //   style: TextButton.styleFrom(
                //     padding: EdgeInsets.zero,
                //     minimumSize: Size.zero,
                //     fixedSize: Size(50.w, 36.h),
                //     backgroundColor: AppColors.kPrimaryColor,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(6.h),
                //     ),
                //   ),
                //   child: Text(
                //     'OK',
                //     style: TextStyle(
                //         color: AppColors.white,
                //         fontSize: 18.h,
                //         fontFamily: AppFontFamily.bold),
                //   ),
                // ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 10),
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.orange,
                //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                //       ),
                //       onPressed: () {
                //         Navigator.of(context).pop();
                //       },
                //       child: Text("OK", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                //     ),
                //   ),
                // ),

              ],
            ),
          ),
        );
      },
    );
  }
  TextSpan _parseText(String text,BuildContext context) {
    List<TextSpan> spans = [];
    RegExp exp = RegExp(r'(\*\*(.*?)\*\*)'); // Detects **bold text**
    Iterable<RegExpMatch> matches = exp.allMatches(text);

    int lastIndex = 0;
    for (RegExpMatch match in matches) {
      // Add normal text before bold match
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: text.substring(lastIndex, match.start)));
      }
      // Add bold text
      spans.add(TextSpan(
        text: match.group(2), // Extracts the bold text inside ** **
        style: TextStyle(fontWeight: FontWeight.bold,color: AppTheme.textPrimary(context)),
      ));
      lastIndex = match.end;
    }

    // Add remaining text after the last match
    if (lastIndex < text.length) {
      spans.add(TextSpan(text: text.substring(lastIndex)));
    }

    return TextSpan(
        style: TextStyle(fontSize: 14, color: AppTheme.textPrimary(context), height: 1.6),
        children: spans);
  }

}


// void showGenericDialog(BuildContext context, String title, String content) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         shape:
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//         child: Container(
//           constraints: BoxConstraints(
//               maxHeight: MediaQuery.of(context).size.height * 0.85),
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10.h),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: RichText(
//                     text: _parseText(content),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 5.h),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 style: TextButton.styleFrom(
//                   padding: EdgeInsets.zero,
//                   minimumSize: Size.zero,
//                   fixedSize: Size(50.w, 36.h),
//                   backgroundColor: AppColors.kPrimaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(6.h),
//                   ),
//                 ),
//                 child: Text(
//                   'OK',
//                   style: TextStyle(
//                       color: AppColors.white,
//                       fontSize: 18.h,
//                       fontFamily: AppFontFamily.bold),
//                 ),
//               ),
//
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(vertical: 10),
//               //   child: Align(
//               //     alignment: Alignment.center,
//               //     child: ElevatedButton(
//               //       style: ElevatedButton.styleFrom(
//               //         backgroundColor: Colors.orange,
//               //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//               //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//               //       ),
//               //       onPressed: () {
//               //         Navigator.of(context).pop();
//               //       },
//               //       child: Text("OK", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               //     ),
//               //   ),
//               // ),
//
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

