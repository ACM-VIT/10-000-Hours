import 'package:flutter/foundation.dart';
import 'package:ten_thousand_hours/data/timer_data.dart';

class TimerProvider extends ChangeNotifier {
  TimerData timerData = TimerData(0, 0, 0);
  void updateTimer(int hours, int minutes, int seconds) {
    if (kDebugMode) {
      print("Update $hours : $minutes : $seconds");
    }
    timerData.updateData(hours, minutes, seconds);
    notifyListeners();
  }

  TimerData getTime() {
    return timerData;
  }
}
