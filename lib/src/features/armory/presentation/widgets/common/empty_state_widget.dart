// lib/user_dashboard/presentation/widgets/empty_state_widget.dart
import 'package:flutter/material.dart';

import '../../../../../core/theme/theme_data/theme_data.dart';
import 'armory_constants.dart';

// ===== empty_state_widget.dart =====
class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData? icon;
  final VoidCallback? onTap;

  const EmptyStateWidget({
    super.key,
    required this.message,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(ArmoryConstants.cardBorderRadius),
      child: Padding(
        padding: ArmoryConstants.cardPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: AppTheme.textSecondary(context),
                size: ArmoryConstants.largeIcon,
              ),
              const SizedBox(height: ArmoryConstants.itemSpacing),
            ],
            Text(
              message,
              style: AppTheme.bodySmall(context),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}