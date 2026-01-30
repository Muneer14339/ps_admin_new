import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/exit_save_button.dart';
import 'package:pa_sreens/src/core/widgets/pa_dropdown.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/presentation/drills_cubit_state/drills_cubit.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/presentation/view/new_drill.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import '../../../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../training_new/presentation/bloc/training_bloc.dart';
import '../../../../../../training_new/presentation/bloc/training_event.dart';
import '../../../../../../training_new/presentation/widgets/components/choose_wifi_ble.dart';
import '../../data/local/service/drill_db_helper.dart';

class SelectDrillView extends StatefulWidget {
  final StageEntity stageEntity;

  const SelectDrillView({super.key, required this.stageEntity});

  @override
  State<SelectDrillView> createState() => _SelectDrillViewState();
}

class _SelectDrillViewState extends State<SelectDrillView> {
  DrillsModel? selectedDril;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StageBloc, StageState>(
      builder: (context, state) {
        return BlocProvider(
          create: (_) => locator<DrillsCubit>()..getUserDrills(),
          child: BlocConsumer<DrillsCubit, DrillsState>(
            listener: (context, state) {},
            builder: (ctx, stateDrills) {
              if (stateDrills is DrillsLoaded || stateDrills is DrillsError) {
                List<DrillsModel> listDrills = [];
                List<DrillsModel> listAirPFDrills = [];
                if (stateDrills is DrillsLoaded) {
                  listDrills = stateDrills.drillsEntity
                      .where((e) => e.drill?.fireType == 'Live Fire')
                      .toList();
                  listAirPFDrills = stateDrills.drillsEntity
                      .where((e) => e.drill?.fireType == 'Air Powered Fire')
                      .toList();
                }
                return Scaffold(
                  // backgroundColor: AppColors.white,
                  backgroundColor: AppTheme.background(context),

                  // appBar: appBarCustom(ctx: context, title: 'Stage'),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
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
                          child: ListView(
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 12.w),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Create Your own drill',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        color: AppTheme.textPrimary(context),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateDrillScreen(
                                                    stageEntity:
                                                    widget.stageEntity,
                                                  ))),
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.kPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 30.h),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Select Your drill',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color: AppTheme.textPrimary(context),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              PaDropdownGen<DrillsModel>(
                                  initialValue: selectedDril == null &&
                                          widget.stageEntity.drill?.drill
                                                  ?.fireType ==
                                              'Live Fire'
                                      ? widget.stageEntity.drill!
                                      : DrillsModel(),
                                  hint: 'Live Fire',
                                  items: listDrills,
                                  showDelIcon: true,
                                  getLabel: (p0) {
                                    return p0.drill?.name ?? '';
                                  },
                                  onDelTap: (p0) async {
                                    if (stateDrills is DrillsLoaded) {
                                      BotToast.showLoading();
                                      await DrillDbHelper().removeDrill(
                                          p0.id ?? 0,
                                          locator<LocalStorageService>()
                                              .userIdString);
                                      BotToast.closeAllLoading();
                                      if (context.mounted) {
                                        if (widget.stageEntity.drill?.id ==
                                            p0.id) {
                                          selectedDril = DrillsModel();
                                          DrillDbHelper().updateDrillinStage(
                                              locator<LocalStorageService>()
                                                  .userIdString,
                                              widget.stageEntity.drillsList!
                                                  .first
                                                  .toJson());
                                          widget.stageEntity.drill = widget
                                              .stageEntity.drillsList!.first;
                                          context.read<StageBloc>().add(
                                              StageUpdateEvent(
                                                  stageEntity:
                                                      widget.stageEntity));
                                          Navigator.pop(context);
                                        } else {
                                          BlocProvider.of<DrillsCubit>(ctx)
                                              .getUserDrills();
                                          // locator<DrillsCubit>().getUserDrills();
                                        }
                                      }
                                    } else {
                                      toast('Item cannot be deleted');
                                    }
                                  },
                                  selectItemCall: (val) {
                                    selectedDril = val;
                                    context.read<StageBloc>().add(
                                        DrillDropDownChangedEventGen<
                                                DrillsModel>(
                                            id: 1, selectedVal: val));
                                  },
                                  selectedValue:
                                      (state is DrillDropdownChangedStateGen) &&
                                              state.id == 1
                                          ? state.selectedVal
                                          : null),
                              SizedBox(height: 16.h),
                              PaDropdownGen<DrillsModel>(
                                  initialValue: selectedDril == null &&
                                          widget.stageEntity.drill?.drill
                                                  ?.fireType ==
                                              'Air Powered Fire'
                                      ? widget.stageEntity.drill!
                                      : DrillsModel(),
                                  hint: 'Air Powered Fire',
                                  items: listAirPFDrills,
                                  showDelIcon: true,
                                  getLabel: (p0) {
                                    return p0.drill?.name ?? '';
                                  },
                                  onDelTap: (p0) async {
                                    if (stateDrills is DrillsLoaded) {
                                      BotToast.showLoading();
                                      await DrillDbHelper().removeDrill(
                                          p0.id ?? 0,
                                          locator<LocalStorageService>()
                                              .userIdString);
                                      BotToast.closeAllLoading();
                                      if (context.mounted) {
                                        if (widget.stageEntity.drill?.id ==
                                            p0.id) {
                                          DrillDbHelper().updateDrillinStage(
                                              locator<LocalStorageService>()
                                                  .userIdString,
                                              widget.stageEntity.drillsList!
                                                  .last
                                                  .toJson());
                                          widget.stageEntity.drill = widget
                                              .stageEntity.drillsList!.last;
                                          context.read<StageBloc>().add(
                                              StageUpdateEvent(
                                                  stageEntity:
                                                      widget.stageEntity));
                                          Navigator.pop(context);
                                        } else {
                                          BlocProvider.of<DrillsCubit>(ctx)
                                              .getUserDrills();
                                        }
                                      }
                                    } else {
                                      toast('Item cannot be deleted');
                                    }
                                  },
                                  selectItemCall: (val) {
                                    selectedDril = val;
                                    context.read<StageBloc>().add(
                                        DrillDropDownChangedEventGen<
                                                DrillsModel>(
                                            id: 2, selectedVal: val));
                                  },
                                  selectedValue:
                                      (state is DrillDropdownChangedStateGen) &&
                                              state.id == 2
                                          ? state.selectedVal
                                          : null),
                              SizedBox(height: 32.h),
                              Padding(
                                  padding: EdgeInsets.only(left: 12.w),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Select System Drill',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                          color: AppTheme.textPrimary(context),
                                        ),
                                      ))),
                              SizedBox(height: 16.h),
                              PaDropdownGen<DrillsModel>(
                                  hint: 'System Drills',
                                  items: widget.stageEntity.drillsList ?? [],
                                  selectItemCall: (val) {
                                    selectedDril = val;
                                    context.read<StageBloc>().add(
                                        DrillDropDownChangedEventGen<
                                                DrillsModel>(
                                            id: 3, selectedVal: val));
                                  },
                                  getLabel: (p0) {
                                    return p0.drill?.name ?? '';
                                  },
                                  initialValue: selectedDril == null &&
                                          widget.stageEntity.drill?.drill
                                                  ?.fireType ==
                                              'System Drill'
                                      ? widget.stageEntity.drill!
                                      : DrillsModel(),
                                  onDelTap: (p0) {
                                    toast('System drills can\'t be deleted');
                                  },
                                  selectedValue:
                                      (state is DrillDropdownChangedStateGen) &&
                                              state.id == 3
                                          ? state.selectedVal
                                          : null),
                              SizedBox(height: 16.h),
                              ExitSaveButton(
                                firstButton: 'Exit',
                                onTapFirstButton: () =>
                                    Navigator.pop(context),
                                secondButton: 'Save',
                                onTapSecondButton: () {
                                  if (selectedDril == null) {
                                    toast('Select a drill');
                                  } else {
                                    DrillDbHelper().updateDrillinStage(
                                        locator<LocalStorageService>()
                                            .userIdString,
                                        (selectedDril)!.toJson());
                                    widget.stageEntity.drill = (state
                                            is DrillDropdownChangedStateGen)
                                        ? selectedDril
                                        : widget.stageEntity.drill;
                                    context.read<TrainingBloc>().add(SelectDrillEvent(widget.stageEntity.drill??selectedDril!));
                                    // context
                                    //     .read<StageBloc>()
                                    //     .add(StageUpdateEvent(stageEntity: initialStageEntity));
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                              SizedBox(height: 20.h)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Scaffold(
                  backgroundColor: AppTheme.background(context),
                  body:
                      const Center(child: CircularProgressIndicator.adaptive()),
                );
              }
            },
          ),
        );
      },
    );
  }
}
