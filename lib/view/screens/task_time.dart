import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/timer_card.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';

class TaskTimer extends StatefulWidget {
  //add startTime //add endTime
  static String id = "TaskTimer";
  String clockState = "START";

  TaskTimer({Key? key}) : super(key: key);

  @override
  State<TaskTimer> createState() => _TaskTimerState();
}

class _TaskTimerState extends State<TaskTimer> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              // popupmenu item 1
              PopupMenuItem(
                value: 1,
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Edit'),
                    Icon(
                      Icons.edit_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Star'),
                    Icon(
                      Icons.star_outlined,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 3,
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Delete'),
                    Icon(
                      Icons.delete_outline,
                      color: Colors.black,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
        title: const Text('Timer'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TaskListProvider>(
              builder: (context, provider, child) {
                return TimerCard(
                  taskName:
                      provider.getTaskList()[arguments['index']].getTaskName(),
                );
              },
            ),
          ),
          CustomButton(
              buttonText: "${widget.clockState} TIMER",
              buttonCta: () {
                setState(() {
                  (widget.clockState == "START")
                      ? widget.clockState = "STOP"
                      : widget.clockState = "START";
                });
              }),
          CustomButton(
            buttonText: "BACK",
            buttonCta: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
