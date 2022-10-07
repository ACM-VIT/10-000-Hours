import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';
import 'package:ten_thousand_hours/view/screens/add_task.dart';
import 'package:ten_thousand_hours/view/screens/timer_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreenView();
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("tenK Hours"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
          child: Column(
            children: [
              Expanded(
                child: Consumer<TaskListProvider>(
                    builder: (context, provider, child) {
                  return ListView.builder(
                      itemCount: provider.getTaskList().length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, TaskTimer.id,
                              arguments: {'index': index}),
                          child: TaskCard(
                              taskName:
                                  provider.getTaskList()[index].getTaskName(),
                              colorCode: 800),
                        );
                      });
                }),
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
  }
}

printIndex(int index) {
  if (kDebugMode) {
    print(index);
  }
}
