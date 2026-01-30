import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/border_button.dart';
import 'package:pa_sreens/src/features/profile/presentation/widgets/edit_icon.dart';

class DetailPageTile extends StatelessWidget {
  const DetailPageTile(
      {required this.label,
      required this.text,
      this.onTapEdit,
      this.onTap,
      super.key});
  final String label;
  final String text;
  final void Function()? onTapEdit;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? onTapEdit ?? () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(
                      fontSize: 14.sp,
                      // color: AppColors.black,
                      fontFamily: AppFontFamily.regular)
                  // Theme.of(context).textTheme.labelMedium,
                  ),
              const Spacer(),
              Text(
                text,
                style: //Theme.of(context).textTheme.titleSmall
                    TextStyle(
                        fontSize: 12.sp,
                        fontFamily: AppFontFamily.regular,
                        color: AppColors.greyTextColor),
              ),
              if (onTapEdit != null) EditIcon(onTap: onTapEdit)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: appDivider(context),
          ),
        ],
      ),
    );
  }
}
