import 'dart:async';
import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier{
  bool isPlaying = false;
  bool isPaused = false;
  Timer? timer;
  Duration duration = Duration.zero;

  void startTimer(int initialMinutes){
    if(timer != null) return;

    isPlaying = true;
    isPaused = false;
    notifyListeners();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(duration.inMinutes < initialMinutes){
        duration += Duration(seconds: 1);
        notifyListeners();
      }else{
        stopTime();
      }
    });
  }

  void pauseTimer(){
    timer?.cancel();
    timer = null;
    isPlaying = false;
    isPaused = true;
    notifyListeners();
  }

  void resumeTimer(int initialMinutes){
    if(timer != null) return;

    isPlaying = true;
    isPaused = false;
    notifyListeners();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(duration.inMinutes < initialMinutes){
        duration += Duration(seconds: 1);
        notifyListeners();
      }else{
        stopTime();
      }
    });
  }

  void stopTime() {
    timer?.cancel();
    timer = null;
    isPlaying = false;
    isPaused = false;
    notifyListeners();
  }

  void restarTime(int initialMinutes, ValueNotifier<bool> isPaused){
    timer?.cancel();
    timer = null;
    duration = Duration.zero;
    isPlaying = false;
    isPaused.value = false;
    notifyListeners();

  }
}
