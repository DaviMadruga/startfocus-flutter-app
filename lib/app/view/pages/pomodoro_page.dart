import 'package:flutter/material.dart';
import 'package:startfocus/app/widgets/cabecalho_temporizador.dart';
import 'package:startfocus/app/widgets/timer_foco_widget.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            children: [
              CabecalhoTimer(
                titulo: "Iniciante",
                subtitulo: "Pomodoro Clássico",
              ),
              SizedBox(height: 16),
              FocusTimerWidget(
                minutosIniciais: 25,
                minutosPausa: 5,
                maximoCiclos: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
