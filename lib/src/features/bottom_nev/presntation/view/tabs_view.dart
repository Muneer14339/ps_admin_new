
import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:pa_sreens/gen/assets.gen.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/theme/font/app_fonts.dart';
import '../../../../core/theme/theme_data/theme_data.dart';
import '../../../../core/utils/constants.dart';
import '../../../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../../../train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../../../train/connectivity/presentation/view/bluetooth_view.dart';
import '../../../train/connectivity/presentation/view/wifi_list_view.dart';
import '../bloc/tab_bloc.dart';

class AppTabsView extends StatefulWidget {
  const AppTabsView({super.key});

  @override
  _AppTabsViewState createState() => _AppTabsViewState();
}

class _AppTabsViewState extends State<AppTabsView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TabBloc, TabState>(
      builder: (context, state) {
        return PopScope(
          canPop: false, // Prevents popping automatically
          onPopInvokedWithResult: (bool didPop, Object? result) async {
            if (!didPop) {
              final shouldExit = ExitApp.shouldExit();
              if (shouldExit) {
                SystemNavigator.pop();
              }
            }
          },
          child: Scaffold(
            extendBody: true,
            backgroundColor: AppTheme.background(context),
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              itemCount: 5,
              tabBuilder: (int index, bool isActive) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    !isActive ? iconList[index] : iconListFilled[index],
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        iconListText[index],
                        maxLines: 1,
                        style: TextStyle(
                          color: isActive
                              ? AppColors.kPrimaryColor
                              : AppColors.greyColor,
                          fontFamily: AppFontFamily.regular,
                          fontSize: 10.sp,
                        ),
                      ),
                    )
                  ],
                );
              },
              backgroundColor:
              AppTheme.background(context),
              activeIndex: state.index,
              // splashColor: AppColors.kPrimaryColor,
              notchAndCornersAnimation: borderRadiusAnimation,
              splashSpeedInMilliseconds: 300,
              notchSmoothness: NotchSmoothness.defaultEdge,
              gapLocation: GapLocation.none,
              leftCornerRadius: 12,
              rightCornerRadius: 12,
              onTap: (index) =>
                  context.read<TabBloc>().add(TabEvent.setTab(index)),
              hideAnimationController: _hideBottomBarAnimationController,
              shadow: BoxShadow(
                offset: const Offset(0, 9),
                blurRadius: 19,
                spreadRadius: 0.9,
                color: AppColors.kPrimaryColor,
              ),
            ),
            body: AnimatedSwitcher(
              duration: Duration.zero, //kAnimationDuration,
              switchInCurve: kAnimationCurve,
              child: state.screen,
            ),
          ),
        );
      },
    );
  }

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <Widget>[
    SvgPicture.asset(Assets.icons.homeSvg, height: 25, width: 25),
    SvgPicture.asset(Assets.icons.completeSvg, height: 25, width: 25),
    SvgPicture.asset(Assets.icons.trainSvg,
        height: 25,
        width: 25,
        colorFilter: ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn)),
    SvgPicture.asset(Assets.icons.historySvg, height: 25, width: 25),
    SvgPicture.asset(Assets.icons.profileSvg, height: 25, width: 25),
  ];
  final iconListFilled = <Widget>[
    SvgPicture.asset(Assets.icons.homeSvg,
        height: 25,
        width: 25,
        colorFilter:
            ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn)),
    SvgPicture.asset(Assets.icons.completeSvg,
        height: 25,
        width: 25,
        colorFilter:
            ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn)),
    SvgPicture.asset(Assets.icons.trainSvg,
        height: 25,
        width: 25,
        colorFilter:
            ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn)),
    SvgPicture.asset(Assets.icons.historySvg,
        height: 25,
        width: 25,
        colorFilter:
            ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn)),
    SvgPicture.asset(Assets.icons.profileSvg,
        height: 25,
        width: 25,
        colorFilter:
            ColorFilter.mode(AppColors.kPrimaryColor, BlendMode.srcIn)),
  ];

  final iconListText = <String>[
    "Home",
    "Compete",
    "Train",
    "History",
    "Profile",
  ];

  @override
  void initState() {
    super.initState();
    // context.read<ProfileRemoteBloc>().add(UserProfileRemoteEvent(
    //     userId: locator<LocalStorageService>().userIdString));
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation =
        Tween<double>(begin: 0, end: 1).animate(borderRadiusCurve);

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    Future.delayed(Duration.zero, () {
      if (mounted) {
        showSetupRequiredDialog(context);
      }
    });
    Future.delayed(
      const Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
    // appBleDeviceBloc.add(const InitializeBluetooth());
  }



  void showSetupRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E212C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          titlePadding: EdgeInsets.only(top: 24.h),
          title: Center(
            child: Text(
              'Setup Required',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          content: Text(
            'Please turn on your AimSync Camera and AimSync BLE device before continuing.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.sp,
              color: const Color(0xFFB0B3BA),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: EdgeInsets.only(bottom: 20),
          actions: [
            SizedBox(
              width: 0.30.sw,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  // cameraWiBloc.add(ConnectToWifiBackGround());
                 // await exportAllInternalVideos();
                  appBleDeviceBloc.add(
                    AppBleDeviceEvent.backgroundConnectToBLEDevice(),
                  );
                  Navigator.of(context).pop();
                } ,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }



}

class ExitApp {
  static DateTime? currentBackPressTime;

  static bool shouldExit() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      toast('Double click to exit!');
      return false;
    }
    return true;
  }
}
