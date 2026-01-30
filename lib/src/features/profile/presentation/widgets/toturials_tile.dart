import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import '../../../../core/widgets/modified_container.dart';

class ToturialsTile extends StatelessWidget {
  const ToturialsTile({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return ModifiedContainer(
        color: Theme.of(context).canvasColor, //AppColors.profileTilesBack,
        padding: const EdgeInsets.all(12),
        borderRadius: 10.w,
        child: Row(
          children: [
            ModifiedContainer(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(12),
              borderRadius: 5.w,
              width: 84.w,
              height: 74.h,
              child:
                  // Image.asset('assets/icons/play3.png',height: 12.h, width: 12.w,fit: BoxFit.scaleDown,)
                  Icon(Icons.play_arrow_rounded,
                      size: 45.h, color: AppColors.kPrimaryColor),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title of the Video',
                      style: TextStyle(
                          fontSize: 18.sp, fontFamily: AppFontFamily.bold)),
                  Text('There will be short brief about the video',
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontSize: 12.sp,
                          fontFamily: AppFontFamily.regular)),
                  const Gap(4),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/time_dur.png',
                        height: 12.h,
                      ),
                      const Gap(4),
                      Text('04:00 mins',
                          style: TextStyle(
                              color: AppColors.greyTextColor,
                              fontSize: 12.sp,
                              fontFamily: AppFontFamily.regular)),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
