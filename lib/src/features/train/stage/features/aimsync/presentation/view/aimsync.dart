import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/stage/features/aimsync/presentation/component/aimsync_tile.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import '../../../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../../../core/widgets/border_button.dart';
import '../../../../../../../core/widgets/dropdown_custom.dart';
import '../../../../../../../core/widgets/primary_button.dart';
import '../../../../../../training_new/presentation/bloc/training_bloc.dart';
import '../../../../../../training_new/presentation/bloc/training_event.dart';
import '../../../../../../training_new/presentation/widgets/components/choose_wifi_ble.dart';
import '../../../../../connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../../../connectivity/presentation/view/bluetooth_view.dart';
import '../../../single_line_stages/data/local/service/singleline_db_helper.dart';

int selectedIndexNew = 2;

class AimsyncPage extends StatefulWidget {
  const AimsyncPage({required this.stageEntity, super.key});

  final StageEntity stageEntity;

  @override
  State<AimsyncPage> createState() => _AimsyncPageState();
}

class _AimsyncPageState extends State<AimsyncPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.background(context),
      // appBar: appBarCustom(ctx: context, title: 'AimSync Sensitivity'),
      body: BlocBuilder<StageBloc, StageState>(
        builder: (context, state) {
          return Padding(
            padding: hPadding,
            child: ListView(
              children: [
                const Gap(16),
                const BackButtonWithTitle(title: 'AimSync Sensitivity'),
                const Gap(16),
                AudioAlertsSelector(),
                ModifiedContainer(
                  borderColor: AppTheme.primary(context),
                  borderRadius: 12,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      AimsyncTile(
                        text: 'PFI',
                        initialValue: pfi ?? 1,
                        callBack: (p0) {
                          pfi = p0;
                        },
                        limit: 14,
                      ),
                      AimsyncTile(
                          limit: 6,
                          text: 'PPF',
                          initialValue: ppf ?? 1,
                          callBack: (p0) {
                            ppf = p0;
                          }),
                      AimsyncTile(
                          limit: 6,
                          text: 'PWD',
                          initialValue: pwd ?? 1,
                          callBack: (p0) {
                            pwd = p0;
                          }),
                      AimsyncTile(
                          limit: 6,
                          text: 'SPI',
                          initialValue: spi ?? 1,
                          callBack: (p0) {
                            spi = p0;
                          }),
                    ],
                  ),
                ),
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: BorderButton(
                        color: AppTheme.primary(context),
                        title: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Expanded(
                      child: BorderButton(
                        fill: true,
                        fillColor: AppTheme.primary(context),
                        title: 'Save',
                        onTap: () async {
                          if (pfi != null &&
                              ppf != null &&
                              pwd != null &&
                              spi != null) {
                            await SingleLineStagesHelper().updateAimSyncinStage(
                                locator<LocalStorageService>().userIdString,
                                '$pfi/$ppf/$pwd/$spi');
                            widget.stageEntity.sensitivity =
                                '$pfi/$ppf/$pwd/$spi';
                            appBleDeviceBloc
                                .add(SendCommand(pfi!, ppf!, pwd!, spi!));
                            if (context.mounted) {
                              context.read<StageBloc>().add(StageUpdateEvent(
                                  stageEntity: widget.stageEntity));

                              Navigator.pop(context);
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
                const Gap(35),
              ],
            ),
          );
        },
      ),
    );
  }

  int? pfi, ppf, pwd, spi;

  @override
  void initState() {
    pfi = int.parse(widget.stageEntity.sensitivity?.split('/')[0] ?? '0');
    ppf = int.parse(widget.stageEntity.sensitivity?.split('/')[1] ?? '0');
    pwd = int.parse(widget.stageEntity.sensitivity?.split('/')[2] ?? '0');
    spi = int.parse(widget.stageEntity.sensitivity?.split('/')[3] ?? '0');
    super.initState();
  }
}

class AudioAlertsSelector extends StatefulWidget {
  const AudioAlertsSelector({super.key});

  @override
  State<AudioAlertsSelector> createState() => _AudioAlertsSelectorState();
}

class _AudioAlertsSelectorState extends State<AudioAlertsSelector> {
  final List<String> options = ['Light', 'Medium', 'High', 'Ultra High'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AimSync Sensitivity',
          style: TextStyle(
            color: AppTheme.textPrimary(context),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 50,
          width: 0.5.sw,
          decoration: BoxDecoration(
              color: AppTheme.background(context).withOpacity(0.2),
              border: Border.all(
                  color: AppTheme.primary(context).withOpacity(0.2), width: 1),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primary(context).withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: Stack(
            children: [
              // Animated background indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.elasticIn,
                left: selectedIndexNew * (0.5.sw / 4),
                top: 0,
                bottom: 0,
                width: 0.5.sw / 4,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.primary(context),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              // Options
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  options.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        int pfi = index == 0
                            ? 2
                            : index == 1
                                ? 3
                                : index == 2
                                    ? 5
                                    : 6;
                        print("$index ==== $selectedIndexNew === $pfi ");
                        await SingleLineStagesHelper().updateAimSyncinStage(
                            locator<LocalStorageService>().userIdString,
                            '$pfi');
                        appBleDeviceBloc.add(SendCommandSingle(pfi));
                        if (mounted) {
                          setState(() {
                            selectedIndexNew = index;
                          });
                        }
                        toast('✅Sensitivity Updated');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          curve: Curves.elasticInOut,
                          duration: const Duration(milliseconds: 300),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedIndexNew == index
                                ? AppTheme.textPrimary(context)
                                : AppTheme.textPrimary(context)
                                    .withOpacity(0.6),
                            fontSize: selectedIndexNew == index ? 16 : 14,
                            fontWeight: selectedIndexNew == index
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                          child: Text(options[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectCandence extends StatefulWidget {
  final int selectedIndexCad;

  const SelectCandence({super.key, required this.selectedIndexCad});

  @override
  State<SelectCandence> createState() => _SelectCandenceState();
}

class _SelectCandenceState extends State<SelectCandence> {
  final List<String> options = ['Open session', 'Cadence'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Session',
          style: TextStyle(
            color: AppTheme.textPrimary(context),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 50,
          width: 0.5.sw,
          decoration: BoxDecoration(
              color: AppTheme.background(context).withOpacity(0.2),
              border: Border.all(
                  color: AppTheme.primary(context).withOpacity(0.2), width: 1),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primary(context).withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: Stack(
            children: [
              // Animated background indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.elasticIn,
                left: widget.selectedIndexCad * (0.5.sw / 2),
                top: 0,
                bottom: 0,
                width: 0.5.sw / 2,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.primary(context),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              // Options
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  options.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        context
                            .read<TrainingBloc>()
                            .add(SelectIsCadOrRegularEvent(index));
                        // if(mounted){
                        //   setState(()  {});}
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: AnimatedDefaultTextStyle(
                          curve: Curves.elasticInOut,
                          duration: const Duration(milliseconds: 300),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: widget.selectedIndexCad == index
                                ? AppTheme.textPrimary(context)
                                : AppTheme.textPrimary(context)
                                    .withOpacity(0.6),
                            fontSize:
                                widget.selectedIndexCad == index ? 16 : 14,
                            fontWeight: widget.selectedIndexCad == index
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                          child: Text(options[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
