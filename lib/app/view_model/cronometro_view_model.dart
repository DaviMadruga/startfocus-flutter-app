import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchViewModel extends ChangeNotifier {
  Timer? _timer;
  Duration tempoDecorrido = Duration.zero;
  bool estaEmExecucao = false;
  bool estaPausado = false;

  void iniciar() {
    if (_timer != null) return;

    estaEmExecucao = true;
    estaPausado = false;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      tempoDecorrido += const Duration(seconds: 1);
      notifyListeners();
    });
  }

  void pausar() {
    _timer?.cancel();
    _timer = null;
    estaEmExecucao = false;
    estaPausado = true;
    notifyListeners();
  }

  void continuar() {
    if (_timer != null) return;
    iniciar();
  }

  void zerar() {
    _timer?.cancel();
    _timer = null;
    tempoDecorrido = Duration.zero;
    estaEmExecucao = false;
    estaPausado = false;
    notifyListeners();
  }

  void descartarTimer() {
    _timer?.cancel();
    _timer = null;
    estaEmExecucao = false;
    estaPausado = false;
  }
}
