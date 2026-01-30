import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/features/bottom_nev/presntation/view/tabs_view.dart';
import '../../core/services/locator/locator.dart';
import '../train/connectivity/presentation/bloc/bluetooth_bloc/app_ble_device_bloc.dart';
import '../train/connectivity/presentation/bloc/wifi_bloc/camera_wifi_bloc.dart';
import '../train/connectivity/presentation/view/bluetooth_view.dart';
import '../train/connectivity/presentation/view/wifi_list_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        if (prefs?.getString(
                locator<LocalStorageService>().appKeys.keyUserObject) !=
            null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AppTabsView()));
        } else {

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AppTabsView()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  AppColors.blackTextColor.withOpacity(0.5), BlendMode.darken),
              fit: BoxFit.cover,
              image: const AssetImage('assets/images/splashscreenimg.png'))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 128.w,
              height: 127.h,
              child: Image.asset(
                'assets/images/PA_logo.png',
                fit: BoxFit.cover,
              )),
          SizedBox(height: 9.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Text(
              'Empowering Shooters, One precision Tool at a Time',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24.sp,
                  letterSpacing: 1,
                  fontFamily: AppFontFamily.helvetic),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ));
  }
}
