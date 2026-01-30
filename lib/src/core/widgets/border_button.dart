import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'modified_container.dart';

class BorderButton extends StatefulWidget {
  const BorderButton(
      {this.width,
      this.height,
      this.onTap,
      this.title,
      this.color,
      this.fillColor,
      this.fill,
      this.borderRadius,
      this.margin,
      this.style,
      super.key});
  final Function()? onTap;
  final String? title;
  final double? width;
  final double? height;
  final Color? color;
  final Color? fillColor;
  final bool? fill;
  final double? borderRadius;
  final EdgeInsets? margin;
  final TextStyle? style;
  @override
  State<BorderButton> createState() => _BorderButtonState();
}

class _BorderButtonState extends State<BorderButton> {
  @override
  Widget build(BuildContext context) {
    return ModifiedContainer(
      onTap: widget.onTap,
      width: widget.width,
      height: widget.height ?? 50,
      padding: const EdgeInsets.all(10),
      margin: widget.margin,
      color: widget.fill == true
          ? widget.fillColor ?? Theme.of(context).primaryColor
          : null,
      borderColor: widget.color ?? AppColors.blackTextColor,
      borderRadius: widget.borderRadius ?? 12,
      child: Center(
        child: Text(
          widget.title ?? 'Signup',
          style: widget.style ??
              TextStyle(
                  color: widget.fill == true
                      ? AppColors.white
                      : widget.color ?? AppColors.blackTextColor,
                  fontFamily: AppFontFamily.bold,
                  fontSize: 14.sp),
        ),
      ),
    );
  }
}

Divider appDivider(BuildContext ctx) {
  return Divider(color: Theme.of(ctx).dividerColor, thickness: 1);
}
