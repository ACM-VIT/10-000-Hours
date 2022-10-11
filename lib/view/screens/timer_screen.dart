import 'dart:async';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/timer_provider.dart';
import '../widgets/timer_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';

class TaskTimer extends StatefulWidget {
  static String id = "TaskTimer";
  const TaskTimer({Key? key}) : super(key: key);

  @override
  State<TaskTimer> createState() => _TaskTimerState();
}

class _TaskTimerState extends State<TaskTimer> {
  TaskListProvider taskListProvider = TaskListProvider();
  TimerProvider timerProvider = TimerProvider();

  @override
  void initState() {
    super.initState();
  }

  void setCountDown() {
    const increaseSecondsBy = 1;
    TimerProvider providerInstance = context.read<TimerProvider>();
    var seconds = providerInstance.myDuration.inSeconds;
    if (seconds < 0) {
      providerInstance.stopwatchTimer!.cancel();
    } else {
      seconds = providerInstance.myDuration.inSeconds + increaseSecondsBy;
      providerInstance.setDuration(Duration(seconds: seconds));
      providerInstance.updateTimer(
          providerInstance.myDuration.inHours,
          providerInstance.myDuration.inMinutes.remainder(60),
          providerInstance.myDuration.inSeconds.remainder(60));
      if (kDebugMode) {
        print("SetCountDown updating time");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    int index = arguments['index'];
    timerProvider.setDuration(
      Duration(
        hours: taskListProvider.getTaskList()[index].getTimeSpend().getHour(),
        minutes:
            taskListProvider.getTaskList()[index].getTimeSpend().getMinutes(),
        seconds:
            taskListProvider.getTaskList()[index].getTimeSpend().getSeconds(),
      ),
    );
    if (kDebugMode) {
      print("RETRIVED DATA${timerProvider.myDuration.inSeconds}");
    }

    String strDigits(int n) => n.toString().padLeft(2, '0');
    //final days = strDigits(myDuration.inDays);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<TaskListProvider>(
            builder: (context, provider, child) {
              return PopupMenuButton<int>(
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
                    onTap: () {
                      Navigator.pop(context);
                      Future.delayed(const Duration(milliseconds: 500), () {
                        provider.deleteTask(index);
                      });
                    },
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
              );
            },
          ),
        ],
        title: Text(taskListProvider.getTaskList()[index].getTaskName()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Expanded(child: SizedBox()),

            // Step 8
            Expanded(
              child: Consumer<TaskListProvider>(
                builder: (context, provider, child) {
                  return Consumer<TimerProvider>(
                      builder: (context, timerProviderData, child) {
                    return TimerCard(
                      hours: strDigits(
                          timerProviderData.myDuration.inHours.remainder(24)),
                      minutes: strDigits(
                          timerProviderData.myDuration.inMinutes.remainder(60)),
                      seconds: strDigits(
                          timerProviderData.myDuration.inSeconds.remainder(60)),
                      taskName: provider
                          .getTaskList()[arguments['index']]
                          .getTaskName(),
                    );
                  });
                },
              ),
            ),
            // Text(
            //   '$hours:$minutes:$seconds',
            //   style: const TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black,
            //       fontSize: 50),
            // ),

            // const Expanded(child: SizedBox()),
            Consumer<TimerProvider>(builder: (context, provider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {
                      provider.startTimer(setCountDown);
                      provider.stopTimer(index, taskListProvider);
                      provider.startTimer(setCountDown);
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  // Step 10
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                    onPressed: () {
                      if (provider.stopwatchTimer == null ||
                          provider.stopwatchTimer!.isActive) {
                        provider.stopTimer(index, taskListProvider);
                      }
                    },
                    child: const Text(
                      'Stop',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  // Step 11
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                      onPressed: () {
                        provider.resetTimer(index, taskListProvider);
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )),
                ],
              );
            }),
            CustomButton(
              buttonText: "BACK",
              buttonCta: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
