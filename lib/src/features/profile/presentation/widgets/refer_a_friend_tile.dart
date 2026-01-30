import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';

class ReferFriendTile extends StatelessWidget {
  const ReferFriendTile(
      {required this.assetIcon, required this.link, super.key});
  final String link, assetIcon;
  @override
  Widget build(BuildContext context) {
    return ModifiedContainer(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: link));
        toast('Link Copied');
        // notification(null, 'Link Copied');
      },
      height: 45,
      color: AppColors.countBaseColor,
      borderRadius: 12,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Gap(12),
          Image.asset(assetIcon),
          const Gap(12),
          Text(link,
              style: TextStyle(
                  fontFamily: AppFontFamily.regular,
                  color: AppColors.greyTextColor)),
        ],
      ),
    );
  }
}
