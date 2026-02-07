// lib/src/features/auth_new/authentication/presentation/widgets/header_with_back_button.dart
import 'package:flutter/material.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/presentation/widgets/common_back_button.dart';

class HeaderWithBackButton extends StatelessWidget {
  final Widget child;

  const HeaderWithBackButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CommonBackButton(),
        ),
        child,
      ],
    );
  }
}