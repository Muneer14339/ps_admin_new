import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

class LanguageRegionTile extends StatelessWidget {
  const LanguageRegionTile(
      {required this.groupValue,
      required this.onChanged,
      required this.value,
      super.key});
  final String groupValue, value;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8.h),
      child: Row(
        children: [
          Radio<String>(
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            groupValue: groupValue,
            value: value,
            onChanged: onChanged,
          ),
          const Gap(16),
          Text(
            value,
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontFamily: AppFontFamily.regular,
                fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
