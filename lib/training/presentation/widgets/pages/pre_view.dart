import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/core/common_widgets/custom_dropdown_field.dart'
    show CustomSelectableField;
import 'package:pa_sreens/core/common_widgets/custom_textfield.dart';
import 'package:pa_sreens/core/enum/session_enum.dart';
import 'package:pa_sreens/core/routes/app_routes.dart';
import 'package:pa_sreens/core/theme/app_theme.dart';
import 'package:pa_sreens/training/presentation/widgets/components/range_dialog.dart';
import 'package:pa_sreens/training/presentation/bloc/training_bloc.dart';
import 'package:pa_sreens/training/presentation/bloc/training_event.dart';
import 'package:pa_sreens/training/presentation/bloc/training_state.dart';

import '../../../../core/config/app_decorations.dart';
import '../../../../core/routes/locatore.dart';
import '../../../../core/routes/routes_services.dart';

class SessionPreviewView extends StatelessWidget {
  static const routeName = '/session-preview';
  const SessionPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // You can dispatch a complete step event here if needed
      // context.read<TrainingBloc>().add(CompleteStepEvent(SessionPage.setup));
    });
    
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _SessionPreviewContent(state: state);
      },
    );
  }
}

class _SessionPreviewContent extends StatelessWidget {
  final TrainingState state;

  const _SessionPreviewContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TrainingBloc>();
    final s = state.session;
    final isConnected = state.isWifiConnected || state.isBleConnected;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              "Review your setup and adjust details before starting your session.",
              style: TextStyle(color: AppTheme.textSecondary(context), fontSize: 16),
            ),
            const SizedBox(height: 24),

            // 🟧 SESSION DETAILS
            Container(
              decoration: AppDecorations.containerBox(context: context),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Session Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppTheme.primary(context)
                    ),
                  ),
                  const SizedBox(height: 20),

                  CustomTextField(
                    label: "Session Name",
                    hint: 'Morning Practice',
                    controller: bloc.titleCtrl,
                    onChanged: (v) {
                      // Update session name through BLoC
                      final updatedSession = s.copyWith(sessionName: v);
                      // context.read<TrainingBloc>().add(UpdateSessionEvent(updatedSession));
                    },
                  ),

                  const SizedBox(height: 16),

                  CustomSelectableField(
                    label: "Range Name",
                    value: s.rangeName ?? "Select Range",
                    onTap: () => _showRangeDialog(context),
                  ),

                  if (s.drill?.isOpen == true) ...[
                    // You can add open drill specific fields here
                  ],

                  const SizedBox(height: 16),

                  CustomTextField(
                    label: "Session Notes",
                    hint: 'Session notes',
                    controller: bloc.notesCtrl,
                    onChanged: (v) {
                      // Update session notes through BLoC
                      final updatedSession = s.copyWith(notes: v);
                      // context.read<TrainingBloc>().add(UpdateSessionEvent(updatedSession));
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🟩 CONFIGURATION SUMMARY
            Container(
              decoration: AppDecorations.containerBox(context: context),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Configuration Summary",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppTheme.primary(context)
                    ),
                  ),
                  const SizedBox(height: 16),

                  _previewRow(
                    context: context,
                    label: "Connection",
                    value: isConnected ? "Connected" : "Not Connected",
                  ),
                  _previewRow(
                    context: context,
                    label: "Loadout",
                    value: state.selectedLoadout?.name ?? "Not selected",
                    onTap: () {
                      locator<RoutesService>().navigateTo(AppRoutes.loadoutList);
                    },
                  ),
                  _previewRow(
                    context: context,
                    label: "Drill",
                    value: state.selectedDrill?.name ?? "None",
                    onTap: () {
                      locator<RoutesService>().navigateTo(AppRoutes.drillList);
                    },
                  ),
                  _previewRow(
                    context: context,
                    label: "Range",
                    value: s.rangeName ?? "Not selected",
                    onTap: () => _showRangeDialog(context),
                  ),
                  _previewRow(
                    context: context,
                    label: "Alerts",
                    value: "Configure", // You can add alert state here
                    onTap: () {
                      locator<RoutesService>().navigateTo(AppRoutes.userAlert);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🟦 START BUTTON
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow_rounded, size: 28),
                label: const Text(
                  "Start Session",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary(context),
                  foregroundColor: AppTheme.textPrimary(context),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () => _startSession(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _previewRow({
    required String label,
    required String value,
    VoidCallback? onTap,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppTheme.textSecondary(context)
              ),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary(context)
                  ),
                ),
                if (onTap != null)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: const Icon(Icons.edit, size: 24, color: Colors.orange),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRangeDialog(BuildContext context) async {
    final selectedRange = await showDialog<String>(
      context: context,
      builder: (context) => const RangeDialog(),
    );
    if (selectedRange != null) {
      final updatedSession = state.session.copyWith(rangeName: selectedRange);
      // context.read<TrainingBloc>().add(UpdateSessionEvent(updatedSession));
    }
  }

  void _startSession(BuildContext context) {
    final bloc = context.read<TrainingBloc>();
    final s = state.session;
    final sessionName = bloc.titleCtrl.text;

    // Validation
    if (sessionName.isEmpty || s.rangeName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in the session name and select a range.'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Update session with final values
    final updatedSession = s.copyWith(
      sessionName: sessionName,
      notes: bloc.notesCtrl.text,
    );
    // bloc.add(UpdateSessionEvent(updatedSession));

    // Complete steps and start session
    bloc.add(CompleteStepEvent(SessionPage.preview));
    bloc.add(CompleteStepEvent(SessionPage.active));
    bloc.add(StartSessionEvent());
    
    // Navigate to active session
    bloc.add(NavigateToEvent(SessionPage.active, AppRoutes.activeView));

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Session Started - Good luck!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}