// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
// import 'package:pa_sreens/src/core/services/locator/locator.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
// import 'package:pa_sreens/src/core/theme/theme.dart';
// import 'package:pa_sreens/src/core/utils/utils.dart';
//
// part 'theme_state.dart';
//
// class ThemeCubit extends Cubit<ThemeStateModel> {
//   ThemeCubit()
//       : super(ThemeStateModel(
//           themeData: lightTheme(MaterialColor(AppColors.kPrimaryColor.value, {
//             50: AppColors.kPrimaryColor,
//             100: AppColors.kPrimaryColor,
//             200: AppColors.kPrimaryColor,
//             300: AppColors.kPrimaryColor,
//             400: AppColors.kPrimaryColor,
//             500: AppColors.kPrimaryColor,
//             600: AppColors.kPrimaryColor,
//             700: AppColors.kPrimaryColor,
//             800: AppColors.kPrimaryColor,
//             900: AppColors.kPrimaryColor,
//           })),
//           isDarkMode: false,
//         ));
//
//   void toggleTheme() {
//     if (state.isDarkMode) {
//       prefs?.setBool(locator<LocalStorageService>().userIdString, false);
//       emit(ThemeStateModel(
//           themeData: lightTheme(
//               MaterialColor(AppColors.kPrimaryColor.value, materialColor)),
//           isDarkMode: false));
//     } else {
//       prefs?.setBool(locator<LocalStorageService>().userIdString, true);
//       emit(ThemeStateModel(
//           themeData: lightTheme(Colors.brown), isDarkMode: true));
//     }
//   }
//
//   Future<void> _loadTheme() async {
//     final isDarkMode = prefs?.getBool('isDarkMode') ?? false;
//     emit(ThemeStateModel(
//       themeData:
//           isDarkMode ? lightTheme(Colors.brown) : lightTheme(Colors.blue),
//       isDarkMode: isDarkMode,
//     ));
//   }
//
//   Map<int, Color> materialColor = {
//     50: AppColors.kPrimaryColor,
//     100: AppColors.kPrimaryColor,
//     200: AppColors.kPrimaryColor,
//     300: AppColors.kPrimaryColor,
//     400: AppColors.kPrimaryColor,
//     500: AppColors.kPrimaryColor,
//     600: AppColors.kPrimaryColor,
//     700: AppColors.kPrimaryColor,
//     800: AppColors.kPrimaryColor,
//     900: AppColors.kPrimaryColor,
//   };
// }
