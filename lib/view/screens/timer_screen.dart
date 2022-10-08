import 'dart:async';
import 'package:provider/provider.dart';

import '../widgets/timer_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ten_thousand_hours/data/timer_data.dart';
import '../widgets/custom_button.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';

class TaskTimer extends StatefulWidget {
  static String id = "TaskTimer";
  const TaskTimer({Key? key}) : super(key: key);

  @override
  State<TaskTimer> createState() => _TaskTimerState();
}

class _TaskTimerState extends State<TaskTimer> {
  TimerData timerData = TimerData(0, 0, 0);
  TaskListProvider taskListProvider = TaskListProvider();
  Timer? stopwatchTimer;
  Duration myDuration = const Duration(hours: 0);
  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    if (kDebugMode) {
      print("start");
    }
    stopwatchTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer(int index) {
    timerData.updateData(myDuration.inHours, myDuration.inMinutes.remainder(60),
        myDuration.inSeconds.remainder(60));
    if (kDebugMode) {
      print("stopTimer: updating time");
    }
    taskListProvider.getTaskList()[index].timeDevoted = timerData;

    setState(() => stopwatchTimer!.cancel());
  }

  void resetTimer(int index) {
    setState(() => myDuration = const Duration(hours: 0));
    stopTimer(index);
  }

  void setCountDown() {
    const increaseSecondsBy = 1;
    setState(() {
      var seconds = myDuration.inSeconds;
      if (seconds < 0) {
        stopwatchTimer!.cancel();
      } else {
        seconds = myDuration.inSeconds + increaseSecondsBy;
        myDuration = Duration(seconds: seconds);
        timerData.updateData(
            myDuration.inHours,
            myDuration.inMinutes.remainder(60),
            myDuration.inSeconds.remainder(60));
        if (kDebugMode) {
          print("SetCountDown updating time");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    int index = arguments['index'];
    myDuration = Duration(
        hours: taskListProvider.getTaskList()[index].getTimeSpend().getHour(),
        minutes:
            taskListProvider.getTaskList()[index].getTimeSpend().getMinutes(),
        seconds:
            taskListProvider.getTaskList()[index].getTimeSpend().getSeconds());
    if (kDebugMode) {
      print("RETRIVED DATA${myDuration.inSeconds}");
    }

    String strDigits(int n) => n.toString().padLeft(2, '0');
    //final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

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
                  return TimerCard(
                    hours: hours,
                    minutes: minutes,
                    seconds: seconds,
                    taskName: provider
                        .getTaskList()[arguments['index']]
                        .getTaskName(),
                  );
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                  onPressed: () {
                    startTimer();
                    stopTimer(index);
                    startTimer();
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                // Step 10
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  onPressed: () {
                    if (stopwatchTimer == null || stopwatchTimer!.isActive) {
                      stopTimer(index);
                    }
                  },
                  child: const Text(
                    'Stop',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                // Step 11
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    onPressed: () {
                      resetTimer(index);
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    )),
              ],
            ),
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
