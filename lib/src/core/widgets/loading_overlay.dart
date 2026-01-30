import 'package:flutter/material.dart';

/// A widget that shows a linear progress indicator at the top when loading
/// and optionally disables user interaction
class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final bool disableInteraction;
  final Color? progressColor;
  final Color? backgroundColor;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.disableInteraction = true,
    this.progressColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content
        AbsorbPointer(
          absorbing: isLoading && disableInteraction,
          child: child,
        ),

        // Loading indicator at top
        if (isLoading)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              backgroundColor: backgroundColor,
              valueColor: progressColor != null
                  ? AlwaysStoppedAnimation<Color>(progressColor!)
                  : null,
            ),
          ),

        // Optional: Semi-transparent overlay
        if (isLoading && disableInteraction)
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.1),
            ),
          ),
      ],
    );
  }
}
