import 'package:flutter/material.dart';
import 'package:startfocus/app/view/widgets_view/cabecalho_temporizador.dart';
import 'package:startfocus/app/widgets/timer_foco_widget.dart';

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
              CabecalhoTimer(titulo: "Deep Work", subtitulo: "Mestre do Foco"),
              SizedBox(height: 16),
              FocusTimerWidget(
                minutosIniciais: 90,
                minutosPausa: 30,
                maximoCiclos: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
