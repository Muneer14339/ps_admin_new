import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';

BoxDecoration generalDecoration() {
  return BoxDecoration(
      color: AppColors.white,
      borderRadius: const BorderRadius.all(Radius.circular(12)));
}

//

BoxDecoration dynamicDecoration(List<BoxShadow>? boxShadow, double? radius,
    Color? color, Color? borderColor) {
  return BoxDecoration(
      boxShadow: boxShadow,
      color: color,
      border: Border.all(color: borderColor ?? AppColors.black),
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)));
}
