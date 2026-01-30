import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';

class SigninTextfield extends StatelessWidget {
  final String hintText;
  final String icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? isEisabled;
  final String? suffixicon;
  final bool? isObscure;
  final VoidCallback? visibility;
  final double preIconHeight;
  const SigninTextfield(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.controller,
      this.isEisabled,
      this.suffixicon,
      this.isObscure,
      this.validator,
      required this.preIconHeight,
      this.visibility});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
          color: AppColors.greyTextColor,
          fontSize: 14.sp,
          fontFamily: AppFontFamily.regular),
      validator: validator,
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        enabled: isEisabled ?? true,
        prefixIconConstraints: BoxConstraints(maxHeight: 20.h),
        suffixIcon: isEisabled != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Transform.rotate(
                  angle: 1.57, // Rotate 90 degrees (π/2 radians)
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.black,
                    size: 18.w,
                  ),
                ))
            : isObscure != null
                ? IconButton(
                    icon: Icon(
                      (isObscure != null && isObscure!)
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    color: AppColors.greyTextColor,
                    onPressed: visibility,
                  )
                : null,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Image.asset(
            icon,
            color: AppColors.greyTextColor,
            height: preIconHeight,
          ),
        ),
        filled: true,
        // fillColor: AppColors.greyTextfieldBack,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.w),
          borderSide: BorderSide.none,
        ),
        labelText: hintText,
        labelStyle: TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 14.sp,
            fontFamily: AppFontFamily.regular),
      ),
    );
  }
}
