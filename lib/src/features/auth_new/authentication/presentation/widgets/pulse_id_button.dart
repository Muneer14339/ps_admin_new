// lib/src/features/auth_new/authentication/presentation/widgets/pulse_id_button.dart
import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/theme_data/theme_data.dart';

class PulseIdButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PulseIdButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppTheme.buttonHeight + 12,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.primary(context),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.access_time_rounded,
                color: AppTheme.surface(context),
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue with Pulse ID',
                    style: AppTheme.titleMedium(context),
                  ),
                  Text(
                    'One account for all Pulse apps',
                    style: AppTheme.labelSmall(context),
                  ),
                ],
              ),
            ),
            Text(
              'SSO',
              style: AppTheme.labelMedium(context).copyWith(
                color: AppTheme.textSecondary(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}