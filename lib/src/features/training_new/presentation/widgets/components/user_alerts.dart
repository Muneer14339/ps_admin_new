import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';
import 'choose_wifi_ble.dart';

class UserAlert extends StatelessWidget {
  static const routeName = '/user-alert';
  const UserAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _UserAlertContent(state: state);
      },
    );
  }
}

class _UserAlertContent extends StatefulWidget {
  final TrainingState state;

  const _UserAlertContent({required this.state});

  @override
  State<_UserAlertContent> createState() => _UserAlertContentState();
}

class _UserAlertContentState extends State<_UserAlertContent> {
  // Separate lists for grouping
  final audioCues = ['Count-in beeps', 'Cadence feedback', 'Hit/Miss alerts'];
  final safetyAlerts = ['Camera occlusion warning', 'BLE disconnect alert'];

  // Local state for switches
  late List<bool> audioEnabled;
  late List<bool> safetyEnabled;

  @override
  void initState() {
    super.initState();
    // Initialize with default values or load from BLoC state
    audioEnabled = List.generate(audioCues.length, (_) => true);
    safetyEnabled = List.generate(safetyAlerts.length, (_) => true);
    
    // You could also load from BLoC state if you store these preferences there
    // audioEnabled = widget.state.audioPreferences ?? List.generate(audioCues.length, (_) => true);
    // safetyEnabled = widget.state.safetyPreferences ?? List.generate(safetyAlerts.length, (_) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background(context),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonWithTitle(title: 'Alert Preferences'),
          const SizedBox(height: 20),

          // --- Audio Cues Section ---
          Text(
            "Audio Cues",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppTheme.textPrimary(context),
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: List.generate(audioCues.length, (i) {
              return SwitchListTile.adaptive(
                activeColor: AppTheme.primary(context),
                title: Text(
                  audioCues[i],
                  style: TextStyle(fontSize: 15, color: AppTheme.textPrimary(context)),
                ),
                contentPadding: EdgeInsets.zero,
                value: audioEnabled[i],
                onChanged: (v) {
                  setState(() {
                    audioEnabled[i] = v;
                  });
                },
              );
            }),
          ),

          const SizedBox(height: 12),

          // --- Safety Alerts Section ---
          Text(
            "Safety Alerts",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppTheme.textPrimary(context),
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: List.generate(safetyAlerts.length, (i) {
              return SwitchListTile.adaptive(
                activeColor: AppTheme.primary(context),
                title: Text(
                  safetyAlerts[i],
                  style: TextStyle(fontSize: 15, color: AppTheme.textPrimary(context)),
                ),
                contentPadding: EdgeInsets.zero,
                value: safetyEnabled[i],
                onChanged: (v) {
                  setState(() {
                    safetyEnabled[i] = v;
                  });
                },
              );
            }),
          ),

          const SizedBox(height: 24),

          // --- Bottom Buttons ---
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary(context),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                _saveSettings(context);
              },
              child: Text(
                "Save Settings",
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold, 
                  color: AppTheme.textPrimary(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveSettings(BuildContext context) {
    // Dispatch event to save settings to BLoC
    context.read<TrainingBloc>().add(SaveAlertPreferencesEvent(
      audioPreferences: audioEnabled,
      safetyPreferences: safetyEnabled,
    ));

    // Navigate back
    Navigator.of(context).pop();

    // Show success feedback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Alert preferences saved'),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
        ),
      );
    });
  }
}