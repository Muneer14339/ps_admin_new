import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/core/theme/app_theme.dart';
import 'package:pa_sreens/training/presentation/widgets/components/add_button.dart';
import 'package:pa_sreens/training/presentation/widgets/add_forms/add_drill_form.dart';
import 'package:pa_sreens/training/presentation/widgets/components/choose_wifi_ble.dart';
import 'package:pa_sreens/training/presentation/bloc/training_bloc.dart';
import 'package:pa_sreens/training/presentation/bloc/training_event.dart';
import 'package:pa_sreens/training/presentation/bloc/training_state.dart';

import '../../../data/models/session_model.dart';

class DrillList extends StatelessWidget {
  static const String routeName = '/drillList';
  const DrillList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _DrillListContent(state: state);
      },
    );
  }
}

class _DrillListContent extends StatelessWidget {
  final TrainingState state;

  const _DrillListContent({required this.state});

  @override
  Widget build(BuildContext context) {
    // Use dummy list directly in this widget
    final drills = [
      DrillModel(
        name: 'Basic Accuracy',
        details: 'Single target • 5 rounds • 10m',
      ),
      DrillModel(
        name: 'Speed Reload',
        details: 'Transition drill • 3 mags • 7m',
      ),
      DrillModel(
        name: 'Movement & Fire',
        details: 'Walk & shoot • 3 targets • 12m',
      ),
      DrillModel(
        name: 'Open Practice',
        details: 'No restrictions • freestyle training',
        isOpen: true,
      ),
    ];

    final selected = state.selectedDrill;

    return Scaffold(
      backgroundColor: AppTheme.background(context),
      floatingActionButton: AddButton(
        onPressed: () {
          // Show add drill form
          _showAddDrillForm(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButtonWithTitle(title: 'Choose Drill'),
            const SizedBox(height: 20),

            Text(
              "Select a drill type to begin your training session",
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.textSecondary(context),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: drills.length,
                itemBuilder: (context, index) {
                  final drill = drills[index];
                  final isSelected = selected?.name == drill.name;

                  return GestureDetector(
                    onTap: () => _selectDrill(context, drill),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppTheme.primary(context).withOpacity(0.2)
                            : AppTheme.background(context),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? AppTheme.primary(context)
                              : AppTheme.primary(context).withOpacity(0.2),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Drill icon
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: AppTheme.primary(context).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.sports_martial_arts,
                              color: AppTheme.primary(context),
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Drill info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  drill.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: AppTheme.textPrimary(context),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  drill.details,
                                  style: TextStyle(
                                    color: AppTheme.textSecondary(context),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Selection icon
                          isSelected
                              ? Icon(
                                  Icons.check_circle_outline,
                                  color: AppTheme.primary(context),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDrill(BuildContext context, DrillModel drill) {
    // Dispatch event to BLoC
    context.read<TrainingBloc>().add(SelectDrillEvent(drill));
    
    // // Optional: Navigate back after selection
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (Navigator.of(context).canPop()) {
    //     Navigator.of(context).pop();
    //   }
    // });
  }

  void _showAddDrillForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppTheme.background(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child:  AddDrillForm(),
      ),
    );
  }
}