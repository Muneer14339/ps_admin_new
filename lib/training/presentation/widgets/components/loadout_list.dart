import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/core/theme/app_theme.dart';
import 'package:pa_sreens/training/presentation/widgets/components/choose_wifi_ble.dart';
import 'package:pa_sreens/training/presentation/bloc/training_bloc.dart';
import 'package:pa_sreens/training/presentation/bloc/training_event.dart';
import 'package:pa_sreens/training/presentation/bloc/training_state.dart';
import '../../../data/models/session_model.dart';

class LoadoutList extends StatelessWidget {
  static const String routeName = '/loadoutList';
  const LoadoutList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingBloc, TrainingState>(
      builder: (context, state) {
        return _LoadoutListContent(state: state);
      },
    );
  }
}

class _LoadoutListContent extends StatelessWidget {
  final TrainingState state;

  const _LoadoutListContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final loadouts = [
      LoadoutModel(
        name: 'Competition Setup',
        details: 'Glock G19 Gen5 • 9mm • Iron Sights',
      ),
      LoadoutModel(
        name: 'Precision .308',
        details: 'Beretta 3032 • .308 • Vortex Razor',
      ),
      LoadoutModel(
        name: 'Training Pistol',
        details: 'Glock G17 • 9mm FMJ • Red Dot',
      ),
    ];

    final selected = state.selectedLoadout;

    return Scaffold(
      backgroundColor: AppTheme.background(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButtonWithTitle(title: 'Choose Loadout'),
            const SizedBox(height: 20),

            Text(
              "Select your weapon setup for this session",
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
                itemCount: loadouts.length,
                itemBuilder: (context, index) {
                  final loadout = loadouts[index];
                  final isSelected = selected?.name == loadout.name;

                  return GestureDetector(
                    onTap: () => _selectLoadout(context, loadout),
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
                          // Icon
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: AppTheme.primary(context).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.inventory_2_outlined,
                              color: AppTheme.primary(context),
                              size: 26,
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Loadout details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  loadout.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: AppTheme.textPrimary(context),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  loadout.details,
                                  style: TextStyle(
                                    color: AppTheme.textSecondary(context),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

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

  void _selectLoadout(BuildContext context, LoadoutModel loadout) {
    // Dispatch event to BLoC
    context.read<TrainingBloc>().add(SelectLoadoutEvent(loadout));
    
    // Optional: Navigate back or show success message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // You can navigate back or show a success message
      // Navigator.of(context).pop();
    });
  }
}

class HeadingText extends StatelessWidget {
  final String? text;
  const HeadingText({super.key, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppTheme.primary(context),
      ),
    );
  }
}