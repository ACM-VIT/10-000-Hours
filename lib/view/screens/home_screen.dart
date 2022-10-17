import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';
import 'package:ten_thousand_hours/view/screens/add_task.dart';
import 'package:ten_thousand_hours/view/screens/timer_screen.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("10-000 Hours"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
        child: Column(
          children: [
            Expanded(
              child: Consumer<TaskListProvider>(
                builder: (context, provider, child) {
                  if (provider.taskList.isEmpty) {
                    return Container(
                      margin: EdgeInsets.only(top: height / 3),
                      child: Text("Please press the + button to create a Task",
                          style: TextStyle(fontSize: width / 21)),
                    );
                  }
                  return ListView.builder(
                    itemCount: provider.taskList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(context, TaskTimer.id,
                            arguments: {'index': index}),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          margin: EdgeInsets.only(bottom: 5),
                          color: Colors.blue.shade100,
                          child: Center(
                            child: Text(provider.taskList[index].getTaskName(),
                                style: TextStyle(fontSize: 22)),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // TaskCard(
      //                     taskName:
      //                     colorCode: 800),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AddTask.id);
            },
            child: const Icon(
              Icons.add,
              size: 40,
            )),
      ),
    );
  }
}

printIndex(int index) {
  if (kDebugMode) {
    print(index);
  }
}
