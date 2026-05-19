import 'package:flutter/material.dart';
import 'package:startfocus/app/view/pages/home_page.dart';
import 'package:startfocus/app/view/pages/pomodoro_page.dart';
import 'package:startfocus/app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StartFocus",
      theme: AppTheme.appTheme,
      routes: {
        "/home" : (context) => HomePage(),
        "/pomodoro" : (context) => PomodoroPage(),
      },
      initialRoute: "/home",
    );
  }
}