// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// import '../theme/app_theme.dart';

// class CustomSnackBar {
//   static Duration defaultDuration = const Duration(seconds: 4);

//   // --- Base Text Style for Messages ---
//   static const TextStyle _messageStyle = TextStyle(
//     fontSize: 16.0,
//     fontWeight: FontWeight.w500,
//     color: Colors.white
//   );

//   // --- Base Text Style for Titles ---
//   static const TextStyle _titleStyle = TextStyle(
//     fontSize: 18.0,
//     fontWeight: FontWeight.bold,
//     color: Colors.white
//   );

//   // --- Helper to build the Title Widget (Handles null title) ---
//   static Widget? _buildTitleText(String? title) {
//     if (title == null || title.isEmpty) {
//       return const SizedBox.shrink();
//     }
//     return Text(title, style: _titleStyle);
//   }

//   // --------------------------------------------------------------------------
//   // 🚀 SUCCESS SNACKBAR
//   // --------------------------------------------------------------------------

//   static void success({
//     String? title,
//     required String message,
//     Duration? duration,
//   }) async {
//     await closeAllSnackBars();

//     Get.snackbar(
//       title ?? 'Success',
//       message,
//       titleText: _buildTitleText(title),
//       messageText: Text(message, style: _messageStyle),
//       duration: duration ?? defaultDuration,
//       snackPosition: SnackPosition.TOP,

//       margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20), // Increased margins
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       maxWidth: 600,
//       backgroundColor: Colors.green.shade800.withOpacity(0.95),
//       snackStyle: SnackStyle.FLOATING,
     
//       dismissDirection: DismissDirection.horizontal, // Allowing swipe to dismiss can be user-friendly
//       icon: const Padding(
//         padding: EdgeInsets.only(left: 8.0),
//         child: Icon(
//           Icons.check_circle_rounded,
//           color: Colors.white,
//           size: 30,
//         ),
//       ),
//     );
//   }

//   // --------------------------------------------------------------------------
//   // 🚨 ERROR SNACKBAR
//   // --------------------------------------------------------------------------

//   static void error({
//     String? title,
//     required String message,
//     Color? color,
//     Duration? duration,
//   }) async {
//     await closeAllSnackBars();

//     Get.snackbar(
//       title ?? 'Error',
//       message,
//       titleText: _buildTitleText(title),
//       messageText: Text(message, style: _messageStyle),
//       snackStyle: SnackStyle.FLOATING,
//       duration: duration ?? defaultDuration,
//       snackPosition: SnackPosition.TOP,
//       // 👇 ADJUSTED MARGIN FOR MORE PRONOUNCED ROUNDING EFFECT
//       margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20), // Increased margins
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       maxWidth: 600,
//       backgroundColor: color ?? Colors.red.shade800.withOpacity(0.95),
//       dismissDirection: DismissDirection.horizontal,
//       icon: const Padding(
//         padding: EdgeInsets.only(left: 8.0),
//         child: Icon(
//           Icons.error_rounded,
//           color: Colors.white,
//           size: 30,
//         ),
//       ),
//     );
//   }

//   // --------------------------------------------------------------------------
//   // ⚠️ NEW: WARNING SNACKBAR
//   // --------------------------------------------------------------------------
  
//   static void warning({
//     String? title,
//     required String message,
//     Duration? duration,
//   }) async {
//     await closeAllSnackBars();

//     Get.snackbar(
//       title ?? 'Warning',
//       message,
//       titleText: _buildTitleText(title),
//       messageText: Text(message, style: _messageStyle),
//       snackStyle: SnackStyle.FLOATING,
//       duration: duration ?? defaultDuration,
//       snackPosition: SnackPosition.TOP,
//       // 👇 ADJUSTED MARGIN FOR MORE PRONOUNCED ROUNDING EFFECT
//       margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20), // Increased margins
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       maxWidth: 600,
//       backgroundColor: Colors.orange.shade800.withOpacity(0.95),
//       dismissDirection: DismissDirection.horizontal,
//       icon: const Padding(
//         padding: EdgeInsets.only(left: 8.0),
//         child: Icon(
//           Icons.warning_rounded,
//           color: Colors.white,
//           size: 30,
//         ),
//       ),
//     );
//   }

//   // --------------------------------------------------------------------------
//   // 🧹 SNACKBAR CLOSING LOGIC
//   // --------------------------------------------------------------------------

//   static Future<void> closeAllSnackBars() async {
//     if (Get.isSnackbarOpen) {
//       Get.closeAllSnackbars();
//       await Future.delayed(const Duration(milliseconds: 200));
//     }
//   }


// }