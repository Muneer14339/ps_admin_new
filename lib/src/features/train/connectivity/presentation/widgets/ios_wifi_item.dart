import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

class IosWifiItem extends StatelessWidget {
  const IosWifiItem({super.key, required this.ssid});
  final String ssid;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48.h,
          width: 48.w,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 9.w),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.greyTextColor),
          child: Image.asset('assets/icons/wifi_list.png'),
        ),
        SizedBox(width: 14.w),
        Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ssid,
                style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontFamily: AppFontFamily.regular,
                    fontSize: 14.sp),
              ),
              Text(
                'Connected',
                style: TextStyle(
                    color: AppColors.greyTextColor,
                    fontFamily: AppFontFamily.regular,
                    fontSize: 12.sp),
              )
            ]),
        const Spacer(),
        // isConnected
        //     ? const Icon(Icons.check_circle,
        //         color: Colors.green)
        //     : const SizedBox(),
        const Icon(Icons.check_circle, color: Colors.green)
      ],
    );
  }
}
