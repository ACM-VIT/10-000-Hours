import 'package:hive/hive.dart';

part 'timer_data.g.dart';

@HiveType(typeId: 2)
class TimerData extends HiveObject {
  @HiveField(0)
  int hours = 0;
  @HiveField(1)
  int minutes = 0;
  @HiveField(2)
  int seconds = 0;

  TimerData(hours, minutes, seconds);

  void updateData(int hr, int min, int sec) {
    hours = hr;
    minutes = min;
    seconds = sec;
  }

  int getHour() {
    return hours;
  }

  int getMinutes() {
    return minutes;
  }

  int getSeconds() {
    return seconds;
  }
}
