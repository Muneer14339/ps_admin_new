import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final double? radius;
  final VoidCallback onTap;
  final double? horizontalPadding;
  const OrangeButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.radius,
      this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 24.w),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          minimumSize: Size(312.w, 46.h),
          maximumSize: Size(double.infinity, 46.h),
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.w),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 14.sp,
              fontFamily: AppFontFamily.regular),
        ),
      ),
    );
  }
}
