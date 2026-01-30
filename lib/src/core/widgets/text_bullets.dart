import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

import '../theme/theme_data/theme_data.dart';

class BulletPointText extends StatelessWidget {
  final String text;
  final double? padding;
  const BulletPointText({super.key, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "•  ",
            style: TextStyle(fontSize: 20.sp, height: 1.25.h,color: AppTheme.textPrimary(context),),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                height: 1.5.h,
                fontFamily: AppFontFamily.regular,
                color: AppTheme.textPrimary(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
