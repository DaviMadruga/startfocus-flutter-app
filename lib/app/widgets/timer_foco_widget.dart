import 'package:flutter/material.dart';
import 'package:startfocus/app/theme/cores_app.dart';
import 'package:startfocus/app/theme/estilo_texto_app.dart';
import 'package:startfocus/app/view_model/timer_foco_view_model.dart';

class FocusTimerWidget extends StatefulWidget {
  final int minutosIniciais;
  final int minutosPausa;
  final int maximoCiclos;

  const FocusTimerWidget({
    super.key,
    required this.minutosIniciais,
    required this.minutosPausa,
    required this.maximoCiclos,
  });

  @override
  State<FocusTimerWidget> createState() => _FocusTimerWidgetState();
}

class _FocusTimerWidgetState extends State<FocusTimerWidget> {
  final modeloTimer = FocusTimerViewModel();

  @override
  void initState() {
    super.initState();
    _configurarTimer();
  }

  @override
  void didUpdateWidget(covariant FocusTimerWidget widgetAntigo) {
    super.didUpdateWidget(widgetAntigo);

    if (widgetAntigo.minutosIniciais != widget.minutosIniciais ||
        widgetAntigo.minutosPausa != widget.minutosPausa ||
        widgetAntigo.maximoCiclos != widget.maximoCiclos) {
      _configurarTimer();
    }
  }

  @override
  void dispose() {
    modeloTimer.pararTempo();
    super.dispose();
  }

  void _configurarTimer() {
    modeloTimer.configurar(
      minutosFoco: widget.minutosIniciais,
      minutosPausa: widget.minutosPausa,
      maximoCiclos: widget.maximoCiclos,
    );
  }

  String _formatarDuracao(Duration duracao) {
    return "${duracao.inMinutes.toString().padLeft(2, "0")}:${(duracao.inSeconds % 60).toString().padLeft(2, "0")}";
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
              AnimatedBuilder(
                animation: modeloTimer,
                builder: (context, child) {
                  return Text(
                    _formatarDuracao(modeloTimer.duracao),
                    style: const TextStyle(
                      fontSize: 72,
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
            listenable: modeloTimer,
            builder: (context, child) {
              final estaEmExecucao = modeloTimer.estaEmExecucao;

              return ElevatedButton(
                onPressed: () {
                  if (modeloTimer.estaEmExecucao) {
                    modeloTimer.pausarTimer();
                  } else if (modeloTimer.estaPausado) {
                    modeloTimer.continuarTimer();
                  } else {
                    modeloTimer.iniciarTimer();
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
                      modeloTimer.estaEmExecucao
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: AppColors.textoPrincipal,
                      size: 32,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      modeloTimer.estaEmExecucao
                          ? "Pausar"
                          : modeloTimer.estaPausado
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: modeloTimer.reiniciarTempo,
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
                    Text("Reiniciar", style: AppTextStyle.titulo),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: modeloTimer.pularCiclo,
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
                    const Icon(Icons.skip_next, size: 24),
                    const SizedBox(width: 8),
                    Text("Pular", style: AppTextStyle.titulo),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.fundoCard,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListenableBuilder(
            listenable: modeloTimer,
            builder: (context, child) {
              final minutosFaseAtual = modeloTimer.minutosFaseAtual;
              final minutosProximaFase = modeloTimer.minutosProximaFase;

              return IntrinsicHeight(
                child: Row(
                  children: [
                    Icon(
                      modeloTimer.estaEmPausa
                          ? Icons.self_improvement_outlined
                          : Icons.coffee_outlined,
                      size: 48,
                      color: AppColors.detalheVerdeEletrico,
                    ),
                    Column(
                      children: [
                        Text(
                          modeloTimer.rotuloProximaFase,
                          style: AppTextStyle.subTitulo,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "$minutosProximaFase min",
                          style: AppTextStyle.titulo,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          modeloTimer.estaEmPausa
                              ? "Voltando ao foco"
                              : "Pausa curta",
                          style: AppTextStyle.subTitulo,
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    VerticalDivider(
                      color: AppColors.detalheCinzaAzulado,
                      thickness: 2,
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          "${modeloTimer.rotuloFaseAtual}: ",
                          style: AppTextStyle.subTitulo,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${minutosFaseAtual.toString().padLeft(2, "0")}:00",
                          style: TextStyle(
                            color: AppColors.detalheVerdeEletrico,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
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
              Text(
                "Sessão total:",
                style: TextStyle(
                  color: AppColors.textoSecundario,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              ListenableBuilder(
                listenable: modeloTimer,
                builder: (context, child) {
                  final atingiuLimiteDeCiclos =
                      modeloTimer.ciclosConcluidos >= modeloTimer.maximoCiclos;

                  return Text(
                    atingiuLimiteDeCiclos
                        ? "Sessão concluída"
                        : "${modeloTimer.ciclosConcluidos} / ${modeloTimer.maximoCiclos} Ciclos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.detalheVerdeEletrico,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
