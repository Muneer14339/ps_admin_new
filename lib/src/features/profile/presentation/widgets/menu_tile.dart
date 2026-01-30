import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({required this.title, required this.onTap, super.key});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ModifiedContainer(
      onTap: onTap,
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 12.h),
      color: Theme.of(context).canvasColor,
      borderRadius: 12.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: arrowIconSize,
            )
          ],
        ),
      ),
    );
  }
}
