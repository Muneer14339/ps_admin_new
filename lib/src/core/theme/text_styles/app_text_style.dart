// //-------------------- TextStyles

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import '../font/app_fonts.dart';

TextStyle s13w400regularFont({Color? color}) {
  return TextStyle(
    color: color ?? AppColors.white,
    fontFamily: AppFontFamily.regular,
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );
}

TextStyle s14w400regularFont({Color? color}) {
  return TextStyle(
    color: color ?? AppColors.black,
    fontFamily: AppFontFamily.regular,
    fontWeight: FontWeight.w400,
  );
}

TextStyle s12w400regularFont({Color? color}) {
  return TextStyle(
      color: color ?? AppColors.white,
      fontFamily: AppFontFamily.regular,
      fontWeight: FontWeight.w400,
      fontSize: 12);
}

TextStyle s16w400regularFont({Color? color}) {
  return TextStyle(
      color: color ?? AppColors.black,
      fontFamily: AppFontFamily.regular,
      fontWeight: FontWeight.w400,
      fontSize: 16);
}

TextStyle s16w700regularFont({Color? color}) {
  return TextStyle(
      color: color,
      fontFamily: AppFontFamily.regular,
      fontWeight: FontWeight.w700,
      fontSize: 16);
}

// TextStyle s16fw700Lato() {
//   return GoogleFonts.lato(
//       textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16));
// }

// TextStyle s22fw600Lato() {
//   return GoogleFonts.lato(
//       textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22));
// }

// TextStyle s26fw900Lato() {
//   return GoogleFonts.lato(
//       color: AppColors.kPrimaryColor,
//       textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 40));
// }

// TextStyle latoStyle({
//   Color? color,
//   double? fontSize,
//   FontWeight? fontWeight,
//   double? height,
// }) {
//   return GoogleFonts.lato(
//       textStyle: TextStyle(
//           height: height ?? 1.2,
//           fontWeight: fontWeight ?? FontWeight.w400,
//           fontFamily: GoogleFonts.lato().fontFamily,
//           color: color ?? AppColors.blackTextColor,
//           fontSize: fontSize ?? 14));
// }
