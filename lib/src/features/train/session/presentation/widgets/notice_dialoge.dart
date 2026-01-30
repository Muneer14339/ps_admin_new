import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

class NoticeDialoge extends StatelessWidget {
  final ValueNotifier<bool> isVisibleNoticeNotifier = ValueNotifier(
    locator<LocalStorageService>().getSessionAlert1Visiblity,
  );

  NoticeDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isVisibleNoticeNotifier,
      builder: (context, isVisible, child) {
        return Visibility(
          visible: isVisible,
          child: Container(
            height: 240.h,
            width: 125.w,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor, //AppColors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Icon(
                        Icons.close,
                        size: 24.h,
                      ),
                      onTap: () {
                        isVisibleNoticeNotifier.value = false;
                        locator<LocalStorageService>()
                            .saveSessionAlert1Visiblity(false);
                      },
                    ),
                  ),
                  Icon(
                    Icons.error_outline_rounded,
                    color: AppColors.kPrimaryColor,
                  ),
                  Text(
                    'Calibration Required Notice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 18.h,
                      fontFamily: AppFontFamily.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      'Your session is not calibrated. Calibration ensures accurate shot tracking and scoring.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontFamily: AppFontFamily.regular,
                        fontSize: 14.h,
                      ),
                    ),
                  ),
                  Text(
                    'Calibrate now by adjusting the FOV (Field of View) and scope clarity knob.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontFamily: AppFontFamily.bold,
                      fontSize: 14.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
