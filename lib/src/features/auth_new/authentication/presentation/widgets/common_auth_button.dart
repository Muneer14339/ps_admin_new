// lib/src/features/auth_new/authentication/presentation/widgets/common_auth_button.dart
import 'package:flutter/material.dart';

class CommonAuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CommonAuthButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}