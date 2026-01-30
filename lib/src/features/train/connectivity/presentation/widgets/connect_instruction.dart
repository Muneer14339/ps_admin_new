import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/text_bullets.dart';

import '../../../../../core/theme/theme_data/theme_data.dart';

class ConnectInstructions extends StatelessWidget {
  const ConnectInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 50.h, 0, 11.h),
          child: Text(
            'If device is not listed',
            style: TextStyle(
                fontSize: 16.sp,
                color: AppTheme.textPrimary(context),
                fontFamily: AppFontFamily.bold),
          ),
        ),
        const BulletPointText(text: "Check the phone Bluetooth is on."),
        const BulletPointText(text: "Ensure the AimSync device is on."),
        const BulletPointText(text: "Restart the AimSync device."),
        const BulletPointText(text: "If issue is not fixed contact at"),
        ModifiedContainer(
          padding: EdgeInsets.fromLTRB(15.w, 0, 0, 40.h),
          onTap: () {
            toast(null);
          },
          child: Text(
            'support@pulseaim.com',
            style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 14.sp,
                fontFamily: AppFontFamily.regular),
          ),
        )
      ],
    );
  }
}
