import 'package:flutter/material.dart';
import 'package:pa_sreens/core/config/app_decorations.dart' show AppDecorations;

import '../theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.onChanged,
  });

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
        TextField(
          style:  TextStyle(color: AppTheme.textPrimary(context)),
          controller: controller,
          maxLines: maxLines,
          decoration: AppDecorations.inputDecoration(
            context: context,
            hint: hint.isNotEmpty ? "e.g., $hint" : "",
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
