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
              icone: Icons.timer_outlined,
              titulo: "Iniciante",
              subtitulo: "Pomodoro Clássico",
              tempo: "25 / 5 min",
              descricao: "tarefas curtas",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/produtivista");
            },
            child: CardHome(
              icone: Icons.business_center_outlined,
              titulo: "Produtivista",
              subtitulo: "Regra 52 / 17",
              tempo: "52 / 17 min",
              descricao: "imersão de escritório",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/deepWork");
            },
            child: CardHome(
              icone: Icons.psychology_outlined,
              titulo: "Deep Work",
              subtitulo: "Mestre do Foco",
              tempo: "90 / 30 min",
              descricao: "trabalho profundo",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/livre");
            },
            child: CardHome(
              icone: Icons.all_inclusive_outlined,
              titulo: "Livre",
              subtitulo: "Cronômetro aberto",
              tempo: "sem pausa",
              descricao: "até pausar",
            ),
          ),
        ],
      ),
    );
  }
}
