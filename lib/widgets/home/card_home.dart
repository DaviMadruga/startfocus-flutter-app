import 'package:flutter/material.dart';
import 'package:startfocus/app/theme/app_colors.dart';
import 'package:startfocus/app/theme/app_text_style.dart';

class CardHome extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final String timer;
  final String descricao;

  const CardHome({
    super.key,
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    required this.timer,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.fundoCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.borda,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 35,
            color: AppColors.detalheVerdeEletrico,
          ),

          const SizedBox(height: 8,),

          Text(
            titulo,
            style: AppTextStyle.titulo,
          ),

          const SizedBox(height: 2,),

          Text(
            subtitulo,
            style: AppTextStyle.subTitulo,
          ),

          const SizedBox(height: 8,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.borda,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              timer,
              style: TextStyle(
                color: AppColors.detalheVerdeEletrico,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 8,),

          Text(
            descricao,
            style: TextStyle(
              color: AppColors.textoSecundario,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}