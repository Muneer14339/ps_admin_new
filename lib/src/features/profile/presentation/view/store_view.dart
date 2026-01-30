import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrainBackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'Store'),
        body: Center(
          child: ModifiedContainer(
            color: Theme.of(context).cardColor,
            margin: hPadding,
            padding: const EdgeInsets.all(12),
            borderRadius: 12.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/store_cam.png'),
                Gap(16.h),
                Text(
                  'Visit our store to explore more\nproducts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // color: AppColors.greyTextColor,
                      fontFamily: AppFontFamily.regular),
                ),
                Gap(24.h),
                PrimaryButton(
                  title: 'Explore Store',
                  addBottomMargin: true,
                  style: TextStyle(
                      color: AppColors.borderOutline,
                      fontSize: 16.sp,
                      letterSpacing: 0.6,
                      fontFamily: AppFontFamily.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
