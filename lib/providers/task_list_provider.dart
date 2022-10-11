
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/task_data.dart';

class TaskListProvider extends ChangeNotifier {
  static List<TaskData> taskList = [];

  void deleteTask(int task) {
    taskList.removeAt(task);
    notifyListeners();
  }

  void onAddTask(TaskData taskData,BuildContext context) {
    print(taskData.taskName);
    if(taskData.taskName.isNotEmpty)
    {
      taskList.add(taskData);
      notifyListeners();
    }
    else
      {
        const snackBar = SnackBar(
          content: Text('Please Specify a name for Task before saving it!!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
  }

  List<TaskData> getTaskList() {
    return taskList;
  }
}
