import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';

class StageSection extends StatefulWidget {
  final String title;

  final Widget iconWidget;
  final String selectionText;
  final bool isDropdown;
  final bool isDropDownOpen;
  final VoidCallback? onTap;

  final List<String>? dropdownItems;
  const StageSection(
      {super.key,
      required this.title,
      required this.selectionText,
      this.onTap,
      this.isDropdown = false,
      this.isDropDownOpen = false,
      required this.iconWidget,
      this.dropdownItems});

  @override
  State<StageSection> createState() => _StageSectionState();
}

class _StageSectionState extends State<StageSection> {
  @override
  void initState() {
    super.initState();
    if (widget.dropdownItems != null && widget.dropdownItems!.isNotEmpty) {
      selectedValue = widget.dropdownItems!.first;
    }
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return ModifiedContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      onTap: widget.onTap,
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(
              color: Theme.of(context).highlightColor,
              width: 1.0.h), // Grey outline
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
          child: Row(
            children: [
              widget.iconWidget,
              SizedBox(width: 15.w),
              Text(widget.title,
                  style: TextStyle(
                      letterSpacing: 0.6.w,
                      fontFamily: AppFontFamily.bold,
                      fontSize: 14.sp)),
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 100.w, minWidth: 70.w),
                child: Text(
                  textAlign: TextAlign.end,
                  widget.selectionText,
                  style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontFamily: AppFontFamily.regular,
                      fontSize: 12.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8.w),
              if (!widget.isDropdown) ...[
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 17.w,
                ),
              ] else ...[
                widget.isDropDownOpen
                    ? Transform.rotate(
                        angle: -1.57, // Rotate 90 degrees (π/2 radians)
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          // color: AppColors.black,
                          size: 17.w,
                        ),
                      )
                    : Transform.rotate(
                        angle: 1.57, // Rotate 90 degrees (π/2 radians)
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          // color: AppColors.black,
                          size: 17.w,
                        ),
                      ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
