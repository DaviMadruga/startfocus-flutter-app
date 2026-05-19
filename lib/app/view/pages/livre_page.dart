import 'package:flutter/material.dart';
import 'package:startfocus/app/view/widgets_view/cabecalho_timer.dart';

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
                titulo: "Livre", 
                subtitulo: "Cronômetro aberto",
              ),
              SizedBox(height: 16,),
              
            ],
          ),
        ),
      ),
    );
  }
}