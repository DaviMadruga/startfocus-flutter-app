import 'package:flutter/material.dart';
import 'package:startfocus/app/view/widgets_view/cabecalho_temporizador.dart';
import 'package:startfocus/app/widgets/cronometro_widget.dart';

class LivrePage extends StatelessWidget {
  const LivrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              CabecalhoTimer(
                titulo: "Tempo Livre",
                subtitulo: "Cronômetro sem ciclos",
              ),
              SizedBox(height: 16),
              StopwatchWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
