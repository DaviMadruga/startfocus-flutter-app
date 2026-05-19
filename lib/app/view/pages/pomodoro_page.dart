import 'package:flutter/material.dart';
import 'package:startfocus/app/view/widgets_view/cabecalho_timer.dart';
import 'package:startfocus/app/widgets/timer_widget.dart';

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
              TimerWidget(
                initialMinutes: 25,
                pausedMinutes: 5,
                maximumCycles: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
