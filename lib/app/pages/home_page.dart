import 'package:flutter/material.dart';
import 'package:startfocus/widgets/home/cabecalho_home.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
