import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/enum/session_enum.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/locatore.dart';
import '../../../../../core/routes/routes_services.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../train/stage/features/drill/data/model/drills_entity.dart';
import '../../../../train/stage/features/drill/presentation/view/select_drill_view.dart';
import '../../../../train/stage/presentation/stage_bloc/stage_bloc.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';

import '../../../data/models/session_model.dart';
import '../add_forms/add_drill_form.dart';
import 'add_button.dart';
import 'choose_wifi_ble.dart';

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


    final selected = state.selectedDrill;

    return Scaffold(
      backgroundColor: AppTheme.background(context),
      floatingActionButton: AddButton(
        onPressed: () {
          // Show add drill form
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SelectDrillView(stageEntity: initialStageEntity))).then(
                  (value) {
                context
                    .read<StageBloc>()
                    .add(StageUpdateEvent(stageEntity: initialStageEntity));
              });
          // _showAddDrillForm(context);
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
                itemCount: initialDrillsList?.length,
                itemBuilder: (context, index) {
                  final drill = initialDrillsList?[index];
                  final isSelected = initialDrillsList?[0].drill?.name == drill?.drill?.name;

                  return GestureDetector(
                    onTap: () => _selectDrill(context, drill!),
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
                                  drill?.drill?.name??'',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: AppTheme.textPrimary(context),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  drill?.drill?.description??'',
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

  void _selectDrill(BuildContext context, DrillsModel drill) {
    // Dispatch event to BLoC
    // context.read<TrainingBloc>().add(SelectDrillEvent(drill));
    
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