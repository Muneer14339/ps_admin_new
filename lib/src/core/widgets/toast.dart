import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:toastification/toastification.dart';

class Toast {
  static show(BuildContext context, // String title,
      {String? message,
      Widget? icon}) {
    FocusScope.of(context).unfocus();
    toastification.show(
        backgroundColor: AppColors.kPrimaryColor,
        context: context,
        // title: Text(title),
        closeButtonShowType: CloseButtonShowType.none,
        description: Text(message ?? 'Something went wrong',
            style: TextStyle(color: AppColors.white)),
        alignment: Alignment.topCenter,
        progressBarTheme: ProgressIndicatorThemeData(color: AppColors.white),
        autoCloseDuration: const Duration(seconds: 2),
        icon: icon ?? Icon(Icons.info, color: AppColors.white));
  }
}
