import 'package:flutter/material.dart';

import '../theme/theme_data/theme_data.dart';

class ModifiedContainer extends StatelessWidget {
  const ModifiedContainer(
      {this.color,
      this.borderColor,
      this.borderRadius,
      this.isBorderOnly,
      this.borderSize,
      this.borderRadiusOnly,
      this.width,
      this.height,
      this.padding,
      this.margin,
      this.child,
      this.onTap,
      this.boxShadow,
      this.borderSide,
      super.key});
  final double? borderRadius, borderSize, width, height;
  final Color? color, borderColor;
  final EdgeInsets? padding, margin;
  final Widget? child;
  final bool? isBorderOnly;
  final BorderRadiusGeometry? borderRadiusOnly;
  final void Function()? onTap;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? borderSide;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin??const EdgeInsets.symmetric(vertical: 6),

        decoration: BoxDecoration(
            boxShadow: boxShadow,
            color: color,
            border: borderSide ??
                (borderColor != null
                    ? Border.all(color: borderColor??AppTheme.primary(context).withOpacity(0.2), width: borderSize ?? 1)
                    : null),
            borderRadius: isBorderOnly == true
                ? borderRadiusOnly
                : BorderRadius.all(Radius.circular(borderRadius ?? 12))),
        child: child,
      ),
    );
  }
}


class AppDecorations {
  // 🧱 Base Input Decoration used for all TextFields / Dropdowns
  static InputDecoration inputDecoration({
    String? hint,
    Widget? suffixIcon,
    required BuildContext context,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: AppTheme.background(context),
      suffixIcon: suffixIcon,

      hintStyle:  TextStyle(
        color: AppTheme.textSecondary(context),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(color:AppTheme.textSecondary(context)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(color:AppTheme.textSecondary(context)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(color:AppTheme.textSecondary(context)),
      ),
    );
  }

  // 🟧 Container box decoration (used for summary panels, cards)
  static BoxDecoration containerBox({
    required BuildContext context,
  }) {
    return BoxDecoration(
      color: AppTheme.background(context),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppTheme.primary(context)),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    );
  }  // 🟧 Container box decoration (used for summary panels, cards)
  static BoxDecoration containerBoxNew({
    required BuildContext context,
  }) {
    return BoxDecoration(
      color: AppTheme.background(context),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppTheme.primary(context).withOpacity(0.2)),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    );
  }
}
