import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/background_paint.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';

class SupportFeedback extends StatelessWidget {
  const SupportFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'Support & Feedback'),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            const Gap(35),
            ModifiedContainer(
              padding: const EdgeInsets.all(14),
              borderRadius: 12,
              color: Theme.of(context).cardColor, //AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome to PF Family',
                      style: TextStyle(
                          fontFamily: AppFontFamily.bold, fontSize: 20.sp)),
                  const Gap(12),
                  Text(
                      'PulseAim Scoring System Group is a synchronization with PulseZR community subgroup using API?. Chat from here will be synched to ZR site\n\nWelcome to the PulseAim Scoring Kraft System (PASK), a proud member of the Pulse Frontier family of advanced training tools. PASK is specifically designed to enhance your shooting accuracy, providing precise, real-time feedback to help you perfect your aim.',
                      style: TextStyle(fontFamily: AppFontFamily.regular)),
                  const Gap(16),
                  Text('Pulse Frontier Training Tools',
                      style: TextStyle(
                          fontFamily: AppFontFamily.bold, fontSize: 20.sp)),
                  const Gap(12),
                  Text(
                      'While PASK focuses on accuracy, our ShotPulse system is dedicated to improving shooting speed. Together, these systems provide a comprehensive approach to shooting training, catering to all your needs from precision to rapid response.',
                      style: TextStyle(fontFamily: AppFontFamily.regular)),
                  const Gap(16),
                  Text('PulseZR Platform',
                      style: TextStyle(
                          fontFamily: AppFontFamily.bold, fontSize: 20.sp)),
                  const Gap(12),
                  Text(
                      'PulseZR is the central hub for our innovative training tools, offering a seamless integration of technology and community. It provides a platform for enthusiasts and professionals to connect, share experiences, and access cutting-edge tools like PASK and ShotPulse. Explore PulseZR to discover more about our products and join a thriving community dedicated to excellence in shooting sports.',
                      style: TextStyle(fontFamily: AppFontFamily.regular)),
                  Gap(24.h),
                  PrimaryButton(
                    title: 'Contact Us',
                    style: TextStyle(
                        color: AppColors.borderOutline,
                        fontFamily: AppFontFamily.bold,
                        fontSize: 16.sp,
                        letterSpacing: 0.6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
