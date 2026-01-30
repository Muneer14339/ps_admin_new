import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {required this.title,
      this.onTap,
      this.buttonColor,
      this.width,
      this.circularRadius,
      this.textColor,
      this.margin,
      this.addBottomMargin,
      this.style,
      super.key});
  final String title;
  final Function()? onTap;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? circularRadius;
  final EdgeInsets? margin;
  final bool? addBottomMargin;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ModifiedContainer(
          onTap: onTap,
          padding: const EdgeInsets.all(10),
          margin: margin,
          // height: h,
          width: width,
          color: buttonColor ?? Theme.of(context).primaryColor,
          borderRadius: circularRadius ?? 12,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: style ??
                  TextStyle(
                      color: textColor ?? AppColors.greyTextfieldBack,
                      fontFamily: AppFontFamily.bold,
                      fontSize: 10.sp),
            ),
          ),
        ),
        if (addBottomMargin == true) const SizedBox(height: 20)
      ],
    );
  }
}
