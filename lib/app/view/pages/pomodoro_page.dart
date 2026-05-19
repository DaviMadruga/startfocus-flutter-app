import 'package:flutter/material.dart';
import 'package:startfocus/app/view/pomodoro/cabecalho_pomodoro.dart';
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
              CabecalhoPomodoro(),
              SizedBox(height: 24),
              TimerWidget(initialMinutes: 1),
            ],
          ),
        ),
      ),
    );
  }
}
