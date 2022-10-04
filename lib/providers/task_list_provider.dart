import 'package:flutter/foundation.dart';

import '../data/task_data.dart';

class TaskListProvider extends ChangeNotifier {
  static List<TaskData> taskList = [];
  void onAddTask(TaskData taskData) {
    taskList.add(taskData);
    notifyListeners();
  }

  List<TaskData> getTaskList() {
    return taskList;
  }
}
