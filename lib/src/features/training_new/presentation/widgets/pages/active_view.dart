import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';

class SessionActiveView extends StatefulWidget {
  static const route = '/session-active';
  const SessionActiveView({super.key});

  @override
  State<SessionActiveView> createState() => _SessionActiveViewState();
}

class _SessionActiveViewState extends State<SessionActiveView> {
  @override
  void initState() {
    super.initState();
    // Timer is now managed by BLoC, no need to start it here
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _SessionActiveContent(state: state);
      },
    );
  }
}

class _SessionActiveContent extends StatefulWidget {
  final TrainingState state;

  const _SessionActiveContent({required this.state});

  @override
  State<_SessionActiveContent> createState() => _SessionActiveContentState();
}

class _SessionActiveContentState extends State<_SessionActiveContent> with SingleTickerProviderStateMixin {
  late AnimationController _recController;

  @override
  void initState() {
    super.initState();
    _recController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _recController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (widget.state.sessionTimer ~/ 60).toString().padLeft(2, '0');
    final secs = (widget.state.sessionTimer % 60).toString().padLeft(2, '0');

    return Container(
      color: AppTheme.background(context),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Active Session",
            style: TextStyle(
              fontSize: 28, 
              fontWeight: FontWeight.bold,
              color: AppTheme.primary(context)
            ),
          ),
          const SizedBox(height: 24),

          // HUD Panel
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 60,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.background(context),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.primary(context), width: 1)
                ),
                child: Stack(
                  children: [
                    // Timer Display
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "$minutes:$secs",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 80,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "LIVE SESSION",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 18,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (widget.state.isRunning)
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  color: Colors.redAccent,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _RecDot(controller: _recController),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "RECORDING",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),

                    // Top Left (Shots)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: _hudCorner(
                        label: "Shots Fired",
                        value: "${widget.state.shotCount}/${20}",
                        context: context,
                      ),
                    ),

                    // Top Right (Session)
                    Positioned(
                      top: 16,
                      right: 16,
                      child: _hudCorner(
                        context: context,
                        label: "Session",
                        value: "Untitled",
                        small: true,
                      ),
                    ),

                    // Bottom Left (Range)
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: _hudCorner(
                        context: context,
                        label: "Range",
                        value: "—",
                        small: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _controlButton(
                icon: Icons.bolt_rounded,
                label: "Record Shot",
                color: Colors.grey.shade400,
                onTap: () => _recordShot(context),
              ),
              const SizedBox(width: 20),
              _controlButton(
                icon: widget.state.isRunning
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                label: widget.state.isRunning ? "Pause" : "Resume",
                color: Colors.grey.shade400,
                onTap: () => _pauseResume(context),
              ),
              const SizedBox(width: 20),
              _controlButton(
                icon: Icons.stop_rounded,
                label: "End Session",
                color: Colors.redAccent,
                onTap: () => _showEndSessionDialog(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // --- UI helpers ---

  Widget _hudCorner({
    required String label,
    required String value,
    bool small = false,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background(context),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.textPrimary(context)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              letterSpacing: 1,
              color: AppTheme.textSecondary(context),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: small ? 16 : 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _controlButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label, 
        style: const TextStyle(
          fontWeight: FontWeight.bold, 
          color: Colors.white
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  // --- Action Methods ---

  void _recordShot(BuildContext context) {
    context.read<TrainingBloc>().add(RecordShotEvent());
  }

  void _pauseResume(BuildContext context) {
    context.read<TrainingBloc>().add(PauseResumeEvent());
  }

  void _showEndSessionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("End Session?"),
        content: const Text("Are you sure you want to stop and save this session?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              _endSession(context);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            child: const Text("Yes, End", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _endSession(BuildContext context) {
    context.read<TrainingBloc>().add(EndSessionEvent());
    
    // Show success message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Session Ended - Data saved to History"),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    });
  }
}

class _RecDot extends StatelessWidget {
  final AnimationController controller;

  const _RecDot({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(
        begin: 1.0,
        end: 0.7,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
      child: Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}