import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pa_sreens/src/core/helper/helper_methods.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/bottom_sheet_.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/orange_button.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/stage/features/mode/data/local/service/mode_db_helper.dart';
import 'package:pa_sreens/src/features/train/stage/features/mode/presentation/component/mode_parts.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';

class ModeView extends StatefulWidget {
  final StageEntity stageEntity;

  const ModeView({super.key, required this.stageEntity});

  @override
  State<ModeView> createState() => _ModeViewState();
}

class _ModeViewState extends State<ModeView> {
  late String mode;
  late int seconds;
  late int id;
  @override
  void initState() {
    super.initState();
    mode = widget.stageEntity.mode?.name ?? '';
    // seconds = widget.stageEntity.mode?.seconds ?? 0;
    seconds = mode == 'Count Down'
        ? widget.stageEntity.mode?.seconds ?? 0
        : miliSecondsToSecs(widget.stageEntity.mode?.seconds ?? 0);

    id = widget.stageEntity.mode?.id ?? 3;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StageBloc, StageState>(
      builder: (context, state) {
        return CustomPaint(
          painter: TrainBackgroundPainter(context),
          child: Scaffold(
              appBar: appBarCustom(ctx: context, title: 'Mode'),
              body: Column(
                children: [
                  ModePartWidget(
                      text: 'Instant',
                      rightWidget: const SizedBox(),
                      isSelected: ((state is SelectModeChangedState &&
                              state.selectedOption == 'Instant') ||
                          mode == 'Instant'),
                      onTap: () {
                        context.read<StageBloc>().add(
                            SelectModeChangedEvent(selectedOption: 'Instant'));
                        mode = 'Instant';
                        seconds = 0;
                        id = 1;
                      }),
                  ModePartWidget(
                      isSelected: ((state is SelectModeChangedState &&
                              state.selectedOption == 'Random') ||
                          mode == 'Random'),
                      text: 'Random',
                      rightWidget: const SizedBox(),
                      onTap: () {
                        context.read<StageBloc>().add(
                            SelectModeChangedEvent(selectedOption: 'Random'));
                        mode = 'Random';
                        seconds = getRandomValue();
                        id = 2;
                      }),
                  ModePartWidget(
                      isSelected: ((state is SelectModeChangedState &&
                              state.selectedOption == 'Fixed') ||
                          mode == 'Fixed'),
                      text: 'Fixed',
                      rightWidget: Row(
                        children: [
                          ((state is SelectModeChangedState &&
                                      state.selectedOption == 'Fixed') ||
                                  mode == 'Fixed')
                              ? Text(
                                  '${seconds}s',
                                  style: TextStyle(
                                      fontFamily: AppFontFamily.regular,
                                      fontSize: 14.sp,
                                      color: AppColors.greyTextColor),
                                )
                              : const Text(''),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18.w,
                          ),
                        ],
                      ),
                      onTap: () async {
                        id = 3;
                        if (mode != 'Fixed') {
                          seconds = 3;
                          mode = 'Fixed';
                        }
                        context.read<StageBloc>().add(
                            SelectModeChangedEvent(selectedOption: 'Fixed'));
                        var secs = await showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => _buildFixedBottomSheet(
                            seconds,
                          ),
                        );
                        if (secs != null && context.mounted) {
                          // seconds = secs.toString();
                          seconds = secs;
                          context.read<StageBloc>().add(
                              SelectModeChangedEvent(selectedOption: 'Fixed'));
                        }
                      }),
                  ModePartWidget(
                      isSelected: ((state is SelectModeChangedState &&
                              state.selectedOption == 'Count Down') ||
                          mode == 'Count Down'),
                      text: 'Count Down',
                      rightWidget: Row(
                        children: [
                          ((state is SelectModeChangedState &&
                                      state.selectedOption == 'Count Down') ||
                                  mode == 'Count Down')
                              ? Text(
                                  getTimeTxt(seconds),
                                  style: TextStyle(
                                      fontFamily: AppFontFamily.regular,
                                      fontSize: 14.sp,
                                      color: AppColors.greyTextColor),
                                )
                              : const Text(''),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18.w,
                          ),
                        ],
                      ),
                      onTap: () async {
                        id = 4;
                        if (mode != 'Count Down') {
                          seconds = 3000;
                          mode = 'Count Down';
                        }
                        context.read<StageBloc>().add(SelectModeChangedEvent(
                            selectedOption: 'Count Down'));
                        int? secs = await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) =>
                              _buildCountdownBottomSheet(seconds),
                        );
                        if (secs != null && context.mounted) {
                          seconds = secs;
                          context.read<StageBloc>().add(SelectModeChangedEvent(
                              selectedOption: 'Count Down'));
                        }
                      }),
                  ModePartWidget(
                      isSelected: ((state is SelectModeChangedState &&
                              state.selectedOption == 'Stop Watch') ||
                          mode == 'Stop Watch'),
                      text: 'Stop Watch',
                      rightWidget: const SizedBox(),
                      onTap: () {
                        id = 5;
                        context.read<StageBloc>().add(SelectModeChangedEvent(
                            selectedOption: 'Stop Watch'));
                        mode = 'Stop Watch';
                        seconds = 0;
                      }),
                  ModePartWidget(
                      isSelected: ((state is SelectModeChangedState &&
                              state.selectedOption == 'RO') ||
                          mode == 'RO'),
                      text: 'RO',
                      rightWidget: const SizedBox(),
                      onTap: () {
                        id = 6;
                        context
                            .read<StageBloc>()
                            .add(SelectModeChangedEvent(selectedOption: 'RO'));
                        mode = 'RO';
                        seconds = 0;
                      }),
                  const Spacer(),
                  OrangeButton(
                      text: 'Save Changes',
                      onTap: () async {
                        widget.stageEntity.mode?.id = id;
                        widget.stageEntity.mode?.name = mode;
                        int inseconds = mode == 'Count Down'
                            ? seconds
                            : secsToMiliSeconds(seconds);
                        Mode modeObj =
                            Mode(id: id, name: mode, seconds: inseconds);
                        widget.stageEntity.mode = modeObj;
                        await ModeDbHelper().updateModeinStage(
                            locator<LocalStorageService>().userIdString,
                            modeObj.toJson());
                        if (context.mounted) {
                          log('in mode stage update event ${widget.stageEntity.mode?.seconds}');
                          context.read<StageBloc>().add(StageUpdateEvent(
                              stageEntity: widget.stageEntity));
                          Navigator.pop(context);
                        }
                      }),
                  SizedBox(height: 76.h),
                ],
              )),
        );
      },
    );
  }

  Widget _buildFixedBottomSheet(int seconds) {
    // int currentSliderValue = int.parse(seconds);
    int currentSliderValue = seconds;
    return AppBottomSheetWidget(
      height: 0.35,
      child: StatefulBuilder(builder: (context, setState) {
        return Column(
          children: [
            SizedBox(height: 36.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('1',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.blackTextColor,
                        fontFamily: AppFontFamily.regular)),
                SizedBox(
                    width: 223.w,
                    child: Slider(
                        activeColor: Theme.of(context).primaryColor,
                        inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                        label: currentSliderValue.round().toString(),
                        value: currentSliderValue.toDouble(),
                        onChangeEnd: (value) {},
                        onChanged: (value) {
                          setState(() {
                            currentSliderValue = value.toInt();
                          });
                        },
                        divisions: 29,
                        min: 1,
                        max: 30)),
                Text('30',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.blackTextColor,
                        fontFamily: AppFontFamily.regular)),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              'Selected Seconds: ${currentSliderValue.toInt()} seconds',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.blackTextColor,
                  fontFamily: AppFontFamily.regular),
            ),
            SizedBox(height: 57.h),
            Padding(
              padding: hPadding,
              child: PrimaryButton(
                  title: 'Save',
                  onTap: () {
                    Navigator.pop(context, currentSliderValue);
                  }),
            )
          ],
        );
      }),
    );
  }

  Widget _buildCountdownBottomSheet(int currentVal) {
    // int secs = int.parse(currentVal);
    int secs = currentVal;
    int extractedSeconds = secs ~/ 100;
    int extractedMilliseconds = secs % 100;

    return StatefulBuilder(builder: (context, setState) {
      return AppBottomSheetWidget(
        height: 0.42,
        child: Column(
          children: [
            SizedBox(
              height: 36.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker(
                  itemWidth: 60.w,
                  value: extractedSeconds,
                  minValue: 0,
                  maxValue: 99,
                  selectedTextStyle: //Theme.of(context).textTheme.titleLarge,
                      TextStyle(
                          color: AppColors.blackTextColor,
                          fontFamily: AppFontFamily.bold,
                          fontSize: 40.sp),
                  textStyle: TextStyle(
                      color: AppColors.greyTextColor,
                      fontFamily: AppFontFamily.bold,
                      fontSize: 40.sp),
                  onChanged: (value) =>
                      setState(() => extractedSeconds = value),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                  child: Text('s',
                      style: TextStyle(
                          color: AppColors.blackTextColor,
                          fontFamily: AppFontFamily.bold,
                          fontSize: 35.sp)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 5.h, 0, 0),
                  child: Text(':',
                      style: TextStyle(
                          color: AppColors.blackTextColor,
                          fontFamily: AppFontFamily.bold,
                          fontSize: 40.sp)),
                ),
                NumberPicker(
                  itemWidth: 60.w,
                  value: extractedMilliseconds,
                  minValue: 0,
                  maxValue: 99,
                  selectedTextStyle: TextStyle(
                      color: AppColors.blackTextColor,
                      fontFamily: AppFontFamily.bold,
                      fontSize: 40.sp),
                  textStyle: TextStyle(
                      color: AppColors.greyTextColor,
                      fontFamily: AppFontFamily.bold,
                      fontSize: 40.sp),
                  onChanged: (value) =>
                      setState(() => extractedMilliseconds = value),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                  child: Text(
                    'ms',
                    style: TextStyle(
                        color: AppColors.blackTextColor,
                        fontFamily: AppFontFamily.bold,
                        fontSize: 35.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h),
            Padding(
              padding: hPadding,
              child: PrimaryButton(
                title: 'Set',
                onTap: () {
                  int combinedValue =
                      extractedSeconds * 100 + extractedMilliseconds;
                  Navigator.pop(context, combinedValue);
                },
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      );
    });
  }

  String getTimeTxt(int secs) {
    // int sec = int.parse(secs);
    // Worked on
    int sec = secs;
    int extractedSeconds = sec ~/ 100;
    int extractedMilliseconds = sec % 100;
    return '${extractedSeconds}s : ${extractedMilliseconds}ms';
  }
}
