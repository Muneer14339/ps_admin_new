import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

class ExitSaveButton extends StatelessWidget {
  final String firstButton;
  final String secondButton;
  final VoidCallback? onTapFirstButton;
  final VoidCallback? onTapSecondButton;
  const ExitSaveButton({
    super.key,
    required this.firstButton,
    required this.secondButton,
    this.onTapFirstButton,
    this.onTapSecondButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: onTapFirstButton,
          style: TextButton.styleFrom(
            fixedSize: Size(146.w, 52.h),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.black),
              borderRadius: BorderRadius.circular(10.w),
            ),
          ),
          child: Text(
            firstButton,
            style: TextStyle(
                color: AppColors.blackTextColor,
                fontSize: 16.sp,
                fontFamily: AppFontFamily.bold),
          ),
        ),
        TextButton(
          onPressed: onTapSecondButton,
          style: TextButton.styleFrom(
            fixedSize: Size(146.w, 52.h),
            backgroundColor: AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.w),
            ),
          ),
          child: Text(
            secondButton,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 16.sp,
                fontFamily: AppFontFamily.bold),
          ),
        ),
      ],
    );
  }
}
