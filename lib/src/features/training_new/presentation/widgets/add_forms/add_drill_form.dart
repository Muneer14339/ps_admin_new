import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/widgets/custom_textfield.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';
import '../components/selection_dialog.dart';

class AddDrillForm extends StatelessWidget {
  AddDrillForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _AddDrillFormContent(state: state);
      },
    );
  }
}

class _AddDrillFormContent extends StatelessWidget {
  final TrainingState state;

  const _AddDrillFormContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TrainingBloc>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Scaffold(
          backgroundColor: AppTheme.background(context),
          body: SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: 'Name *',
                                controller: bloc.nameController,
                                hint: '10-10-10',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomTextField(
                                label: 'Description',
                                controller: bloc.descriptionController,
                                hint: 'short description',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                              child: CustomSelectableField(
                                label: 'Timer Type',
                                value: state.timerType,
                                onTap: () => _showTimerTypeDialog(context),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomTextField(
                                label: 'Par Time (s)',
                                controller: bloc.parTimeController,
                                hint: '3.5',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                label: 'Rounds Planned',
                                controller: bloc.roundsController,
                                hint: '10',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomTextField(
                                label: 'Distance (m)',
                                controller: bloc.distanceController,
                                hint: '7',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: CustomSelectableField(
                                label: 'Start Signal',
                                value: state.startSignal,
                                onTap: () => _showStartSignalDialog(context),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomSelectableField(
                                label: 'Scoring',
                                value: state.scoring,
                                onTap: () => _showScoringDialog(context),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'Reps/Sets',
                          controller: bloc.repsController,
                          hint: '5 sets of 6',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: 'Notes',
                          controller: bloc.notesController,
                          hint: '',
                          maxLines: 5,
                        ),
                        
                        // Error message display
                        if (state.error != null) ...[
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.red.withOpacity(0.3)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.error_outline, color: Colors.red, size: 20),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    state.error!,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildSaveButton(context),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.background(context),
        border: Border(
          bottom: BorderSide(color: AppTheme.border(context)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Create Your Drill',
            style: TextStyle(
              color: AppTheme.textPrimary(context),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close, color: AppTheme.textPrimary(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ElevatedButton(
          onPressed: () => _saveDrill(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary(context),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Save Drill',
            style: TextStyle(
              color: AppTheme.textPrimary(context),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void _saveDrill(BuildContext context) {
    context.read<TrainingBloc>().add(SaveDrillEvent());
    
    // Check if save was successful and close dialog
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentState = context.read<TrainingBloc>().state;
      if (currentState.error == null) {
        Navigator.of(context).pop();
      }
    });
  }

  void _showTimerTypeDialog(BuildContext context) {
    final timerTypes = ['Free', 'Par', 'Shot Timer'];

    showDialog(
      context: context,
      builder: (context) => SelectionDialog<String>(
        title: 'Select Timer Type',
        items: timerTypes,
        titleBuilder: (type) => type,
        icon: Icons.timer,
        initiallySelected: context.read<TrainingBloc>().state.timerType,
        onSelect: (selectedType) {
          context.read<TrainingBloc>().add(SetTimerTypeEvent(selectedType));
        },
      ),
    );
  }

  void _showStartSignalDialog(BuildContext context) {
    final signals = ['Beep', 'Buzzer', 'Voice'];

    showDialog(
      context: context,
      builder: (context) => SelectionDialog<String>(
        title: 'Select Start Signal',
        items: signals,
        titleBuilder: (signal) => signal,
        iconBuilder: (signal) {
          switch (signal) {
            case 'Beep':
              return Icons.notifications_active;
            case 'Buzzer':
              return Icons.alarm;
            case 'Voice':
              return Icons.record_voice_over;
            default:
              return Icons.circle;
          }
        },
        initiallySelected: context.read<TrainingBloc>().state.startSignal,
        onSelect: (selectedSignal) {
          context.read<TrainingBloc>().add(SetStartSignalEvent(selectedSignal));
        },
      ),
    );
  }

  void _showScoringDialog(BuildContext context) {
    final scoringOptions = ['Time-only', 'Points', 'Time + Points'];

    showDialog(
      context: context,
      builder: (context) => SelectionDialog<String>(
        title: 'Select Scoring',
        items: scoringOptions,
        titleBuilder: (score) => score,
        iconBuilder: (score) {
          switch (score) {
            case 'Time-only':
              return Icons.access_time;
            case 'Points':
              return Icons.star;
            case 'Time + Points':
              return Icons.grade;
            default:
              return Icons.circle;
          }
        },
        initiallySelected: context.read<TrainingBloc>().state.scoring,
        onSelect: (selectedScore) {
          context.read<TrainingBloc>().add(SetScoringEvent(selectedScore));
        },
      ),
    );
  }
}