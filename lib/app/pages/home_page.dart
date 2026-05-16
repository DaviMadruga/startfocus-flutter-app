import 'package:flutter/material.dart';
import 'package:startfocus/widgets/home/cabecalho_home.dart';
import 'package:startfocus/widgets/home/card_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CabecalhoHome(),
              SizedBox(height: 16,),
              Flexible(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.95,
                  children: [
                    CardHome(
                      icon: Icons.timer_outlined,
                      titulo: "Iniciante",
                      subtitulo: "Pomodoro Clássico",
                      timer: "25 / 5 min",
                      descricao: "tarefas curtas",
                    ),
                    CardHome(
                      icon: Icons.business_center_outlined,
                      titulo: "Produtivista",
                      subtitulo: "Regra 52 / 17",
                      timer: "52 / 17 min",
                      descricao: "imersão de escritório",
                    ),
                    CardHome(
                      icon: Icons.psychology_outlined,
                      titulo: "Deep Work",
                      subtitulo: "Mestre do Foco",
                      timer: "90 - 120 min",
                      descricao: "trabalho profundo",
                    ),
                    CardHome(
                      icon: Icons.flag_outlined,
                      titulo: "Só Começar",
                      subtitulo: "Apoio Psicológico",
                      timer: "5 ou 10 min",
                      descricao: "vença a procrastinação",
                    ),
                    CardHome(
                      icon: Icons.hourglass_empty,
                      titulo: "Flow",
                      subtitulo: "Modo Flowtime",
                      timer: "pausa 20%",
                      descricao: "ritmo flexível",
                    ),
                    CardHome(
                      icon: Icons.all_inclusive_outlined,
                      titulo: "Livre",
                      subtitulo: "Cronômetro aberto",
                      timer: "sem pausa",
                      descricao: "até pausar",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
