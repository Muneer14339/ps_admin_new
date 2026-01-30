import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

class WhiteButton extends StatelessWidget {
  final String text;
  final double? radius;
  final VoidCallback onTap;
  final double? horizontalPadding;

  const WhiteButton(
      {super.key,
      required this.text,
      this.radius,
      required this.onTap,
      this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 24.w),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          minimumSize: Size(312.w, 48.h),
          backgroundColor: AppColors.white, // Background color

          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.black),
            borderRadius: BorderRadius.circular(radius ?? 10.w),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: AppColors.black,
              fontSize: 16.sp,
              fontFamily: AppFontFamily.bold),
        ),
      ),
    );
  }
}
