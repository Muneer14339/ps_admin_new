import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/background_paint.dart';
import 'package:pa_sreens/src/core/widgets/border_button.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/orange_button.dart';
import 'package:pa_sreens/src/core/widgets/primary_button.dart';
import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';

class BackupRestoreView extends StatelessWidget {
  const BackupRestoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: BackgroundPainter(context),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Scaffold(
              appBar: appBarCustom(ctx: context, title: 'Restore Backup'),
              body: (state is RestoreBackUpState && !state.isRestored)
                  ? Container(
                      margin: EdgeInsets.fromLTRB(24.w, 72.h, 24.w, 0),
                      padding: EdgeInsets.fromLTRB(14.w, 15.h, 14.w, 15.h),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.h)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (!state.isRestoring)
                              ? Text(
                                  'Backup found',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.black,
                                      fontFamily: AppFontFamily.bold),
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: 16.h,
                          ),
                          Image.asset(
                            'assets/icons/backup_restore.png',
                            width: 48.w,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            child: Text(
                              'backup-12',
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontSize: 14.sp,
                                  fontFamily: AppFontFamily.regular),
                            ),
                          ),
                          Text(
                            '1 week ago',
                            style: TextStyle(
                                color: AppColors.greyTextColor,
                                fontSize: 10.sp,
                                fontFamily: AppFontFamily.regular),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(10.w, 32.h, 10.w, 230.h),
                            child: Text(
                              'Restore your sessions history, media files, and sessions by clicking the restore button.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontSize: 12.sp,
                                  fontFamily: AppFontFamily.regular),
                            ),
                          ),
                          (!state.isRestoring)
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: BorderButton(
                                        title: 'Discard',
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontFamily: AppFontFamily.bold,
                                            fontSize: 16.sp,
                                            letterSpacing: 0.6),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    Expanded(
                                        child: PrimaryButton(
                                      title: 'Restore',
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontFamily: AppFontFamily.bold,
                                          fontSize: 16.sp,
                                          letterSpacing: 0.6),
                                      onTap: () => context
                                          .read<ProfileBloc>()
                                          .add(RestoreBackupEvent(
                                              isRestored: false,
                                              isRestoring: true)),
                                    ))
                                  ],
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(6.h)),
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Text(
                                            '15%',
                                            style: TextStyle(
                                                color: AppColors.kPrimaryColor,
                                                fontSize: 10.sp,
                                                fontFamily:
                                                    AppFontFamily.regular),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Text(
                                      'restoring backup......',
                                      style: TextStyle(
                                          color: AppColors.blackTextColor,
                                          fontSize: 14.sp,
                                          fontFamily: AppFontFamily.regular),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.fromLTRB(24.w, 128.h, 24.w, 0.h),
                      padding: EdgeInsets.fromLTRB(14.w, 36.h, 14.w, 0),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.h)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/emailverif.png',
                            height: 74.h,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 13.h),
                            child: Text(
                              // 'Verification email sent',
                              'Restored Successfully',
                              style: TextStyle(
                                  color: AppColors.blackTextColor,
                                  fontFamily: AppFontFamily.bold,
                                  fontSize: 24.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Your data is restored successfully you can proceed to the further to configure your account.',
                              style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontFamily: AppFontFamily.regular,
                                  fontSize: 16.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 32.h, 0, 47.h),
                            child: OrangeButton(
                              radius: 6.w,
                              text: 'Next',
                              onTap: () => '',
                              horizontalPadding: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          },
        ));
  }
}
