import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/background_paint.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:pa_sreens/src/features/profile/presentation/view/backup_restore_view.dart';
import 'package:pa_sreens/src/features/profile/presentation/widgets/lang_region_tile.dart';
import '../../../../core/widgets/custom_switch.dart';

class DataBackupView extends StatefulWidget {
  const DataBackupView({super.key});

  @override
  State<DataBackupView> createState() => _DataBackupViewState();
}

class _DataBackupViewState extends State<DataBackupView> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: BackgroundPainter(context),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is RestoreBackUpState &&
              !state.isRestored &&
              !state.isRestoring) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BackupRestoreView()),
            );
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Scaffold(
              appBar: appBarCustom(ctx: context, title: 'Data and Backup'),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  const Gap(35),
                  Text('Backup Setting',
                      style: TextStyle(
                          fontFamily: AppFontFamily.bold, fontSize: 18.sp)),
                  const Gap(12),
                  ModifiedContainer(
                    padding: const EdgeInsets.all(12),
                    borderRadius: 12,
                    color: Theme.of(context).cardColor, //AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20.h),
                        Text(
                            'With PulseAim, securely back up your valuable data, including Sessions, Drills, and Weapons. Enable automatic backups to keep all your progress safe and easily accessible, ensuring you never lose track of your training journey.',
                            style: TextStyle(
                              height: 1.4,
                              fontFamily: AppFontFamily.regular,
                              fontSize: 12.sp,
                              color: AppColors.greyTextColor,
                            )),
                        Gap(12.h),
                        Text(
                          'Last Backup: 21 September, 6:19 am',
                          style: TextStyle(
                            fontFamily: AppFontFamily.regular,
                            // color: AppColors.greyTextColor,
                          ),
                        ),
                        Gap(18.h),
                        (state is IsBackupLoadingState && state.isBackupLoading)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                          child: LinearProgressIndicator(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                      )),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      IconButton(
                                          iconSize: 22.h,
                                          onPressed: () => context
                                              .read<ProfileBloc>()
                                              .add(CancelBackUpLoadingEvent()),
                                          icon: const Icon(Icons.close)),
                                    ],
                                  ),
                                  Text('Preparing Storage for Backup......',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.greyTextColor,
                                          fontFamily: AppFontFamily.regular))
                                ],
                              )
                            : PrimaryButton(
                                title: 'Backup Now',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.borderOutline,
                                    letterSpacing: 0.6,
                                    fontFamily: AppFontFamily.bold),
                                width: 149.w,
                                onTap: () {
                                  context.read<ProfileBloc>().add(
                                      IsBackUpLoadingEvent(
                                          isBackUpLoading: true));
                                }),
                        Gap(12.h),
                        Text(
                          'Having Issue?',
                          style: TextStyle(
                              fontFamily: AppFontFamily.bold,
                              color: AppColors
                                  .kPrimaryColor //Theme.of(context).primaryColor,
                              ),
                        ),
                        Gap(24.h),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.w))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14.w, vertical: 16.h),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Frequency',
                                          style: TextStyle(
                                              // color: AppColors.blackTextColor,
                                              fontSize: 14.sp,
                                              fontFamily:
                                                  AppFontFamily.regular),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 2.h, 0, 12.h),
                                          child: Divider(
                                            color: AppColors.black
                                                .withOpacity(0.10),
                                          ),
                                        ),
                                        LanguageRegionTile(
                                            onChanged: (p0) {
                                              backupTypeSelected = p0 ?? '';
                                              context.read<ProfileBloc>().add(
                                                  BackupFrequencyChangeEvent(
                                                      freqyency: p0 ?? ''));
                                              Navigator.pop(context);
                                            },
                                            groupValue: (state
                                                    is BackupFrequencyChangeState)
                                                ? state.frequency
                                                : backupTypeSelected,
                                            value:
                                                'Only When “I” Tap “ Backup” '),
                                        LanguageRegionTile(
                                            onChanged: (p0) {
                                              backupTypeSelected = p0 ?? '';
                                              context.read<ProfileBloc>().add(
                                                  BackupFrequencyChangeEvent(
                                                      freqyency: p0 ?? ''));
                                              Navigator.pop(context);
                                            },
                                            groupValue: (state
                                                    is BackupFrequencyChangeState)
                                                ? state.frequency
                                                : backupTypeSelected,
                                            value: 'Daily'),
                                        LanguageRegionTile(
                                            onChanged: (p0) {
                                              backupTypeSelected = p0 ?? '';
                                              context.read<ProfileBloc>().add(
                                                  BackupFrequencyChangeEvent(
                                                      freqyency: p0 ?? ''));
                                              Navigator.pop(context);
                                            },
                                            groupValue: (state
                                                    is BackupFrequencyChangeState)
                                                ? state.frequency
                                                : backupTypeSelected,
                                            value: 'Weekly'),
                                        LanguageRegionTile(
                                            onChanged: (p0) {
                                              backupTypeSelected = p0 ?? '';
                                              context.read<ProfileBloc>().add(
                                                  BackupFrequencyChangeEvent(
                                                      freqyency: p0 ?? ''));
                                              Navigator.pop(context);
                                            },
                                            groupValue: (state
                                                    is BackupFrequencyChangeState)
                                                ? state.frequency
                                                : backupTypeSelected,
                                            value: 'Monthly'),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        InkWell(
                                          onTap: () => Navigator.pop(context),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppFontFamily.regular,
                                                  fontSize: 14.sp,
                                                  color: AppColors.cancelText),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/icons/frequency.png',
                                  width: 16.h,
                                  color: Theme.of(context).iconTheme.color),
                              const Gap(12),
                              const Text('Frequency'),
                              const Spacer(),
                              Text(
                                backupTypeSelected,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.greyTextColor,
                                    fontFamily: AppFontFamily.regular),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16.w,
                              )
                            ],
                          ),
                        ),
                        Gap(24.h),
                      ],
                    ),
                  ),
                  ModifiedContainer(
                    margin: EdgeInsets.only(top: 12.h),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 26),
                    borderRadius: 12,
                    color: Theme.of(context).cardColor, //AppColors.white,
                    child: Row(
                      children: [
                        Image.asset('assets/icons/refresh.png',
                            width: 18.h,
                            color: Theme.of(context).iconTheme.color),
                        const Gap(12),
                        Text('Backup Using Cellular',
                            style:
                                TextStyle(fontFamily: AppFontFamily.regular)),
                        const Spacer(),
                        Text(
                          'ON',
                          style: TextStyle(
                              // color: AppColors.greyTextColor,
                              fontFamily: AppFontFamily.regular,
                              fontSize: 12.sp),
                        ),
                        Gap(5.w),
                        CustomSwitch(
                            height: 16.h,
                            width: 32.w,
                            switchHeight: 14.h,
                            switchWidth: 14.w,
                            value: true,
                            enableColor: Colors.orange,
                            disableColor:
                                AppColors.switchColor.withOpacity(0.3),
                            onChanged: (value) {})
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String backupTypeSelected = 'Monthly';
}
