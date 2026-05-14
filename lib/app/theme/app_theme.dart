import 'package:flutter/material.dart';
import 'package:startfocus/app/theme/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.fundoPrincipal,
    fontFamily: "Inter",
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.fundoPrincipal,
      elevation: 0,
      centerTitle: false,
    ),
  );
}