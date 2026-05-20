import 'package:flutter/material.dart';
import 'package:startfocus/app/theme/cores_app.dart';
import 'package:startfocus/app/theme/estilo_texto_app.dart';

class CabecalhoTimer extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const CabecalhoTimer({
    super.key,
    required this.titulo,
    required this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/logo.png",
                height: 65,
                width: 65,
              ),
            ),

            SizedBox(width: 8),

            Text(
              "Star",
              style: TextStyle(
                color: AppColors.textoPrincipal,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Focus",
              style: TextStyle(
                color: AppColors.detalheVerdeEletrico,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        SizedBox(height: 8),

        Row(
          children: [
            Column(
              children: [
                Text(titulo, style: AppTextStyle.titulo),
                Text(subtitulo, style: AppTextStyle.subTitulo),
              ],
            ),

            Spacer(),

            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.borda,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.repeat, color: AppColors.detalheVerdeEletrico),
                    SizedBox(width: 4),
                    Text(
                      "Alterar modo",
                      style: TextStyle(
                        color: AppColors.textoPrincipal,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
