import 'package:flutter/material.dart';
import 'package:privilee_assesment/core/resources/app_colors.dart';
import 'package:privilee_assesment/core/resources/app_fonts.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: Fonts.niveauGrotesk,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(color: Colors.transparent),
      colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.primaryColor),
    );
  }
}
