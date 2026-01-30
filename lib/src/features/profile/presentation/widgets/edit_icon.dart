import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';

class EditIcon extends StatelessWidget {
  const EditIcon({this.onTap, super.key});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ModifiedContainer(
      onTap: onTap,
      color: AppColors.kPrimaryColor, //Theme.of(context).primaryColor,
      width: 15,
      height: 15,
      borderRadius: 100,
      child: Icon(Icons.edit, color: AppColors.white, size: 12),
    );
  }
}
