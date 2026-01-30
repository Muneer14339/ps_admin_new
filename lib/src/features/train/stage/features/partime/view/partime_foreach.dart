import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/border_button.dart';
import 'package:pa_sreens/src/core/widgets/bottom_sheet_.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/exit_save_button.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import '../../drill/data/local/service/drill_db_helper.dart';
import '../../../presentation/view/stage_view.dart';

class ParTimeForEach extends StatefulWidget {
  final StageEntity stageEntity;
  final DrillsModel drillsEntity;
  final int isMute;

  const ParTimeForEach(
      {super.key,
      required this.stageEntity,
      required this.isMute,
      required this.drillsEntity});
  @override
  _ParTimeForEachState createState() => _ParTimeForEachState();
}

class _ParTimeForEachState extends State<ParTimeForEach> {
  late List<int> secondsFirst;
  late List<int> secondsSecond;
  late List<int> millisecondsFirst;
  late List<int> millisecondsSecond;

  @override
  void initState() {
    super.initState();
    // Initialize based on the number of shots
    int noOfShots = int.parse(widget.drillsEntity.drill?.noOfShots ?? '');
    // if (widget.drillsEntity.parTimeList!.length > 1) {
    // Initialize lists based on parTimeList
    secondsFirst = List.filled(noOfShots, 0);
    secondsSecond = List.filled(noOfShots, 0);
    millisecondsFirst = List.filled(noOfShots, 0);
    millisecondsSecond = List.filled(noOfShots, 0);

    // for (int i = 0; i < noOfShots; i++) {
    //   int totalMilliseconds = widget.drillsEntity.parTimeList![i];

    //   // Convert to seconds and milliseconds
    //   int seconds =
    //       totalMilliseconds ~/ 100; // Integer division to get seconds
    //   int milliseconds =
    //       totalMilliseconds % 100; // Remainder for milliseconds

    //   // Break seconds into first and second digits
    //   secondsFirst[i] = seconds ~/ 10; // First digit
    //   secondsSecond[i] = seconds % 10; // Second digit

    //   // Break milliseconds into first and second digits
    //   millisecondsFirst[i] = milliseconds ~/ 10; // First digit
    //   millisecondsSecond[i] = milliseconds % 10; // Second digit
    // }
    // } else {
    // secondsFirst = List.filled(noOfShots, 0);
    // secondsSecond = List.filled(noOfShots, 0);
    // millisecondsFirst = List.filled(noOfShots, 0);
    // millisecondsSecond = List.filled(noOfShots, 0);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrainBackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'par Time'),
        // AppBar(
        //   toolbarHeight: 100.h,
        //   backgroundColor: AppColors.white,
        //   centerTitle: true,
        //   title: Text(
        //     'Par Time',
        //     style: TextStyle(
        //         fontSize: 20.sp,
        //         color: AppColors.blackTextColor,
        //         fontFamily: AppFontFamily.bold),
        //   ),
        //   leading: InkWell(
        //       onTap: () => Navigator.pop(context),
        //       child: const Icon(Icons.arrow_back_ios_new)),
        // ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Par time for each shot',
                style:
                    TextStyle(fontSize: 20.sp, fontFamily: AppFontFamily.bold),
              ),
              SizedBox(height: 24.w),
              Text(
                'Shots:',
                style:
                    TextStyle(fontSize: 18.sp, fontFamily: AppFontFamily.bold),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 128.w,
                  ),
                  Text(
                    'Seconds',
                    style: TextStyle(
                        fontSize: 12.sp, fontFamily: AppFontFamily.regular),
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  Text(
                    'milliseconds',
                    style: TextStyle(
                        fontSize: 12.sp, fontFamily: AppFontFamily.regular),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ..._generateShotPickers(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _clearTimes,
                  child: Text(
                    'Clear',
                    style: TextStyle(
                        color: AppColors.timeClearColor,
                        fontSize: 16.sp,
                        fontFamily: AppFontFamily.bold),
                  ),
                ),
              ),
              // const Spacer(),
              const Gap(20),
              ExitSaveButton(
                firstButton: 'Discard',
                secondButton: 'Save',
                onTapFirstButton: () => Navigator.pop(context),
                onTapSecondButton: () async {
                  int noOfShots =
                      int.parse(widget.drillsEntity.drill?.noOfShots ?? '');
                  List<int> parTimeforeachshot = [];
                  try {
                    // for (int x = 0; x <= noOfShots; x++) {
                    // int seconds = secondsFirst[x] * 10 + secondsSecond[x];
                    // int totalMilliseconds = (seconds * 100) +
                    //     millisecondsFirst[x] * 10 +
                    //     millisecondsSecond[x];
                    // // log('index $x - totalTime $totalMilliseconds');
                    // parTimeforeachshot.add(totalMilliseconds);
                    // }
                    for (int x = 0; x <= noOfShots; x++) {
                      int seconds = secondsFirst[x] * 10 + secondsSecond[x];
                      int centiseconds =
                          millisecondsFirst[x] * 10 + millisecondsSecond[x];
                      int totalMilliseconds =
                          (seconds * 1000) + (centiseconds * 10);

                      log('index $x - totalTime $totalMilliseconds');
                      parTimeforeachshot.add(totalMilliseconds);
                    }
                  } catch (e) {}
                  DrillsEntity drillsEntity = DrillsEntity(
                    description: widget.drillsEntity.drill?.description,
                    fireType: widget.drillsEntity.drill?.fireType,
                    isMute: widget.isMute,
                    name: widget.drillsEntity.drill?.name,
                    noOfShots: widget.drillsEntity.drill?.noOfShots,
                    parTimeList: parTimeforeachshot,
                    partTimeType: 'for-each',
                  );
                  DrillsModel? drillsModel = await DrillDbHelper().addNewDrill(
                      locator<LocalStorageService>().userIdString,
                      drillsEntity);
                  widget.stageEntity.drill = drillsModel;
                  if (context.mounted) {
                    context
                        .read<StageBloc>()
                        .add(StageUpdateEvent(stageEntity: widget.stageEntity));
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == null &&
                          route is MaterialPageRoute &&
                          route.builder(context) is StageView;
                    });
                  }
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _generateShotPickers() {
    return List.generate(int.parse(widget.drillsEntity.drill?.noOfShots ?? ''),
        (index) {
      return _buildShotPicker(index + 1); // shotIndex starts from 1
    });
  }

  Widget _buildShotPicker(int shotIndex) {
    return BlocBuilder<StageBloc, StageState>(
      builder: (context, state) {
        List<int> updatesecondsFirst = state is ForEachShotChangedState
            ? state.secondsFirst
            : secondsFirst;
        List<int> updatesecondsSecond = state is ForEachShotChangedState
            ? state.secondsSecond
            : secondsSecond;
        List<int> updatemillisecondsFirst = state is ForEachShotChangedState
            ? state.millisecondsFirst
            : millisecondsFirst;
        List<int> updatemillisecondsSecond = state is ForEachShotChangedState
            ? state.millisecondsSecond
            : millisecondsSecond;

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 10.h, 0, 10.h),
              child: Row(
                children: [
                  Text('Beep#$shotIndex',
                      style: TextStyle(
                          fontSize: 16.sp, fontFamily: AppFontFamily.bold)),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .cardColor, //AppColors.countBaseColor,
                        borderRadius: BorderRadius.circular(5.h)),
                    child: NumberPicker(
                      selectedTextStyle: TextStyle(
                          // color: Theme.of(context).canvasColor,//AppColors.blackTextColor,
                          fontFamily: AppFontFamily.regular,
                          fontSize: 32.sp),
                      itemWidth: 32.w,
                      itemHeight: 52.h,
                      itemCount: 1,
                      value: updatesecondsFirst[shotIndex - 1],
                      minValue: 0,
                      maxValue: 9,
                      onChanged: (value) {
                        updatesecondsFirst[shotIndex - 1] = value;
                        context.read<StageBloc>().add(ForEachShotChangedEvent(
                            secondsFirst: updatesecondsFirst,
                            secondsSecond: updatesecondsSecond,
                            millisecondsFirst: updatemillisecondsFirst,
                            millisecondsSecond: updatemillisecondsSecond));
                        // setState(() {
                        //   secondsFirst[shotIndex - 1] = value;
                        // });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5.h)),
                    child: NumberPicker(
                      selectedTextStyle: TextStyle(
                          // color: AppColors.blackTextColor,
                          fontFamily: AppFontFamily.regular,
                          fontSize: 32.sp),
                      itemWidth: 32.w,
                      itemHeight: 52.h,
                      itemCount: 1,
                      value: updatesecondsSecond[shotIndex - 1],
                      minValue: 0,
                      maxValue: 9,
                      onChanged: (value) {
                        updatesecondsSecond[shotIndex - 1] = value;
                        context.read<StageBloc>().add(ForEachShotChangedEvent(
                            secondsFirst: updatesecondsFirst,
                            secondsSecond: updatesecondsSecond,
                            millisecondsFirst: updatemillisecondsFirst,
                            millisecondsSecond: updatemillisecondsSecond));
                        // setState(() {
                        //   secondsSecond[shotIndex - 1] = value;
                        // });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                    child: Text(
                      ':',
                      style: TextStyle(
                          // color: AppColors.blackTextColor,
                          fontFamily: AppFontFamily.bold,
                          fontSize: 32.sp),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5.h)),
                    child: NumberPicker(
                      itemWidth: 32.w,
                      itemHeight: 52.h,
                      itemCount: 1,
                      value: updatemillisecondsFirst[shotIndex - 1],
                      minValue: 0,
                      maxValue: 9,
                      selectedTextStyle: TextStyle(
                          // color: AppColors.blackTextColor,
                          fontFamily: AppFontFamily.regular,
                          fontSize: 32.sp),
                      onChanged: (value) {
                        updatemillisecondsFirst[shotIndex - 1] = value;
                        context.read<StageBloc>().add(ForEachShotChangedEvent(
                            secondsFirst: updatesecondsFirst,
                            secondsSecond: updatesecondsSecond,
                            millisecondsFirst: updatemillisecondsFirst,
                            millisecondsSecond: updatemillisecondsSecond));
                        // setState(() {
                        //   millisecondsFirst[shotIndex - 1] = value;
                        // });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        // color: AppColors.countBaseColor,
                        borderRadius: BorderRadius.circular(5.h)),
                    child: NumberPicker(
                      itemWidth: 32.w,
                      itemHeight: 52.h,
                      itemCount: 1,
                      value: updatemillisecondsSecond[shotIndex - 1],
                      minValue: 0,
                      maxValue: 9,
                      selectedTextStyle: TextStyle(
                          // color: AppColors.blackTextColor,
                          fontFamily: AppFontFamily.regular,
                          fontSize: 32.sp),
                      onChanged: (value) {
                        updatemillisecondsSecond[shotIndex - 1] = value;
                        context.read<StageBloc>().add(ForEachShotChangedEvent(
                            secondsFirst: updatesecondsFirst,
                            secondsSecond: updatesecondsSecond,
                            millisecondsFirst: updatemillisecondsFirst,
                            millisecondsSecond: updatemillisecondsSecond));
                        // setState(() {
                        //   millisecondsSecond[shotIndex - 1] = value;
                        // });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.greyTextColor.withOpacity(0.17),
            )
          ],
        );
      },
    );
  }

  void _clearTimes() {
    // showModalBottomSheet(
    //     backgroundColor: AppColors.white,
    //     context: context,
    //     builder: (context) => _clearParTimeBottomSheet(context));
    // _clearParTimeBottomSheet(context);
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (_) => AppBottomSheetWidget(
            height: 0.4,
            child: Padding(
              padding: hPadding,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // const Gap(1),
                    Icon(Icons.info_outline_rounded,
                        color: AppColors.deepOrange),
                    Text('Note',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: AppFontFamily.bold,
                            fontSize: 20.sp)),
                    Text('Do you want to clear the Par Time?',
                        style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontFamily: AppFontFamily.regular,
                            fontSize: 16.sp)),
                    const Gap(14),
                    Row(
                      children: [
                        Expanded(
                          child: BorderButton(
                            title: 'Discard',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: PrimaryButton(
                            title: 'Yes',
                            style: TextStyle(
                                color: AppColors.white,
                                fontFamily: AppFontFamily.bold,
                                fontSize: 16.sp,
                                letterSpacing: 0.6),
                            onTap: () {
                              int noOfShots = int.parse(
                                  widget.stageEntity.drill?.drill?.noOfShots ??
                                      '');
                              context.read<StageBloc>().add(
                                  ForEachShotChangedEvent(
                                      secondsFirst: List.filled(noOfShots, 0),
                                      secondsSecond: List.filled(noOfShots, 0),
                                      millisecondsFirst:
                                          List.filled(noOfShots, 0),
                                      millisecondsSecond:
                                          List.filled(noOfShots, 0)));
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ]),
            )));
  }

  Widget _clearParTimeBottomSheet(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Container(
            width: 74.w,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.kPrimaryColor, width: 5.w),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 36.h,
          ),
          Icon(
            // size: 20.w,
            Icons.error_outline_rounded,
            color: AppColors.kPrimaryColor,
          ),
          SizedBox(height: 8.h),
          Text(
            'Note',
            style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontFamily: AppFontFamily.bold,
                fontSize: 20.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Do you want to clear the Par Time',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontFamily: AppFontFamily.regular),
          ),
          SizedBox(
            height: 60.h,
          ),
          ExitSaveButton(
            firstButton: 'Discard',
            onTapFirstButton: () => Navigator.pop(context),
            secondButton: 'Yes',
            onTapSecondButton: () {
              int noOfShots =
                  int.parse(widget.stageEntity.drill?.drill?.noOfShots ?? '');
              context.read<StageBloc>().add(ForEachShotChangedEvent(
                  secondsFirst: List.filled(noOfShots, 0),
                  secondsSecond: List.filled(noOfShots, 0),
                  millisecondsFirst: List.filled(noOfShots, 0),
                  millisecondsSecond: List.filled(noOfShots, 0)));
              Navigator.pop(context);
              //int noOfShots = int.parse(widget.stageEntity.drill.noOfShots);

              // setState(() {
              //   int noOfShots = int.parse(widget.stageEntity.drill.noOfShots);
              //   secondsFirst = List.filled(noOfShots, 0);
              //   secondsSecond = List.filled(noOfShots, 0);
              //   millisecondsFirst = List.filled(noOfShots, 0);
              //   millisecondsSecond = List.filled(noOfShots, 0);
              // });
            },
          ),
          SizedBox(
            height: 26.h,
          ),
        ],
      ),
    );
  }
}
