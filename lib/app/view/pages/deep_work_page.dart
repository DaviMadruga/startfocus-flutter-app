import 'package:flutter/material.dart';
import 'package:startfocus/app/view/widgets_view/cabecalho_timer.dart';
import 'package:startfocus/app/widgets/timer_widget.dart';

class DeepWorkPage extends StatelessWidget {
  const DeepWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              CabecalhoTimer(
                titulo: "Deep Work", 
                subtitulo: "Mestre do Foco",
              ),
              SizedBox(height: 16,),
              TimerWidget(
                initialMinutes: 90, 
                pausedMinutes: 30, 
                maximumCycles: 2,
              ),
            ],
          ), 
        ),
      ),
    );
  }
}