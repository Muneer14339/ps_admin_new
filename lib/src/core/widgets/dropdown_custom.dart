import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

import '../theme/theme_data/theme_data.dart';

class DropdownCustom extends StatefulWidget {
  final String hint;
  final String? selectedValue;
  final VoidCallback onTap;
  final bool dropDownOpen;
  final bool? noPadding;
  final TextEditingController controller;

  const DropdownCustom({
    super.key,
    this.selectedValue,
    this.noPadding,
    required this.hint,
    required this.onTap,
    required this.controller,
    required this.dropDownOpen,
  });

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.noPadding == true ? 0 : 24.w),
      child: InkWell(
        onTap: () {
          widget.onTap();
          // context.read<TextFieldCubit>().validate(widget.controller.text);
        },
        child: TextFormField(
          controller: widget.controller,
          readOnly: true,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: AppFontFamily.regular,
            color: AppTheme.textPrimary(context),

          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required field';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.background(context),


          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 20.h),
            labelText: widget.hint,

            suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                child: Transform.rotate(
                  angle: 1.57, // Rotate 90 degrees (π/2 radians)
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    // color: AppColors.black,
                    color: AppTheme.textPrimary(context),

                    size: 18.w,
                  ),
                )),
            labelStyle: TextStyle(
              color: AppTheme.textPrimary(context),

              fontSize: 14.sp,
              fontFamily: AppFontFamily.regular,
            ),
          ),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}


class RangeDropdown extends StatelessWidget {
  final List<String> ranges;
  final String? selected;
  final bool isLoading;
  final ValueChanged<String> onChanged;

  const RangeDropdown({
    super.key,
    required this.ranges,
    required this.selected,
    required this.onChanged,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 56,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final value = (selected != null && ranges.contains(selected)) ? selected : null;

    return DropdownButtonFormField<String>(
      isExpanded: true,
      initialValue: value,
      hint:  Text('Select range',        style: TextStyle(fontSize: 14, color: AppTheme.textPrimary(context),),
      ),
      decoration: InputDecoration(
        labelText: 'Range Name',
        labelStyle: TextStyle(fontSize: 14, color: AppTheme.textPrimary(context),),
        filled: true,
        fillColor: AppTheme.background(context),
        border: OutlineInputBorder(           borderSide: BorderSide(color: AppTheme.textPrimary(context)),
        ),

        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(color: AppTheme.primary(context)),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(
        //     color: AppTheme.textSecondary(context).withOpacity(0.0),
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(color: AppTheme.primary(context)),
        // ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.error(context)),
        ),
        contentPadding: const EdgeInsets.all(12),
        suffixIcon: isLoading
            ? Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppTheme.primary(context),
            ),
          ),
        )
            : null,
      ),
      dropdownColor: AppTheme.surface(context),
      style: AppTheme.bodyMedium(context).copyWith(
        color:AppTheme.textPrimary(context).withOpacity(0.5),
      ),
      items: ranges
          .map((r) => DropdownMenuItem<String>(
        value: r,
        child: Text(r, overflow: TextOverflow.ellipsis),
      ))
          .toList(),
      onChanged: ranges.isEmpty ? null : (v) { if (v != null) onChanged(v); },
      validator: (v) => v == null ? 'Please select a range' : null,
      menuMaxHeight: 320,
    );
  }
}
class CadenceDropdown extends StatelessWidget {
  final List<int> values;
  final int? selected;
  final bool isLoading;
  final ValueChanged<int> onChanged;

  const CadenceDropdown({
    super.key,
    required this.values,
    required this.selected,
    required this.onChanged,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 56,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final value = (selected != null && values.contains(selected)) ? selected : null;

    return DropdownButtonFormField<int>(
      isExpanded: true,
      initialValue: value,
      hint:  Text('Select Cadence',        style: TextStyle(fontSize: 14, color: AppTheme.textPrimary(context),),
      ),
      decoration: InputDecoration(
        labelText: 'Cadence value',
        labelStyle: TextStyle(fontSize: 14, color: AppTheme.textPrimary(context),),
        filled: true,
        fillColor: AppTheme.background(context),
        border: OutlineInputBorder(           borderSide: BorderSide(color: AppTheme.textPrimary(context)),
        ),

        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(color: AppTheme.primary(context)),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(
        //     color: AppTheme.textSecondary(context).withOpacity(0.0),
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(color: AppTheme.primary(context)),
        // ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.error(context)),
        ),
        contentPadding: const EdgeInsets.all(12),
        suffixIcon: isLoading
            ? Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppTheme.primary(context),
            ),
          ),
        )
            : null,
      ),
      dropdownColor: AppTheme.surface(context),
      style: AppTheme.bodyMedium(context).copyWith(
        color:AppTheme.textPrimary(context).withOpacity(0.5),
      ),
      items: values
          .map((r) => DropdownMenuItem<int>(
        value: r,
        child: Text('$r', overflow: TextOverflow.ellipsis),
      ))
          .toList(),
      onChanged: values.isEmpty ? null : (v) { if (v != null) onChanged(v); },
      validator: (v) => v == null ? 'Please select a cadence value' : null,
      menuMaxHeight: 320,
    );
  }
}
