import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/widgets/border_button.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';

class AppSettingsTile extends StatelessWidget {
  const AppSettingsTile(
      {required this.title,
      required this.text,
      this.leadingIcon,
      this.trailing,
      this.onTap,
      super.key});
  final String title, text;
  final String? leadingIcon;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ModifiedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      onTap: onTap,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(8),
          Row(
            children: [
              Image.asset(leadingIcon ?? '',
                  width: 16.h, color: Theme.of(context).iconTheme.color),
              const Gap(8),
              Text(title, style: Theme.of(context).textTheme.titleSmall),
              const Spacer(),
              Text(text, style: Theme.of(context).textTheme.bodySmall
                  // TextStyle(
                  //     fontSize: 12.sp,
                  //     fontFamily: AppFontFamily.regular,
                  //     color: AppColors.greyTextColor),
                  ),
              const Gap(8),
              trailing ?? const SizedBox.shrink()
            ],
          ),
          const Gap(12),
          appDivider(context)
        ],
      ),
    );
  }
}
