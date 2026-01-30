import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

class SettingsLabelWidget extends StatelessWidget {
  const SettingsLabelWidget({required this.label, super.key});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: AppFontFamily.bold,
        ),
      ),
    );
  }
}
