import 'package:hive/hive.dart';
import 'package:ten_thousand_hours/data/timer_data.dart';

part 'task_data.g.dart';

@HiveType(typeId: 1)
class TaskData extends HiveObject {
  @HiveField(0)
  TimerData timeDevoted;
  @HiveField(1)
  String taskName;

  TaskData(this.timeDevoted, this.taskName);

  String getTaskName() {
    return taskName;
  }

  TimerData getTimeSpend() {
    return timeDevoted;
  }
}
