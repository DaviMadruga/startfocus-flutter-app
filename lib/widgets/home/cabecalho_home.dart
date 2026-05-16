import 'package:flutter/material.dart';
import 'package:startfocus/app/theme/app_colors.dart';
import 'package:startfocus/app/theme/app_text_style.dart';

class CabecalhoHome extends StatelessWidget {
  const CabecalhoHome({super.key});

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
                height: 100, 
                width: 100
              ),
            ),

            SizedBox(width: 8,),

            Text(
              "Star", 
              style: TextStyle(
                color: AppColors.textoPrincipal,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              )
            ),
            Text(
              "Focus", 
              style: TextStyle(
                color: AppColors.detalheVerdeEletrico,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              )
            ),
          ],
        ),

        SizedBox(height: 12,),

        Text(
          "Escolha seu nomo de foco",
          style: AppTextStyle.subTitulo,
        ),
      ],
    );
  }
}
