import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ten_thousand_hours/data/timer_data.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';

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

  void stopTimer(int index, TaskListProvider taskListProvider) {
    timerData.updateData(myDuration.inHours, myDuration.inMinutes.remainder(60),
        myDuration.inSeconds.remainder(60));
    if (kDebugMode) {
      print("stopTimer: updating time");
    }
    taskListProvider.getTaskList()[index].timeDevoted = timerData;
    stopwatchTimer!.cancel();
    notifyListeners();
  }

  void resetTimer(int index, TaskListProvider taskListProvider) {
    setDuration(const Duration(hours: 0));
    stopTimer(index, taskListProvider);
  }

  TimerData getTime() {
    return timerData;
  }
}
