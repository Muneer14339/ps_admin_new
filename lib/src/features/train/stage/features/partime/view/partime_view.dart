// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/bottom_sheet_.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/custom_switch.dart';
import 'package:pa_sreens/src/core/widgets/orange_button.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';
import 'package:pa_sreens/src/features/train/stage/features/mode/presentation/component/mode_parts.dart';
import 'package:pa_sreens/src/features/train/stage/features/partime/view/partime_begin.dart';
import 'package:pa_sreens/src/features/train/stage/features/partime/view/partime_foreach.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_cubit/satge_cubit.dart';

// ignore: must_be_immutable
class ParTimeScreen extends StatefulWidget {
  StageEntity stageEntity;
  DrillsModel drillsEntity;
  ParTimeScreen({
    super.key,
    required this.stageEntity,
    required this.drillsEntity,
  });

  @override
  State<ParTimeScreen> createState() => _ParTimeScreenState();
}

class _ParTimeScreenState extends State<ParTimeScreen> {
  late int isMute;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrainBackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'Par Time'),
        body: BlocBuilder<StageBloc, StageState>(
          builder: (context, state) {
            return Column(
              children: [
                ModePartWidget(
                  text: 'Par Time',
                  rightWidget: Row(
                    children: [
                      (widget.drillsEntity.drill?.parTimeList?.length ?? 0) <= 1
                          ? Text(
                              'Par Time being to end',
                              style: TextStyle(
                                  fontFamily: AppFontFamily.regular,
                                  fontSize: 14.sp,
                                  color: AppColors.greyTextColor),
                            )
                          : Text(
                              'Par Time for each shot',
                              style: TextStyle(
                                  fontFamily: AppFontFamily.regular,
                                  fontSize: 14.sp,
                                  color: AppColors.greyTextColor),
                            ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18.w,
                      ),
                    ],
                  ),
                  onTap: () => showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => _buildParTimeBottomSheet(context,
                          widget.stageEntity, isMute, widget.drillsEntity)),
                  isSelected: false,
                ),
                BlocProvider(
                  create: (context) => ParTimeMuteCubit(),
                  child: BlocBuilder<ParTimeMuteCubit, int>(
                    builder: (context, state) {
                      isMute = state;
                      return ModePartWidget(
                        text: 'Mute',
                        rightWidget: CustomSwitch(
                            value: state == 1,
                            enableColor: Colors.green,
                            disableColor:
                                AppColors.switchColor.withOpacity(0.3),
                            onChanged: (value) {
                              value
                                  ? context.read<ParTimeMuteCubit>().unmute()
                                  : context.read<ParTimeMuteCubit>().mute();
                            }, ),
                        onTap: () => '',
                        isSelected: false,
                      );
                    },
                  ),
                ),
                const Spacer(),
                OrangeButton(
                    text: 'Back',
                    onTap: () {
                      Navigator.pop(context);
                    }),
                SizedBox(height: 50.h)
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _buildParTimeBottomSheet(BuildContext context, StageEntity stageEntity,
    int isMute, DrillsModel drillsEntity) {
  return AppBottomSheetWidget(
      height: 0.4,
      child: Padding(
        padding: hPadding,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.info_outline_rounded, color: AppColors.deepOrange),
              const Gap(16),
              Text('Note',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: AppFontFamily.bold,
                      fontSize: 20.sp)),
              const Gap(16),
              Text(
                'Choose Par time to create your drill',
                style: TextStyle(
                    color: AppColors.greyTextColor,
                    fontFamily: AppFontFamily.regular),
              ),
              const Spacer(),
              PrimaryButton(
                  title: 'Par Time begin to end',
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFontFamily.bold,
                      fontSize: 16.sp,
                      letterSpacing: 0.6),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParTimeBeginToEnd(
                                  drillsEntity: drillsEntity,
                                  stageEntity: stageEntity,
                                  isMute: isMute,
                                )));
                  }),
              const Gap(8),
              PrimaryButton(
                  title: 'Par Time for each shot',
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFontFamily.bold,
                      fontSize: 16.sp,
                      letterSpacing: 0.6),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParTimeForEach(
                                  drillsEntity: drillsEntity,
                                  stageEntity: stageEntity,
                                  isMute: isMute,
                                )));
                  }),
              const Gap(20)
            ]),
      ));
  // SizedBox(
  //   height: 360.h,
  //   child: Column(
  //     children: [
  //       SizedBox(
  //         height: 16.h,
  //       ),
  //       Container(
  //         width: 74.w,
  //         decoration: BoxDecoration(
  //             border: Border.all(color: AppColors.kPrimaryColor, width: 5.w),
  //             borderRadius: BorderRadius.circular(10)),
  //       ),
  //       SizedBox(
  //         height: 36.h,
  //       ),
  //       Icon(
  //         // size: 20.w,
  //         Icons.error_outline_rounded,
  //         color: AppColors.kPrimaryColor,
  //       ),
  //       SizedBox(height: 8.h),
  //       Text(
  //         'Note',
  //         style: TextStyle(
  //             color: AppColors.kPrimaryColor,
  //             fontFamily: AppFontFamily.bold,
  //             fontSize: 20.sp),
  //       ),
  //       SizedBox(
  //         height: 20.h,
  //       ),
  //       Text(
  //         'Choose Par time to create your drill',
  //         style: TextStyle(
  //             color: AppColors.greyTextColor,
  //             fontFamily: AppFontFamily.regular),
  //       ),
  //       SizedBox(
  //         height: 26.h,
  //       ),
  //       OrangeButton(
  //           text: 'Par Time begin to end',
  //           onTap: () {
  //             Navigator.of(context).pop();
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => ParTimeBeginToEnd(
  //                           drillsEntity: drillsEntity,
  //                           stageEntity: stageEntity,
  //                           isMute: isMute,
  //                         )));
  //           }),
  //       SizedBox(height: 16.h),
  //       OrangeButton(
  //           text: 'Par Time for each shot',
  //           onTap: () {
  //             Navigator.of(context).pop();
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => ParTimeForEach(
  //                           drillsEntity: drillsEntity,
  //                           stageEntity: stageEntity,
  //                           isMute: isMute,
  //                         )));
  //           })
  //     ],
  //   ),
  // );
}
