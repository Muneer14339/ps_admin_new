import 'package:flutter/material.dart';

import '../theme/app_theme.dart';


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
  }
}
