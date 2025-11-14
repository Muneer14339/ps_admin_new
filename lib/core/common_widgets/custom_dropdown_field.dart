import 'package:flutter/material.dart';
import 'package:pa_sreens/core/config/app_decorations.dart' show AppDecorations;
import 'package:pa_sreens/core/theme/app_theme.dart';

// Stateless Custom Selectable Field Widget
class CustomSelectableField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const CustomSelectableField({
    Key? key,
    required this.label,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            style:  TextStyle(
              color:AppTheme.textPrimary(context),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color:AppTheme.background(context),
              border: Border.all(color: AppTheme.textPrimary(context)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style:  TextStyle(color: AppTheme.textPrimary(context)),
                ),
                 Icon(
                  Icons.arrow_drop_down_rounded,
                  color: AppTheme.textPrimary(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}