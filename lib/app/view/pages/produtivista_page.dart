import 'package:flutter/material.dart';
import 'package:startfocus/app/view/widgets_view/cabecalho_timer.dart';
import 'package:startfocus/app/widgets/timer_widget.dart';

class ProdutivistaPage extends StatelessWidget {
  const ProdutivistaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              CabecalhoTimer(
                titulo: "Produtivista",
                subtitulo: "Regra 52/17",
              ),
              SizedBox(height: 16),
              TimerWidget(
                initialMinutes: 52,
                pausedMinutes: 17,
                maximumCycles: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
