import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/background_paint.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/core/widgets/search_field.dart';

class FaqsView extends StatelessWidget {
  const FaqsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'In-app FAQs'),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            const Gap(35),
            Text('We’re here to help you',
                style: TextStyle(
                  fontFamily: AppFontFamily.bold,
                  fontSize: 20.sp,
                  // color: AppColors.blackTextColor
                )),
            const Gap(12),
            SearchField(
                prefixIcon: Image.asset('assets/icons/faq_search.png',
                    color: Theme.of(context).iconTheme.color),
                controller: TextEditingController(),
                hintText: 'search here'),
            const Gap(24),
            Text('FAQs',
                style:
                    TextStyle(fontFamily: AppFontFamily.bold, fontSize: 20.sp)),
            const Gap(12),
            ModifiedContainer(
              padding: const EdgeInsets.all(12),
              borderRadius: 12,
              color: Theme.of(context).cardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ModifiedContainer(
                      padding: const EdgeInsets.all(12),
                      borderRadius: 12,
                      color: Theme.of(context).canvasColor,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('What is PulseAim?',
                                  style: TextStyle(
                                    fontFamily: AppFontFamily.regular,
                                    fontSize: 16.sp,
                                    // color: AppColors.greyTextColor
                                  )),
                              Icon(Icons.remove, color: AppColors.greyTextColor)
                            ],
                          ),
                          const Gap(14),
                          Text(
                            'Here will be the answer of the question. ',
                            style: TextStyle(
                                color: AppColors.greyTextColor,
                                fontFamily: AppFontFamily.regular),
                          ),
                        ],
                      )),
                  ...List.generate(
                      4,
                      (index) => ModifiedContainer(
                          padding: const EdgeInsets.all(12),
                          borderRadius: 12,
                          color: Theme.of(context).canvasColor,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('What is PulseAim?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppFontFamily.regular)),
                              const Icon(Icons.add)
                            ],
                          ))),
                  const Gap(40),
                  PrimaryButton(
                    title: 'Ask Question',
                    style: TextStyle(
                        color: AppColors.white,
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
