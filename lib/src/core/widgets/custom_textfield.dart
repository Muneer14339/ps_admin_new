import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';

import '../theme/theme_data/theme_data.dart';
import 'modified_container.dart';

// class CustomTextField extends StatelessWidget {
//   final String? hintText;
//   final String? labelText;
//   final int? maxLines;
//   final TextEditingController controller;
//   final bool isRequired;
//   final bool? isShots;
//   final bool? numericKeyBoard;
//   final ValueChanged<String>? onChanged;

//   const CustomTextField({
//     super.key,
//     this.hintText,
//     required this.controller,
//     this.isRequired = false,
//     this.maxLines,
//     this.isShots,
//     this.numericKeyBoard,
//     this.onChanged,
//     this.labelText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => TextFieldCubit(),
//       child: BlocBuilder<TextFieldCubit, String?>(
//         builder: (context, errorMessage) {
//           return Column(

//             children: [
//               TextFormField(
//                 keyboardType: (numericKeyBoard ?? false)
//                     ? TextInputType.number
//                     : null,
//                 inputFormatters: (isShots ?? false)
//                     ? [
//                         FilteringTextInputFormatter.digitsOnly,
//                         LengthLimitingTextInputFormatter(2),
//                       ]
//                     : null,
//                 controller: controller,
//                 onChanged: (value) {

//                   if (isRequired) {
//                     context.read<TextFieldCubit>().validate(value);
//                   }
//                   if (onChanged != null) {
//                     onChanged!(value);
//                   }
//                 },
//                 maxLines: maxLines ?? 1,
//                 style: TextStyle(
//                   color: AppColors.greyTextColor,
//                   fontSize: 14.sp,
//                   fontFamily: AppFontFamily.regular,
//                 ),
//                 decoration: InputDecoration(
//                   alignLabelWithHint: true,
//                   filled: true,
//                   fillColor: AppColors.greyTextfieldBack,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                   hintText: hintText,
//                   hintStyle: TextStyle(
//                     color: AppColors.greyTextColor,
//                     fontSize: 14.sp,
//                     fontFamily: AppFontFamily.regular,
//                   ),
//                   labelText: labelText,
//                   labelStyle: TextStyle(
//                     color: AppColors.greyTextColor,
//                     fontSize: 14.sp,
//                     fontFamily: AppFontFamily.regular,
//                   ),
//                 ),
//               ),
//               if (errorMessage != null) ...[
//                 SizedBox(height: 4.h),
//                 Text(
//                   errorMessage,
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 12.sp,
//                   ),
//                 ),
//               ],
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';// import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';

class CustomTextFieldOld extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController controller;
  final bool isRequired;
  final bool? isShots;
  final bool isReadOnly;
  final bool? numericKeyBoard;
  final ValueChanged<String>? onChanged;
  final void Function()? onTap;

  const CustomTextFieldOld({
    super.key,
    this.hintText,
    required this.controller,
    this.isRequired = false,
    this.isReadOnly = false,
    this.maxLines,
    this.maxLength,
    this.isShots,
    this.numericKeyBoard,
    this.onChanged,
    this.labelText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          (numericKeyBoard != null && true) ? TextInputType.number : null,
      inputFormatters: (isShots != null && true)
          ? [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ]
          : null,
      controller: controller,
      validator: isRequired
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Required field';
              }
              return null;
            }
          : null,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: AppTheme.textPrimary(context),
      ),

      // TextStyle(
      //     color: AppColors.black,
      //     fontSize: 14.sp,
      //     fontFamily: AppFontFamily.regular),
      onChanged: onChanged,
      onTap: onTap,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        counterText: '',
        alignLabelWithHint: true,
        filled: true,
        fillColor: AppTheme.background(context),

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide.none),
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppTheme.textSecondary(context),
            fontSize: 14.sp,
            fontFamily: AppFontFamily.regular),
        labelText: labelText,
        labelStyle: TextStyle(
            color: AppTheme.textSecondary(context),
            fontSize: 14.sp,
            fontFamily: AppFontFamily.regular),
      ),
    );
  }
}


class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            style:  TextStyle(
              color:AppTheme.textPrimary(context),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextField(
          style:  TextStyle(color: AppTheme.textPrimary(context)),
          controller: controller,
          maxLines: maxLines,
          decoration: AppDecorations.inputDecoration(
            context: context,

            hint: hint.isNotEmpty ? "e.g., $hint" : "",
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class CustomSelectableField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const CustomSelectableField({
    Key? key,
    required this.label,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            label,
            style:  TextStyle(
              color:AppTheme.textPrimary(context),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color:AppTheme.background(context),
              border: Border.all(color: AppTheme.textPrimary(context)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style:  TextStyle(color: AppTheme.textPrimary(context)),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: AppTheme.textPrimary(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
