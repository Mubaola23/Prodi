import 'package:flutter/material.dart';
import 'package:prodi/src/widgets/spacing.dart';

import '../core/constants/app_textstyles.dart';
import '../core/constants/colors.dart';

class AppDropdown extends StatelessWidget {
  final List<String>? items;
  final String? hintText;
  final Widget? suffixIcon;
  final String? errorText;
  final String? value;
  final Color? borderColor;
  final String? labelText;
  final TextEditingController? controller;
  final void Function(String?) onChanged;
  final String Function(String?) validator;

  const AppDropdown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.labelText,
    this.borderColor,
    this.suffixIcon,
    this.errorText,
    this.hintText,
    this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      items: items?.map(
        (String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: heading4(context),
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ).toList(),
      onChanged: onChanged,
      style: heading2(context),
      value: value,
      validator: validator,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: AppColors.dark,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(color: AppColors.dark, fontSize: responsive14(context)),
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: heading2(context),
        border: InputBorder.none,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900, width: 1),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.primaryColor,
            width: 2,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
