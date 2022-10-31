import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ten_thousand_hours/data/timer_data.dart';

import '../data/task_data.dart';

class TaskListProvider extends ChangeNotifier {
  late List<TaskData> _taskList;
  late Box<TaskData> _tasksBox;

  List<TaskData> get taskList => List.from(_taskList);

  Future init() async {
    Hive.registerAdapter(TaskDataAdapter());
    Hive.registerAdapter(TimerDataAdapter());
    _tasksBox = await Hive.openBox("tasks");
    _taskList = List.from(_tasksBox.values);
  }

  void deleteTask(int task) {
    TaskData taskData = _taskList.removeAt(task);
    taskData.delete();
    _tasksBox.flush();

    notifyListeners();
  }

  void onAddTask(TaskData taskData, BuildContext context) {
    print(taskData.taskName);
    if (taskData.taskName.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Please Specify a name for Task before saving it!!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    _taskList.add(taskData);
    _tasksBox.add(taskData);
    _tasksBox.flush();
    notifyListeners();
  }

  void update(int index, TaskData newValue) {
    TaskData? hiveTaskObject = _tasksBox.getAt(index);
    if (hiveTaskObject == null) return;

    _taskList[index] = newValue;

    hiveTaskObject.taskName = newValue.taskName;
    hiveTaskObject.timeDevoted.updateData(newValue.timeDevoted.hours,
        newValue.timeDevoted.minutes, newValue.timeDevoted.seconds);
    hiveTaskObject.save();
    _tasksBox.flush();
  }
}
