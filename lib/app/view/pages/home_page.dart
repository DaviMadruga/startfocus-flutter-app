import 'package:flutter/material.dart';
import 'package:startfocus/app/view/home/cabecalho_home.dart';
import 'package:startfocus/app/view/home/corpo_home.dart';

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
              CorpoHome(),
            ],
          ),
        ),
      ),
    );
  }
}
