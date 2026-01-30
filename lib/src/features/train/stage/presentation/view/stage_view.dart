import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/utils/constants.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/orange_button.dart';
import 'package:pa_sreens/src/core/widgets/pa_dropdown.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import 'package:pa_sreens/src/features/train/stage/features/aimsync/presentation/view/aimsync.dart';
import 'package:pa_sreens/src/features/train/stage/features/distance/presentation/view/distance_view.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/presentation/view/select_drill_view.dart';
import 'package:pa_sreens/src/features/train/stage/features/firearm/presentation/view/select_firearm.dart';
import 'package:pa_sreens/src/features/train/stage/features/mode/presentation/view/mode_view.dart';
import 'package:pa_sreens/src/features/train/stage/features/single_line_stages/data/local/service/singleline_db_helper.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/component/stage_parts.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import '../../../connectivity/presentation/view/bluetooth_view.dart';
import '../../features/drill/presentation/view/new_drill.dart';

class StageView extends StatefulWidget {
  const StageView({super.key});
  @override
  State<StageView> createState() => _StageViewState();
}

class _StageViewState extends State<StageView> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrainBackgroundPainter(context),
      child: Scaffold(
          // backgroundColor: AppColors.white,
          appBar: appBarCustom(ctx: context, title: 'Stage'),
          body: BlocBuilder<StageBloc, StageState>(
            builder: (context, state) {
              if (state is StageUpdatedState) {
                return stageList(state.stageEntity);
              } else {
                return stageList(initialStageEntity);
              }
            },
          )),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  bool bleConnected = false;
  Widget stageList(StageEntity stageEntity) {
    return BlocBuilder<AppBleDeviceBloc, AppBleDeviceState>(
        builder: (context, state) {
          bleConnected =  appBleDeviceBloc.deviceConn!=null ? appBleDeviceBloc.deviceConn!.isConnected:false;
      // if (state is Connected || state is ServicesDiscovered) {
      //   bleConnected = true;
      // } else if (state is DeviceIsDisconnected) {
      //   bleConnected = false;
      // }
      return ListView(
        children: [
          StageSection(
            iconWidget: Image.asset('assets/icons/drill.png', height: 24.h),
            title: 'Drill',
            selectionText: stageEntity.drill?.drill?.name ?? '',
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SelectDrillView(stageEntity: stageEntity))).then(
              (value) {
                context
                    .read<StageBloc>()
                    .add(StageUpdateEvent(stageEntity: stageEntity));
              },
            ),
          ),
          StageSection(
            iconWidget: Image.asset('assets/icons/per_time.png', height: 24.h),
            title: 'Par Time',
            selectionText: stageEntity.drill?.drill?.name ?? '',
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CreateDrillScreen(stageEntity: stageEntity))),
          ),
          StageSection(
              iconWidget: Image.asset('assets/icons/mode.png', height: 24.h),
              title: 'Mode',
              selectionText:
                  '${stageEntity.mode?.name} ${(stageEntity.mode?.name == 'Fixed') ? '${miliSecondsToSecs(stageEntity.mode?.seconds ?? 100)}"' : ''}',
              onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ModeView(stageEntity: stageEntity)))
                      .then((value) {
                    context
                        .read<StageBloc>()
                        .add(StageUpdateEvent(stageEntity: stageEntity));
                  })),
          StageSection(
              iconWidget: Image.asset('assets/icons/firearm.png', height: 24.h),
              title: 'Firearm',
              selectionText:
                  '${stageEntity.firearm?.type}, ${stageEntity.firearm?.brand}',
              onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectFirearmScreen(
                              stageEntity: stageEntity))).then(
                    (value) {
                      context
                          .read<StageBloc>()
                          .add(StageUpdateEvent(stageEntity: stageEntity));
                    },
                  )),
          PaDropdown(
            items: const ['Finger', 'Trigger guard'],
            allowCustomItem: true,
            isStageSection: true,
            stageWidget:
                Image.asset('assets/icons/mountlocation.png', height: 24.h),
            stageTitle: 'Mount Location',
            selectedValue: stageEntity.mountLocation,
            selectItemCall: (val) async {
              await SingleLineStagesHelper().updateMountLocationinStage(
                  locator<LocalStorageService>().userIdString, val);
              stageEntity.mountLocation = val;
              context
                  .read<StageBloc>()
                  .add(StageUpdateEvent(stageEntity: stageEntity));
            },
          ),
          PaDropdown(
            items: const ['Left Hand', 'Right Hand'],
            isStageSection: true,
            stageWidget: Image.asset('assets/icons/dom_hand.png', height: 24.h),
            stageTitle: 'Dominant Hand',
            selectedValue: stageEntity.dominantHand,
            selectItemCall: (val) async {
              await SingleLineStagesHelper().updateDominantHandStage(
                  locator<LocalStorageService>().userIdString, val);
              stageEntity.dominantHand = val;
              context
                  .read<StageBloc>()
                  .add(StageUpdateEvent(stageEntity: stageEntity));
            },
          ),
          StageSection(
              iconWidget:
                  Image.asset('assets/icons/sensitivity.png', height: 24.h),
              title: 'AimSync sensitivity',
              selectionText: stageEntity.sensitivity ?? '',
              onTap: () {
                if (bleConnected) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              AimsyncPage(stageEntity: stageEntity)));
                } else {
                  toast('BLE device is not connected');
                }
              }),
          PaDropdown(
            items: const ['Outdoor', 'Indoor'],
            isStageSection: true,
            stageWidget: Image.asset('assets/icons/venue.png', height: 24.h),
            stageTitle: 'Venue',
            selectedValue: stageEntity.venue,
            selectItemCall: (val) async {
              await SingleLineStagesHelper().updateVanueinStage(
                  locator<LocalStorageService>().userIdString, val);
              stageEntity.venue = val;
              context
                  .read<StageBloc>()
                  .add(StageUpdateEvent(stageEntity: stageEntity));
            },
          ),
          StageSection(
              iconWidget:
                  Image.asset('assets/icons/distance.png', height: 24.h),
              title: 'Distance',
              selectionText: stageEntity.distance ?? '',
              onTap: () {
                // context
                //     .read<StageBloc>()
                //     .add(StageUpdateEvent(stageEntity: stageEntity));

                //
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DistanceView(
                              stageEntity: stageEntity,
                            ))).then((value) {
                  if (mounted) {
                    log('comes here too');
                    Future.delayed(const Duration(milliseconds: 500), () {
                      if (mounted) {
                        context
                            .read<StageBloc>()
                            .add(StageUpdateEvent(stageEntity: stageEntity));
                      }
                    });
                  }
                });
              }),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 25.h, 0, 15.h),
            child: OrangeButton(
                text: 'Done',
                onTap: () {
                  Navigator.pop(context);
                }),
          )
        ],
      );
    });
  }
}
