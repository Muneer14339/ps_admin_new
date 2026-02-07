// lib/src/features/auth_new/authentication/presentation/widgets/common_back_button.dart
import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/theme_data/theme_data.dart';

class CommonBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CommonBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: AppTheme.textPrimary(context)),
        onPressed: onPressed ?? () => Navigator.pop(context),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}