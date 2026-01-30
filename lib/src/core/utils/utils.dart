import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';

//--------------------- toast

void toast(String? message) {
  BotToast.showText(text: message ?? 'Coming Soon...');
}

void notification(bool? success, String? message) {
  BotToast.showSimpleNotification(
      align: Alignment.topCenter,
      backgroundColor: success == null
          ? const Color(0xffFFCC00)
          : success
              ? Colors.green
              : Colors.red,
      title: success == null
          ? 'Info'
          : success
              ? 'Success'
              : 'Error',
      titleStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: AppFontFamily.bold,
          color: AppColors.white),
      subTitleStyle: TextStyle(
          color: AppColors.white,
          fontFamily: AppFontFamily.regular,
          fontSize: 14.sp),
      dismissDirections: [
        DismissDirection.horizontal,
        DismissDirection.vertical
      ],
      subTitle: message);
}

//--------------------- hPadding

EdgeInsets hPadding = const EdgeInsets.symmetric(horizontal: 16);

//--------------------- arrowIconSize

const double arrowIconSize = 20;

//--------------------- arrowIconSize

// Divider appDivider = Divider(color: AppColors.dividerColor, thickness: 1);

//--------------------- initializeSharedPreference

SharedPreferences? prefs;
Future<SharedPreferences> initializeSharedPreference() async {
  return await SharedPreferences.getInstance();
}

//--------------------- secsToMiliSeconds

int secsToMiliSeconds(int seconds) {
  // int secondsInInt = int.parse(seconds);
  return seconds * 100;
}

int miliSecondsToSecs(int seconds) {
  // int secondsInInt = int.parse(seconds);
  return (seconds / 100).round();
}

double miliSecondsToSecsSplitTime(int mili) {
  // int secondsInInt = int.parse(seconds);
  return (mili / 100);
}

String convertMillisecondsToTime(int milliseconds) {
  final int seconds = milliseconds ~/ 1000; // Convert to seconds
  final int centiseconds =
      (milliseconds % 1000) ~/ 10; // Convert remainder to centiseconds

  return '${seconds.toString().padLeft(2, '0')}:${centiseconds.toString().padLeft(2, '0')}';
}

//

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  return null;
}

String? validatePasswords(String? value) {
  List<String> errors = [];

  if (value == null || value.isEmpty) {
    errors.add('Password is required');
  }

  if (value != null && value.length < 7) {
    errors.add('* Password must be at least 8 characters.');
  }

  if (value != null && !RegExp(r'[A-Z]').hasMatch(value)) {
    errors.add('* Password must contain at least one uppercase\n   letter.');
  }

  if (value != null && !RegExp(r'[0-9]').hasMatch(value)) {
    errors.add('* Password must contain at least one number.');
  }

  if (value != null && !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    errors.add('* Password must contain at least one special\n   character.');
  }

  if (errors.isNotEmpty) {
    return errors.join('\n');
  }

  return null;
}

String? validateLoginPass(String? value) {
  String errors = '';

  if (value == null || value.isEmpty) {
    errors = 'Password is required';
  }
  if (value != null && value.length < 8) {
    errors = 'Enter valid password!';
  }
  if (value != null && !RegExp(r'[A-Z]').hasMatch(value)) {
    errors = 'Enter valid password!';
  }
  if (value != null && !RegExp(r'[0-9]').hasMatch(value)) {
    errors = 'Enter valid password!';
  }

  if (value != null && !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    errors = 'Enter valid password!';
  }

  if (errors.isNotEmpty) {
    return errors;
  } else {
    return null;
  }
}

//--------------------- validations

String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Full name is required';
  }
  return null;
}

String? validateLocation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Location is required';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  // Basic email format check
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}



//-------------------- TextStyles

