import 'package:flutter/material.dart';
import 'package:prodi/src/widgets/spacing.dart';

import '../core/constants/colors.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final bool? filled;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxlength;
  final InputBorder? border;
  // final String? title;
  final String? label;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final void Function(String)? onChanged;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final bool? enabled;
  final Widget? input;
  final Function(String?)? onSaved;
  final String? intial;

  const AppTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.maxLines,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.borderColor,
    this.textColor = Colors.black87,
    this.filled,
    this.input,
    this.maxlength,
    this.border,
    // this.title,
    this.height,
    this.enabled,
    this.onSaved,
    this.intial,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: intial,
      onSaved: onSaved,
      controller: controller,
      style: TextStyle(
          color: textColor, fontSize: responsive16(context), height: height),
      onChanged: onChanged,
      maxLines: maxLines ?? 1,
      validator: validator,
      keyboardType: keyboardType,
      enabled: enabled,
      textInputAction: textInputAction ?? TextInputAction.next,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          // filled: true,
          fillColor: const Color(0xFFE4ECF1),
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.grey, fontSize: responsive10(context)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.all(responsive16(context)),
          border: const OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? const Color(0xFFE4ECF1), width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? AppColors.primaryColor),
            borderRadius: BorderRadius.circular(5),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          labelText: label),
    );
  }
}

class AppSearchTextField extends StatelessWidget {
  final String? hintText;
  final bool? filled;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxlength;
  final InputBorder? border;
  // final String? title;
  final String? label;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onComplete;

  final void Function(String)? onChanged;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final bool? enabled;
  final Widget? input;
  final Function(String?)? onSaved;
  final String? intial;

  const AppSearchTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.maxLines,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.borderColor,
    this.textColor = AppColors.dark,
    this.filled,
    this.input,
    this.maxlength,
    this.border,
    // this.title,
    this.height,
    this.enabled,
    this.onSaved,
    this.intial,
    this.prefixIcon,
    this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: intial,
      onSaved: onSaved,
      controller: controller,
      style: TextStyle(
          color: textColor, fontSize: responsive16(context), height: height),
      onChanged: onChanged,
      maxLines: maxLines ?? 1,
      validator: validator,
      keyboardType: keyboardType,
      enabled: enabled,
      textInputAction: textInputAction ?? TextInputAction.next,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFE4ECF1),
          hintText: hintText,
          labelStyle: TextStyle(color: AppColors.dark, fontSize: 18),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.all(responsive10(context)),
          border: const OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          labelText: label),
    );
  }
}
