// lib/src/features/auth_new/authentication/presentation/widgets/common_auth_input_field.dart
import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';

import '../../../../../core/theme/theme_data/theme_data.dart';

class CommonAuthInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLength;

  const CommonAuthInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTheme.labelMedium(context)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLength: maxLength,
          style: AppTheme.bodyMedium(context).copyWith(color: AppColors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTheme.labelMedium(context),
            suffixIcon: suffixIcon,
            counterText: maxLength != null ? '' : null,
          ),
          validator: validator,
        ),
      ],
    );
  }
}