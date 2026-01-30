import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';

class ModePartWidget extends StatelessWidget {
  final String text;
  final Widget rightWidget;
  final VoidCallback onTap;
  final bool isSelected;

  const ModePartWidget({
    super.key,
    required this.text,
    required this.rightWidget,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ModifiedContainer(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      onTap: onTap,
      height: 48.h,
      color: Theme.of(context).cardColor,
      borderRadius: 10,
      borderColor:
          isSelected ? AppColors.kPrimaryColor : AppColors.borderOutline,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text on the left
          Text(
            text,
            style: TextStyle(fontSize: 16.sp, fontFamily: AppFontFamily.bold),
          ),
          // Custom widget on the right
          rightWidget,
        ],
      ),
    );
  }
}
