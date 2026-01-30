import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/background_paint.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/features/profile/presentation/widgets/toturials_tile.dart';

class ToturialsPage extends StatelessWidget {
  const ToturialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(
          ctx: context,
          title: 'Tutorials',
        ),
        body: Center(
          child: ModifiedContainer(
            color: Theme.of(context).cardColor, //AppColors.white,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: const EdgeInsets.all(14),
            borderRadius: 12.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ToturialsTile(),
                const Gap(16),
                const ToturialsTile(),
                const Gap(16),
                const ToturialsTile(),
                const Gap(16),
                const ToturialsTile(),
                const Gap(33),
                PrimaryButton(
                  title: 'See More',
                  buttonColor: AppColors.kPrimaryColor,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      letterSpacing: 0.6,
                      fontFamily: AppFontFamily.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
