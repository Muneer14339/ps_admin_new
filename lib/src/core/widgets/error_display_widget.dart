import 'package:flutter/material.dart';
import '../theme/theme_data/theme_data.dart';

/// Displays error messages with icon and retry option
class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData? icon;
  final bool isNetworkError;

  const ErrorDisplayWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.icon,
    this.isNetworkError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon ?? (isNetworkError ? Icons.wifi_off : Icons.error_outline),
                color: Colors.red,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isNetworkError ? 'No Internet Connection' : 'Error',
                      style: AppTheme.labelLarge(context).copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: AppTheme.bodySmall(context).copyWith(
                        color: Colors.red.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Retry'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: BorderSide(color: Colors.red.withValues(alpha: 0.5)),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Inline error message (smaller, for form fields)
class InlineErrorWidget extends StatelessWidget {
  final String message;
  final bool isNetworkError;

  const InlineErrorWidget({
    super.key,
    required this.message,
    this.isNetworkError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            isNetworkError ? Icons.wifi_off : Icons.error_outline,
            color: Colors.red,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: AppTheme.bodySmall(context).copyWith(
                color: Colors.red.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
