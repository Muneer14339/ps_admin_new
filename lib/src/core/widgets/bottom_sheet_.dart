import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import '../utils/utils.dart';
// ignore: must_be_immutable

/*
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet(
      {required this.children,
      this.height,
      this.initialHeight,
      this.title,
      this.paddding,
      this.formKey,
      super.key});
  final List<Widget> children;
  final Key? formKey;
  final double? height, initialHeight;
  final String? title;
  final EdgeInsets? paddding;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0.001),
      child: DraggableScrollableSheet(
        initialChildSize: initialHeight ?? height ?? 0.80,
        minChildSize: 0.2,
        maxChildSize: height ?? 0.90,
        builder: (_, controller) {
          return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ModifiedContainer(
                    color: Theme.of(context).primaryColor,
                    borderRadius: 8.h,
                    height: 6.h,
                    width: 60.h,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  Text(title ?? '', style: latoStyle()),
                  Flexible(
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        padding: paddding ?? hPadding,
                        controller: controller,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: children),
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}

*/

// class AppBottomSheet extends StatefulWidget {
//   const AppBottomSheet(
//       {required this.children,
//       this.height,
//       this.initialHeight,
//       this.title,
//       this.paddding,
//       this.formKey,
//       super.key});

//   final List<Widget> children;
//   final Key? formKey;
//   final double? height, initialHeight;
//   final String? title;
//   final EdgeInsets? paddding;

//   @override
//   State<AppBottomSheet> createState() => _AppBottomSheetState();
// }

// class _AppBottomSheetState extends State<AppBottomSheet> {
//   late DraggableScrollableController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = DraggableScrollableController();
//     // Add focus listener for when the keyboard is activated
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _addFocusListeners();
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _addFocusListeners() {
//     for (var child in widget.children) {
//       if (child is SigninTextfield || child is FocusableActionDetector) {
//         FocusScope.of(context).children.forEach((focusNode) {
//           focusNode.addListener(() {
//             if (focusNode.hasFocus) {
//               // Expand the bottom sheet when a TextField is focused
//               _scrollController.animateTo(
//                 widget.height ?? 0.9,
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeInOut,
//               );
//             }
//           });
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color.fromRGBO(0, 0, 0, 0.001),
//       child: DraggableScrollableSheet(
//         controller: _scrollController,
//         initialChildSize: widget.initialHeight ?? widget.height ?? 0.80,
//         minChildSize: 0.2,
//         maxChildSize: widget.height ?? 0.90,
//         builder: (_, controller) {
//           return Container(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(25.0),
//                 topRight: Radius.circular(25.0),
//               ),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ModifiedContainer(
//                   color: Theme.of(context).primaryColor,
//                   borderRadius: 8.h,
//                   height: 6.h,
//                   width: 60.h,
//                   margin: const EdgeInsets.symmetric(vertical: 8),
//                 ),
//                 Text(widget.title ?? '',
//                     style: TextStyle(
//                         color: AppColors.blackTextColor,
//                         fontFamily: AppFontFamily.regular,
//                         fontSize: 14.sp)),
//                 Flexible(
//                   child: Form(
//                     key: widget.formKey,
//                     child: SingleChildScrollView(
//                       padding: widget.paddding ?? hPadding,
//                       controller: controller,
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: widget.children),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class AppBottomSheet extends StatefulWidget {
  const AppBottomSheet(
      {required this.children,
      this.height,
      this.initialHeight,
      this.title,
      this.paddding,
      this.formKey,
      this.scrollWidget,
      super.key});

  final List<Widget> children;
  final Key? formKey;
  final double? height, initialHeight;
  final String? title;
  final EdgeInsets? paddding;
  final Widget? scrollWidget;

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  late DraggableScrollableController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = DraggableScrollableController();
    // Add focus listener for when the keyboard is activated
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addFocusListeners();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _addFocusListeners() {
    for (var child in widget.children) {
      log('child: ${widget.scrollWidget} -- ${widget.scrollWidget.runtimeType} -- ${child.runtimeType == widget.scrollWidget.runtimeType}');
      if (child.runtimeType == widget.scrollWidget.runtimeType ||
          child is FocusableActionDetector) {
        FocusScope.of(context).children.forEach((focusNode) {
          focusNode.addListener(() {
            if (focusNode.hasFocus) {
              // Expand the bottom sheet when a TextField is focused
              _scrollController.animateTo(
                widget.height ?? 0.9,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0.001),
      child: DraggableScrollableSheet(
        controller: _scrollController,
        initialChildSize: widget.initialHeight ?? widget.height ?? 0.80,
        minChildSize: 0.2,
        maxChildSize: widget.height ?? 0.90,
        builder: (_, controller) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ModifiedContainer(
                  color: Theme.of(context).primaryColor,
                  borderRadius: 8.h,
                  height: 6.h,
                  width: 60.h,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                ),
                Text(widget.title ?? '',
                    style: TextStyle(
                        color: AppColors.blackTextColor,
                        fontFamily: AppFontFamily.regular,
                        fontSize: 14.sp)),
                Flexible(
                  child: Form(
                    key: widget.formKey,
                    child: SingleChildScrollView(
                      padding: widget.paddding ?? hPadding,
                      controller: controller,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.children),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AppBottomSheetWidget extends StatelessWidget {
  const AppBottomSheetWidget(
      {required this.child, this.height, this.formKey, this.title, super.key});
  final Widget child;
  final Key? formKey;
  final double? height;
  final String? title;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
        color: const Color.fromRGBO(0, 0, 0, 0.001),
        child: DraggableScrollableSheet(
            initialChildSize: height ?? 0.90,
            minChildSize: 0.2,
            maxChildSize: height ?? 0.90,
            builder: (_, controller) {
              return Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ModifiedContainer(
                        color: Theme.of(context).primaryColor,
                        borderRadius: 8.h,
                        height: 6.h,
                        width: 60.h,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      Text(
                        title ?? '',
                        style: TextStyle(
                            fontFamily: AppFontFamily.regular, fontSize: 14),
                      ),
                      Flexible(child: child),
                    ],
                  ));
            }));
  }
}
