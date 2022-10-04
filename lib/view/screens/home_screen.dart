import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/data/task_data.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';
import 'package:ten_thousand_hours/view/screens/add_task.dart';
import '../widgets/custom_button.dart';
import '../widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskListProvider(),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  static List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListProvider>(builder: (consumer, tasklist, child) {
      List<TaskData> taskList = tasklist.getTaskList();
      taskList.add(TaskData(100, "A"));
      taskList.add(TaskData(100, "A"));
      taskList.add(TaskData(100, "A"));
      taskList.add(TaskData(100, "A"));
      taskList.add(TaskData(100, "A"));
      //print(tasklist);
      return Scaffold(
          appBar: AppBar(
            title: const Text("10-000 Hours"),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: tasklist.getTaskList().length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => printIndex(index),
                        child: TaskCard(
                            taskName: taskList[index].getTaskName(),
                            colorCode: colorCodes[index % 6]),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
                CustomButton(
                  buttonText: "add new skill",
                  buttonCta: () {
                    Navigator.pushNamed(context, AddTask.id);
                  },
                ),
              ],
            ),
          ));
    });
  }
}

printIndex(int index) {
  if (kDebugMode) {
    print(index);
  }
}
