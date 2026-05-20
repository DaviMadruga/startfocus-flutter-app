import 'package:flutter/material.dart';
import 'package:startfocus/app/theme/cores_app.dart';

class AppTheme {
  static ThemeData temaAplicacao = ThemeData(
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
