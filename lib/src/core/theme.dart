import 'package:flutter/material.dart';

import 'constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = _themeData(_lightColorScheme);
  // static ThemeData darkTheme = _themeData(_drkColorScheme);
  // static final _darkTheme = ThemeData();

  static _themeData(ColorScheme colorScheme) => ThemeData(
        colorScheme: colorScheme,
        cursorColor: AppColors.primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: AppColors.primaryColor,
            primary: AppColors.primaryColor,
            minimumSize: const Size.fromHeight(48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      );

  //Light mode setting
  static final ColorScheme _lightColorScheme =
      const ColorScheme.light().copyWith(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    secondaryVariant: AppColors.primaryColor,
    // onBackground: AppColors.grey,
    // onSurface: AppColors.grey,
  );

  // Dark mode setting
  // static final ColorScheme _drkColorScheme = const ColorScheme.dark().copyWith(
  //   primary: AppColors.primaryColor,
  //   secondary: AppColors.primaryColor,
  //   secondaryVariant: AppColors.primaryColor,
  //   onBackground: AppColors.light,
  //   onSurface: AppColors.grey,
  // );
  static TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        headline4: TextStyle(
          // fontSize: 24,
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
        ),
        headline5: TextStyle(
          // fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
        ),
        headline6: TextStyle(
          // fontSize: 18,
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
        ),
        bodyText1: TextStyle(
          // fontSize: 14,
          fontWeight: FontWeight.w700,
          color: colorScheme.onBackground,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w600,
          // fontSize: 12,
          color: colorScheme.onBackground,
        ),
        button: TextStyle(
          // fontSize: 14,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
      );
}
