import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.turquoise,
        primary: AppColors.turquoise,
        secondary: AppColors.gold,
        surface: AppColors.ivory,
      ),
      scaffoldBackgroundColor: AppColors.ivory,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.ivory,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
