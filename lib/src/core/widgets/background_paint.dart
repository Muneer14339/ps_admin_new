import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';

class BackgroundPainter extends CustomPainter {
  BackgroundPainter(this.context);
  final BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    // White shape at the bottom left
    Paint greyPaint = Paint()
      ..color =
          Theme.of(context).cardTheme.shadowColor ?? AppColors.countBaseColor
      ..isAntiAlias = false;

    Path greyPath = Path();
    greyPath.moveTo(0, 150.h);
    greyPath.lineTo(size.width, 50.h);
    greyPath.lineTo(size.width, 750.h);
    greyPath.lineTo(0, 650.h);

    greyPath.close();

    canvas.drawPath(greyPath, greyPaint);

    Paint whitePaint = Paint()
      ..color = Theme.of(context).cardTheme.color ?? Colors.grey.shade100
      ..isAntiAlias = false;

    Path whitePath = Path();

    whitePath.moveTo(0, 0);
    whitePath.lineTo(size.width, 0);
    whitePath.lineTo(size.width, 50.h);
    whitePath.lineTo(0, 150.h);
    whitePath.close();

    canvas.drawShadow(whitePath, AppColors.black.withOpacity(0.2), 10.0, false);
    canvas.drawPath(whitePath, whitePaint);

    Path bottomsShapeShadow = Path();
    bottomsShapeShadow.moveTo(0, 655.h);
    bottomsShapeShadow.lineTo(size.width, 755.h);
    // bottomsShapeShadow.lineTo(size.width, size.height);
    bottomsShapeShadow.lineTo(0, size.height);
    bottomsShapeShadow.close();
    // Draw custom shadow for the bottom shape using a rectangular outer boundary and the shape as the inner boundary
    canvas.drawPath(
        bottomsShapeShadow,
        Paint()
          ..color = AppColors.black.withOpacity(
              0.2) // You can adjust the alpha value for transparency
          ..maskFilter = MaskFilter.blur(BlurStyle.outer,
              convertRadiusToSigma(10)) // Adjust the blur radius
        );

    Path bottomsShapePath = Path();
    bottomsShapePath.moveTo(0, 650.h);
    bottomsShapePath.lineTo(size.width, 750.h);
    bottomsShapePath.lineTo(size.width, size.height);
    bottomsShapePath.lineTo(0, size.height);
    // bottomsShapePath.lineTo(size.width * 0.4, size.height);
    bottomsShapePath.close();
    canvas.drawPath(bottomsShapePath, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}

// import 'package:flutter/material.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
// class BackgroundPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Light blue shape at the top left
//     Paint whitePaint = Paint()..color = AppColors.white;

//     Path whitePath = Path();
//     whitePath.moveTo(0, 0);
//     whitePath.lineTo(size.width, 0);
//     whitePath.lineTo(size.width, size.height * 0.05);
//     whitePath.lineTo(0, size.height * 0.25);
//     whitePath.close();
//     canvas.drawPath(whitePath, whitePaint);

//     // White shape at the bottom left
//     Paint greyPaint = Paint()..color = AppColors.countBaseColor;

//     Path greyPath = Path();
//     greyPath.moveTo(0, size.height * 0.25);
//     greyPath.lineTo(size.width, size.height * 0.05);
//     greyPath.lineTo(size.width, size.height * 0.95);
//     greyPath.lineTo(0, size.height * 0.75);
//     greyPath.close();
//     canvas.drawPath(greyPath, greyPaint);

//     // Light blue shape at the bottom right
//     Path bottomsShapePath = Path();
//     bottomsShapePath.moveTo(0, size.height * 0.75);
//     bottomsShapePath.lineTo(size.width, size.height * 0.95);
//     bottomsShapePath.lineTo(size.width, size.height);
//     bottomsShapePath.lineTo(0, size.height);
//     // bottomsShapePath.lineTo(size.width * 0.4, size.height);
//     bottomsShapePath.close();
//     canvas.drawPath(bottomsShapePath, whitePaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
