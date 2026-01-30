import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/exit_save_button.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/view/stage_view.dart';
import '../../../../../../core/services/locator/locator.dart';
import '../../drill/data/local/service/drill_db_helper.dart';

class ParTimeBeginToEnd extends StatefulWidget {
  final StageEntity stageEntity;
  final DrillsModel drillsEntity;
  final int isMute;
  const ParTimeBeginToEnd(
      {super.key,
      required this.stageEntity,
      required this.isMute,
      required this.drillsEntity});

  @override
  State<ParTimeBeginToEnd> createState() => _ParTimeBeginToEndState();
}

class _ParTimeBeginToEndState extends State<ParTimeBeginToEnd> {
  int extractedSeconds = 0;
  int extractedMilliseconds = 0;
  @override
  void initState() {
    super.initState();
    int secs = widget.stageEntity.drill?.drill?.parTimeList!.length == 1
        ? widget.stageEntity.drill?.drill?.parTimeList![0] ?? 0
        : 0;
    if (secs != 0) {
      extractedSeconds = secs ~/ 100;
      extractedMilliseconds = secs % 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          'Par Time',
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.blackTextColor,
              fontFamily: AppFontFamily.bold),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 0, 0),
              child: Text(
                'Par Time begin to end',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.blackTextColor,
                    fontFamily: AppFontFamily.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
            child: Container(
              height: 52.h,
              decoration: BoxDecoration(
                  color: AppColors.greyTextfieldBack,
                  borderRadius: BorderRadius.circular(10.h)),
              child: Padding(
                padding: EdgeInsets.fromLTRB(18.w, 0, 24.w, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'No of shots',
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontFamily: AppFontFamily.regular,
                          fontSize: 14.sp),
                    ),
                    Text(
                      widget.drillsEntity.drill?.noOfShots ?? '',
                      style: TextStyle(
                          color: AppColors.blackTextColor,
                          fontFamily: AppFontFamily.regular,
                          fontSize: 14.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 360.h,
            child: BlocBuilder<StageBloc, StageState>(
              builder: (context, state) {
                if (state is BeginToEndChangedState) {
                  extractedSeconds = state.extractedSeconds;
                  extractedMilliseconds = state.extractedMilliSeconds;
                }
                return Column(
                  children: [
                    SizedBox(height: 80.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberPicker(
                            itemWidth: 60.w,
                            value: (state is BeginToEndChangedState)
                                ? state.extractedSeconds
                                : extractedSeconds,
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
                            onChanged: (value) => context.read<StageBloc>().add(
                                BeginToEndChangedEvent(
                                    extractedSeconds: value,
                                    extracedMilliSeconds:
                                        (state is BeginToEndChangedState)
                                            ? state.extractedMilliSeconds
                                            : extractedMilliseconds))),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                          child: Text(
                            's',
                            style: TextStyle(
                                color: AppColors.blackTextColor,
                                fontFamily: AppFontFamily.bold,
                                fontSize: 35.sp),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 5.h, 0, 0),
                            child: Text(
                              ':',
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontFamily: AppFontFamily.bold,
                                  fontSize: 40.sp),
                            )),
                        NumberPicker(
                            itemWidth: 60.w,
                            value: (state is BeginToEndChangedState)
                                ? state.extractedMilliSeconds
                                : extractedMilliseconds,
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
                            onChanged: (value) => context.read<StageBloc>().add(
                                BeginToEndChangedEvent(
                                    extractedSeconds:
                                        (state is BeginToEndChangedState)
                                            ? state.extractedSeconds
                                            : extractedSeconds,
                                    extracedMilliSeconds: value))),
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
                  ],
                );
              },
            ),
          ),
          const Spacer(),
          ExitSaveButton(
            firstButton: 'Discard',
            onTapFirstButton: () => Navigator.pop(context),
            secondButton: 'Save',
            onTapSecondButton: () async {
              int combinedValue =
                  extractedSeconds * 1000 + extractedMilliseconds * 100;
              DrillsEntity drillsEntity = DrillsEntity(
                description: widget.drillsEntity.drill?.description,
                fireType: widget.drillsEntity.drill?.fireType,
                isMute: widget.isMute,
                name: widget.drillsEntity.drill?.name,
                noOfShots: widget.drillsEntity.drill?.noOfShots,
                parTimeList: [combinedValue],
                partTimeType: 'begin',
              );
              DrillsModel? drillsModel = await DrillDbHelper().addNewDrill(
                  locator<LocalStorageService>().userIdString, drillsEntity);
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
              debugPrint('begin to end value is $combinedValue');
            },
          ),
          Flexible(
            child: SizedBox(
              height: 60.h,
            ),
          )
        ],
      ),
    );
  }
}
