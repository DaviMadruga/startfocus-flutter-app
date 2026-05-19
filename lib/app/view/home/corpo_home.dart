import 'package:flutter/material.dart';
import 'package:startfocus/app/view/home/card_home.dart';

class CorpoHome extends StatelessWidget {
  const CorpoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/pomodoro");
            },
            child: CardHome(
              icon: Icons.timer_outlined,
              titulo: "Iniciante",
              subtitulo: "Pomodoro Clássico",
              timer: "25 / 5 min",
              descricao: "tarefas curtas",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/produtivista");
            },
            child: CardHome(
              icon: Icons.business_center_outlined,
              titulo: "Produtivista",
              subtitulo: "Regra 52 / 17",
              timer: "52 / 17 min",
              descricao: "imersão de escritório",
            ),
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
    );
  }
}
