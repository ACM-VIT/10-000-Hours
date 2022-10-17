import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ten_thousand_hours/data/task_data.dart';
import 'package:ten_thousand_hours/data/timer_data.dart';

class TimerProvider extends ChangeNotifier {
  TimerData timerData = TimerData(0, 0, 0);
  Timer? stopwatchTimer;
  Duration myDuration = const Duration(hours: 0);

  void updateTimer(int hours, int minutes, int seconds) {
    if (kDebugMode) {
      print("Update $hours : $minutes : $seconds");
    }
    timerData.updateData(hours, minutes, seconds);
    notifyListeners();
  }

  void setDuration(Duration duration) {
    myDuration = duration;
    notifyListeners();
  }

  void startTimer(setCountDown) {
    if (kDebugMode) {
      print("start");
    }
    stopwatchTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    notifyListeners();
  }

  void stopTimer(int index, List<TaskData> taskList) {
    timerData.updateData(myDuration.inHours, myDuration.inMinutes.remainder(60),
        myDuration.inSeconds.remainder(60));
    if (kDebugMode) {
      print("stopTimer: updating time");
    }
    taskList[index].timeDevoted = timerData;
    stopwatchTimer!.cancel();
    notifyListeners();
  }

  void resetTimer(int index, List<TaskData> taskList) {
    setDuration(const Duration(hours: 0));
    stopTimer(index, taskList);
  }

  TimerData getTime() {
    return timerData;
  }
}
