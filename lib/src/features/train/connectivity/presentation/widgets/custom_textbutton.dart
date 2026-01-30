import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

import '../../../../../core/theme/theme_data/theme_data.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.image});
  final VoidCallback onPressed;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size(200, 48),
          maximumSize: Size(200, 48),
          backgroundColor: AppColors.kPrimaryColor, // Background color
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.w)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(image, height: 16.h),
          SizedBox(width: 20.w),
          Text(
            text,
            style: TextStyle(
                color: AppTheme.background(context),
                fontSize: 14.sp,
                fontFamily: AppFontFamily.bold),
          )
        ]));
  }
}
