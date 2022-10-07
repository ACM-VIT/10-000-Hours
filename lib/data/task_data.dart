import 'package:ten_thousand_hours/data/timer_data.dart';

class TaskData {
  TimerData timeDevoted;
  String taskName;
  TaskData(this.timeDevoted, this.taskName);

  String getTaskName() {
    return taskName;
  }

  TimerData getTimeSpend() {
    return timeDevoted;
  }
}
