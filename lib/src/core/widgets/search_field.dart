import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {required this.controller,
      this.hintText,
      this.validationText,
      this.suffixIcon,
      this.prefixIcon,
      this.keyBoardType,
      this.contentPadding,
      this.labelText,
      this.width,
      this.readOnly,
      this.margin,
      this.maxLines,
      this.onTap,
      this.textStyle,
      this.onChanged,
      super.key});
  final double? width;
  final TextEditingController controller;
  final String? validationText, hintText, labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyBoardType;
  final bool? readOnly;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final int? maxLines;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationText;
        }
        if (hintText == 'Phone Number') {
          if (value.length < 10) {
            return 'Phone number must have at least 10 digits';
          }
        }
        return null;
      },
      style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
      keyboardType: keyBoardType,
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      onChanged: onChanged,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        // fillColor: AppColors.white,

        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        hintText: hintText ?? labelText,
        hintStyle: TextStyle(color: AppColors.greyTextColor),
        labelStyle: const TextStyle(color: Colors.black45),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon ?? const Icon(Icons.search_rounded, size: 30),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}
