import 'package:flutter/material.dart';
import 'package:startfocus/app/view/pages/trabalho_profundo_page.dart';
import 'package:startfocus/app/view/pages/inicio_page.dart';
import 'package:startfocus/app/view/pages/tempo_livre_page.dart';
import 'package:startfocus/app/view/pages/pomodoro_classico_page.dart';
import 'package:startfocus/app/theme/tema_app.dart';
import 'package:startfocus/app/view/pages/regra_produtivista_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StartFocus",
      theme: AppTheme.temaAplicacao,
      routes: {
        "/home": (context) => HomePage(),
        "/pomodoro": (context) => PomodoroPage(),
        "/produtivista": (context) => ProdutivistaPage(),
        "/deepWork": (context) => DeepWorkPage(),
        "/livre": (context) => LivrePage(),
      },
      initialRoute: "/home",
    );
  }
}
