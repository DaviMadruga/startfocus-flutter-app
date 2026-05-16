import 'package:flutter/material.dart';
import 'package:startfocus/app/pages/home_page.dart';
import 'package:startfocus/app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StartFocus",
      theme: AppTheme.appTheme,
      home: HomePage(),
    );
  }
}