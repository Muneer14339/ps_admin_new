import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pa_sreens/src/features/training_new/presentation/widgets/widgets_new/loadout_card_new.dart';
import '../../../../../core/enum/session_enum.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/locatore.dart';
import '../../../../../core/routes/routes_services.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../armory/domain/entities/armory_ammunition.dart';
import '../../../../armory/domain/entities/armory_firearm.dart';
import '../../../../armory/domain/entities/armory_loadout.dart';
import '../../../../armory/presentation/bloc/armory_bloc.dart';
import '../../../../armory/presentation/bloc/armory_state.dart';
import '../../../../armory/presentation/widgets/common/common_widgets.dart';
import '../../../../armory/presentation/widgets/common/empty_state_widget.dart';
import '../../../../armory/presentation/widgets/common/responsive_grid_widget.dart';
import '../../../../armory/presentation/widgets/item_cards/loadout_item_card.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../../bloc/training_state.dart';
import '../../../data/models/session_model.dart';
import 'choose_wifi_ble.dart';

ArmoryLoadout? loadoutArm;
ArmoryFirearm? armoryFirearmA;
ArmoryAmmunition? armoryAmmunitionA;

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

            BlocConsumer<ArmoryBloc, ArmoryState>(
              listener: (context, state) {
                if (state is ArmoryActionSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: AppTheme.success(context),
                    ),
                  );
                } else if (state is ArmoryError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: AppTheme.error(context),
                    ),
                  );
                }
              },
              builder: (context, state) {
                // if (state is ShowingAddForm && state.tabType == tabType) {
                //   return InlineFormWrapper(
                //     title: formTitle,
                //     badge: formBadge,
                //     onCancel: () {
                //       context.read<ArmoryBloc>().add(const HideFormEvent());
                //     },
                //     child: formBuilder(userId),
                //   );
                // }

                return Expanded(child: _buildLoadoutsList(state, context, selected));
              },
            )

            // Expanded(
            //   child: ListView.builder(
            //     padding: EdgeInsets.zero,
            //     itemCount: loadouts.length,
            //     itemBuilder: (context, index) {
            //       final loadout = loadouts[index];
            //       final isSelected = selected?.name == loadout.name;
            //
            //       return GestureDetector(
            //         onTap: () => _selectLoadout(context, loadout),
            //         child: AnimatedContainer(
            //           duration: const Duration(milliseconds: 250),
            //           curve: Curves.easeInOut,
            //           margin: const EdgeInsets.symmetric(vertical: 8),
            //           padding: const EdgeInsets.all(15),
            //           decoration: BoxDecoration(
            //             color: isSelected
            //                 ? AppTheme.primary(context).withOpacity(0.2)
            //                 : AppTheme.background(context),
            //             borderRadius: BorderRadius.circular(10),
            //             border: Border.all(
            //               color: isSelected
            //                   ? AppTheme.primary(context)
            //                   : AppTheme.primary(context).withOpacity(0.2),
            //             ),
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.black.withOpacity(0.05),
            //                 blurRadius: 6,
            //                 offset: const Offset(0, 2),
            //               ),
            //             ],
            //           ),
            //           child: Row(
            //             children: [
            //               // Icon
            //               Container(
            //                 width: 46,
            //                 height: 46,
            //                 decoration: BoxDecoration(
            //                   color: AppTheme.primary(context).withOpacity(0.15),
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //                 child: Icon(
            //                   Icons.inventory_2_outlined,
            //                   color: AppTheme.primary(context),
            //                   size: 26,
            //                 ),
            //               ),
            //               const SizedBox(width: 16),
            //
            //               // Loadout details
            //               Expanded(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       loadout.name,
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 17,
            //                         color: AppTheme.textPrimary(context),
            //                       ),
            //                     ),
            //                     const SizedBox(height: 6),
            //                     Text(
            //                       loadout.details,
            //                       style: TextStyle(
            //                         color: AppTheme.textSecondary(context),
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //
            //               isSelected
            //                   ? Icon(
            //                       Icons.check_circle_outline,
            //                       color: AppTheme.primary(context),
            //                     )
            //                   : const SizedBox.shrink(),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadoutsList(
    ArmoryState state,
    BuildContext context,
    LoadoutModel? selected,
  ) {
    if (state is ArmoryLoading) {
      return CommonWidgets.buildLoading(message: 'Loading loadouts...');
    }

    if (state is ArmoryDataLoaded) {
      if (state.loadouts.isEmpty) {
        return const EmptyStateWidget(
          message: 'No loadouts yet.',
          icon: Icons.add_circle_outline,
        );
      }

      final firearmsMap = <String, ArmoryFirearm>{
        for (var f in state.firearms)
          if (f.id != null) f.id!: f
      };
      final ammunitionMap = <String, ArmoryAmmunition>{
        for (var a in state.ammunition)
          if (a.id != null) a.id!: a
      };
      final cards = state.loadouts.map((loadout) {
        final firearm =
            loadout.firearmId != null ? firearmsMap[loadout.firearmId] : null;
        final ammunition = loadout.ammunitionId != null
            ? ammunitionMap[loadout.ammunitionId]
            : null;

        final isSelected = selected?.name == loadout.name;

        // return GestureDetector(
        //   onTap: () {
        //
        //     loadoutArm = loadout;
        //     armoryFirearmA = firearm;
        //     armoryAmmunitionA = ammunition;
        //     _selectLoadout(
        //         context,
        //         LoadoutModel(
        //             name: loadout.name, details: loadout.notes ?? 'detail'));
        //   },
        //   child: AnimatedContainer(
        //     duration: const Duration(milliseconds: 250),
        //     curve: Curves.easeInOut,
        //     margin: const EdgeInsets.symmetric(vertical: 8),
        //     padding: const EdgeInsets.all(15),
        //     decoration: BoxDecoration(
        //       color: isSelected
        //           ? AppTheme.primary(context).withOpacity(0.2)
        //           : AppTheme.background(context),
        //       borderRadius: BorderRadius.circular(10),
        //       border: Border.all(
        //         color: isSelected
        //             ? AppTheme.primary(context)
        //             : AppTheme.primary(context).withOpacity(0.2),
        //       ),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.05),
        //           blurRadius: 6,
        //           offset: const Offset(0, 2),
        //         ),
        //       ],
        //     ),
        //     child: Row(
        //       children: [
        //         // Icon
        //         Container(
        //           width: 46,
        //           height: 46,
        //           decoration: BoxDecoration(
        //             color: AppTheme.primary(context).withOpacity(0.15),
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: Icon(
        //             Icons.inventory_2_outlined,
        //             color: AppTheme.primary(context),
        //             size: 26,
        //           ),
        //         ),
        //         const SizedBox(width: 16),
        //
        //         // Loadout details
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 loadout.name,
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 17,
        //                   color: AppTheme.textPrimary(context),
        //                 ),
        //               ),
        //               const SizedBox(height: 6),
        //               Text(
        //                 firearm?.nickname ?? "",
        //                 style: TextStyle(
        //                   color: AppTheme.textSecondary(context),
        //                   fontSize: 14,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //
        //         isSelected
        //             ? Icon(
        //                 Icons.check_circle_outline,
        //                 color: AppTheme.primary(context),
        //               )
        //             : const SizedBox.shrink(),
        //       ],
        //     ),
        //   ),
        // );

        // final cards = state.loadouts.map((loadout) {
        //   final firearm = loadout.firearmId != null ? firearmsMap[loadout.firearmId] : null;
        //   final ammunition = loadout.ammunitionId != null ? ammunitionMap[loadout.ammunitionId] : null;

          return LoadoutItemCardTraining(
            loadout: loadout,
            firearm: firearm,
            ammunition: ammunition,
            userId:  locator<LocalStorageService>().userId!,
              isSelected:isSelected
          );


      }).toList();
      return ListView(
        children: [
          ResponsiveGridWidget(children: cards),
        ],
      );

      // return Expanded(
      //   child: ListView(children: cards),
      // );
    }

    if (state is ArmoryError) {
      return CommonWidgets.buildError(state.message);
    }

    return const EmptyStateWidget(
      message: 'No loadouts yet.',
      icon: Icons.add_circle_outline,
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
