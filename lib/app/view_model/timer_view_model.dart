import 'dart:async';
import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier {
  final int maxCycles = 4;
  final int breakMinutes = 5;

  bool isPlaying = false;
  bool isPaused = false;
  bool isBreakTime = false;
  Timer? timer;
  Duration duration = Duration.zero;
  int completedCycles = 0;

  int get currentPhaseMinutes => isBreakTime ? breakMinutes : _focusMinutes;
  String get currentPhaseLabel => isBreakTime ? "Pausa curta" : "Foco";
  String get nextPhaseLabel => isBreakTime ? "Próximo foco" : "Próxima pausa";
  int get nextPhaseMinutes => isBreakTime ? _focusMinutes : breakMinutes;

  int _focusMinutes = 0;

  void startTimer(int initialMinutes) {
    if (timer != null) return;

    _focusMinutes = initialMinutes;

    if (!isPaused) {
      if (completedCycles >= maxCycles) {
        completedCycles = 0;
      }
      duration = Duration.zero;
      isBreakTime = false;
    }

    _startCurrentPhase();
  }

  void pauseTimer() {
    timer?.cancel();
    timer = null;
    isPlaying = false;
    isPaused = true;
    notifyListeners();
  }

  void resumeTimer(int initialMinutes) {
    if (timer != null) return;

    _focusMinutes = initialMinutes;
    _startCurrentPhase();
  }

  void stopTime() {
    timer?.cancel();
    timer = null;
    isPlaying = false;
    isPaused = false;
    notifyListeners();
  }

  void restarTime(int initialMinutes, ValueNotifier<bool> isPausedNotifier) {
    _focusMinutes = initialMinutes;
    timer?.cancel();
    timer = null;
    duration = Duration.zero;
    isPlaying = false;
    isPaused = false;
    isBreakTime = false;
    isPausedNotifier.value = false;
    notifyListeners();
  }

  void skipCycle(ValueNotifier<bool> isPausedNotifier) {
    if (timer == null && !isPaused && duration == Duration.zero) return;

    timer?.cancel();
    timer = null;
    isPlaying = false;
    isPaused = false;
    isPausedNotifier.value = false;

    if (isBreakTime) {
      duration = Duration.zero;
      isBreakTime = false;
    } else {
      completedCycles++;
      if (completedCycles >= maxCycles) {
        duration = Duration.zero;
        isBreakTime = false;
      } else {
        _startBreakPhase();
        return;
      }
    }

    notifyListeners();
  }

  void _startCurrentPhase() {
    isPlaying = true;
    isPaused = false;
    notifyListeners();
    _runTimer(currentPhaseMinutes);
  }

  void _runTimer(int phaseMinutes) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration.inMinutes < phaseMinutes) {
        duration += const Duration(seconds: 1);
        notifyListeners();
      } else {
        _completeCurrentPhase();
      }
    });
  }

  void _completeCurrentPhase() {
    timer?.cancel();
    timer = null;

    if (isBreakTime) {
      duration = Duration.zero;
      isPlaying = false;
      isPaused = false;
      isBreakTime = false;
      notifyListeners();
      return;
    }

    completedCycles++;

    if (completedCycles >= maxCycles) {
      isPlaying = false;
      isPaused = false;
      notifyListeners();
      return;
    }

    _startBreakPhase();
  }

  void _startBreakPhase() {
    duration = Duration.zero;
    isBreakTime = true;
    isPlaying = true;
    isPaused = false;
    notifyListeners();
    _runTimer(breakMinutes);
  }
}
