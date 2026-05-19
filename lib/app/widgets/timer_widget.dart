import 'package:flutter/material.dart';
import 'package:startfocus/app/theme/app_colors.dart';
import 'package:startfocus/app/theme/app_text_style.dart';
import 'package:startfocus/app/view_model/timer_view_model.dart';

class TimerWidget extends StatefulWidget {
  final int initialMinutes;

  const TimerWidget({super.key, required this.initialMinutes});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final timerViewModel = TimerViewModel();
  final isPausedNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timerViewModel.stopTime();
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
                animation: timerViewModel,
                builder: (context, child) {
                  final duration = timerViewModel.duration;
                  return Text(
                    "${duration.inMinutes.toString().padLeft(2, "0")}:${(duration.inSeconds % 60).toString().padLeft(2, "0")}",
                    style: TextStyle(
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

        SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          height: 56,
          child: ListenableBuilder(
            listenable: timerViewModel,
            builder: (context, child) {
              bool isPlaying = timerViewModel.isPlaying;
              return ElevatedButton(
                onPressed: () {
                  if (isPlaying) {
                    timerViewModel.stopTime();
                  } else {
                    timerViewModel.startTimer(
                      widget.initialMinutes,
                      isPausedNotifier,
                    );
                  }
                  isPausedNotifier.value = false;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPlaying
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
                      isPlaying ? Icons.stop : Icons.play_arrow,
                      color: AppColors.textoPrincipal,
                      size: 32,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      isPlaying ? "Parar" : "Iniciar",
                      style: AppTextStyle.titulo,
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListenableBuilder(
              listenable: timerViewModel,
              builder: (context, child) {
                bool isPlaying = timerViewModel.isPlaying;
                return ElevatedButton(
                  onPressed: () {},
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
                        Icon(Icons.refresh, size: 24),
                        SizedBox(width: 12),
                        Text("Reiniciar", style: AppTextStyle.titulo),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(width: 16),
            ListenableBuilder(
              listenable: timerViewModel,
              builder: (context, child) {
                bool isPlaying = timerViewModel.isPlaying;
                return ElevatedButton(
                  onPressed: () {},
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
                        Icon(Icons.skip_next, size: 24),
                        SizedBox(width: 12),
                        Text("Pular", style: AppTextStyle.titulo),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),

        SizedBox(height: 16),

        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.fundoCard,
            borderRadius: BorderRadius.circular(16),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Icon(
                  Icons.coffee_outlined,
                  size: 48,
                  color: AppColors.detalheVerdeEletrico,
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Text("Próxima pausa", style: AppTextStyle.subTitulo),
                    SizedBox(height: 4),
                    Text("5 min", style: AppTextStyle.titulo),
                    SizedBox(height: 4),
                    Text("Pausa curta", style: AppTextStyle.subTitulo),
                  ],
                ),
                SizedBox(width: 8),
                VerticalDivider(
                  color: AppColors.detalheCinzaAzulado,
                  thickness: 2,
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Text("Foco restante:", style: AppTextStyle.subTitulo),
                    SizedBox(height: 4),
                    Text(
                      "25:00",
                      style: TextStyle(
                        color: AppColors.detalheVerdeEletrico,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 16,),

        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.fundoCard,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sessão total:",
                style: TextStyle(
                  color: AppColors.textoSecundario,
                  fontSize: 24,
                ),
              ),
              SizedBox(width: 16,),
              Text(
                "1 / 4 Ciclos",
                style: TextStyle(
                  color: AppColors.detalheVerdeEletrico,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
