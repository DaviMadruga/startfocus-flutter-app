import 'package:flutter/material.dart';
import 'package:startfocus/app/theme/cores_app.dart';
import 'package:startfocus/app/theme/estilo_texto_app.dart';
import 'package:startfocus/app/view_model/cronometro_view_model.dart';

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({super.key});

  @override
  State<StopwatchWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  final modeloCronometro = StopwatchViewModel();

  @override
  void dispose() {
    modeloCronometro.descartarTimer();
    super.dispose();
  }

  String _formatarDuracao(Duration duracao) {
    final horas = duracao.inHours.toString().padLeft(2, "0");
    final minutos = (duracao.inMinutes % 60).toString().padLeft(2, "0");
    final segundos = (duracao.inSeconds % 60).toString().padLeft(2, "0");

    return "$horas:$minutos:$segundos";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.fundoCard,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.borda, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Tempo decorrido", style: AppTextStyle.subTitulo),
              const SizedBox(height: 8),
              AnimatedBuilder(
                animation: modeloCronometro,
                builder: (context, child) {
                  return Text(
                    _formatarDuracao(modeloCronometro.tempoDecorrido),
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'monospace',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ListenableBuilder(
            listenable: modeloCronometro,
            builder: (context, child) {
              final estaEmExecucao = modeloCronometro.estaEmExecucao;

              return ElevatedButton(
                onPressed: () {
                  if (modeloCronometro.estaEmExecucao) {
                    modeloCronometro.pausar();
                  } else if (modeloCronometro.estaPausado) {
                    modeloCronometro.continuar();
                  } else {
                    modeloCronometro.iniciar();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: estaEmExecucao
                      ? Colors.red
                      : AppColors.detalheVerdeEletrico,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      modeloCronometro.estaEmExecucao
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: AppColors.textoPrincipal,
                      size: 32,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      modeloCronometro.estaEmExecucao
                          ? "Pausar"
                          : modeloCronometro.estaPausado
                          ? "Continuar"
                          : "Iniciar",
                      style: AppTextStyle.titulo,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: modeloCronometro.zerar,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.fundoCard,
              foregroundColor: AppColors.textoPrincipal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.refresh, size: 24),
                  const SizedBox(width: 8),
                  Text("Zerar", style: AppTextStyle.titulo),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.fundoCard,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Text("Modo livre", style: AppTextStyle.titulo),
              const SizedBox(height: 8),
              Text(
                "Conte seu tempo sem pausas automáticas ou ciclos.",
                textAlign: TextAlign.center,
                style: AppTextStyle.subTitulo,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
