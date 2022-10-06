import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/data/task_data.dart';
import 'package:ten_thousand_hours/data/timer_data.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';
import 'package:ten_thousand_hours/view/widgets/custom_button.dart';

class AddTask extends StatelessWidget {
  static String id = "AddTask";
  final TimerData timerData = TimerData(0, 0, 0);
  final TextEditingController taskNameController = TextEditingController();
  AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: TextFormField(
              controller: taskNameController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter task name',
                labelStyle: TextStyle(
                  color: Color(0xFF6200EE),
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(10),
            child:
                Consumer<TaskListProvider>(builder: (context, provider, child) {
              return CustomButton(
                buttonText: "Save",
                buttonCta: () {
                  provider
                      .onAddTask(TaskData(timerData, taskNameController.text));
                  Navigator.pop(context);
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButton(
                buttonText: "Back",
                buttonCta: () {
                  Navigator.pop(context);
                }),
          ),
          const SizedBox(
            height: 25,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
