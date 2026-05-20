import 'dart:async';

import 'package:flutter/material.dart';

class FocusTimerViewModel extends ChangeNotifier {
  int maximoCiclos = 4;
  int minutosPausa = 5;

  bool estaEmExecucao = false;
  bool estaPausado = false;
  bool estaEmPausa = false;
  Timer? temporizador;
  Duration duracao = Duration.zero;
  int ciclosConcluidos = 0;

  int get minutosFaseAtual => estaEmPausa ? minutosPausa : _minutosFoco;
  String get rotuloFaseAtual => estaEmPausa ? "Pausa curta" : "Foco";
  String get rotuloProximaFase =>
      estaEmPausa ? "Próximo foco" : "Próxima pausa";
  int get minutosProximaFase => estaEmPausa ? _minutosFoco : minutosPausa;

  int _minutosFoco = 0;

  void configurar({
    required int minutosFoco,
    required int minutosPausa,
    required int maximoCiclos,
  }) {
    final deveNotificar =
        _minutosFoco != minutosFoco ||
        this.minutosPausa != minutosPausa ||
        this.maximoCiclos != maximoCiclos;

    _minutosFoco = minutosFoco;
    this.minutosPausa = minutosPausa;
    this.maximoCiclos = maximoCiclos;

    if (deveNotificar) {
      notifyListeners();
    }
  }

  void iniciarTimer() {
    if (temporizador != null) return;

    if (!estaPausado) {
      if (ciclosConcluidos >= maximoCiclos) {
        ciclosConcluidos = 0;
      }
      duracao = Duration.zero;
      estaEmPausa = false;
    }

    _iniciarFaseAtual();
  }

  void pausarTimer() {
    temporizador?.cancel();
    temporizador = null;
    estaEmExecucao = false;
    estaPausado = true;
    notifyListeners();
  }

  void continuarTimer() {
    if (temporizador != null) return;
    _iniciarFaseAtual();
  }

  void pararTempo() {
    temporizador?.cancel();
    temporizador = null;
    estaEmExecucao = false;
    estaPausado = false;
    notifyListeners();
  }

  void reiniciarTempo() {
    temporizador?.cancel();
    temporizador = null;
    duracao = Duration.zero;
    estaEmExecucao = false;
    estaPausado = false;
    estaEmPausa = false;
    notifyListeners();
  }

  void pularCiclo() {
    if (temporizador == null && !estaPausado && duracao == Duration.zero) {
      return;
    }

    temporizador?.cancel();
    temporizador = null;
    estaEmExecucao = false;
    estaPausado = false;

    if (estaEmPausa) {
      duracao = Duration.zero;
      estaEmPausa = false;
    } else {
      ciclosConcluidos++;
      if (ciclosConcluidos >= maximoCiclos) {
        duracao = Duration.zero;
        estaEmPausa = false;
      } else {
        _iniciarFasePausa();
        return;
      }
    }

    notifyListeners();
  }

  void _iniciarFaseAtual() {
    estaEmExecucao = true;
    estaPausado = false;
    notifyListeners();
    _executarTimer(minutosFaseAtual);
  }

  void _executarTimer(int minutosDaFase) {
    temporizador = Timer.periodic(const Duration(seconds: 1), (_) {
      if (duracao.inMinutes < minutosDaFase) {
        duracao += const Duration(seconds: 1);
        notifyListeners();
      } else {
        _concluirFaseAtual();
      }
    });
  }

  void _concluirFaseAtual() {
    temporizador?.cancel();
    temporizador = null;

    if (estaEmPausa) {
      duracao = Duration.zero;
      estaEmExecucao = false;
      estaPausado = false;
      estaEmPausa = false;
      notifyListeners();
      return;
    }

    ciclosConcluidos++;

    if (ciclosConcluidos >= maximoCiclos) {
      estaEmExecucao = false;
      estaPausado = false;
      notifyListeners();
      return;
    }

    _iniciarFasePausa();
  }

  void _iniciarFasePausa() {
    duracao = Duration.zero;
    estaEmPausa = true;
    estaEmExecucao = true;
    estaPausado = false;
    notifyListeners();
    _executarTimer(minutosPausa);
  }
}
