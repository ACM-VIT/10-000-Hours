import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/timer_card.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';

class TaskTimer extends StatefulWidget {
  static String id = "TaskTimer";
  String clockState = "START";

  TaskTimer({Key? key}) : super(key: key);

  @override
  State<TaskTimer> createState() => _TaskTimerState();
}

class _TaskTimerState extends State<TaskTimer> {
  Timer? stopwatchTimer;
  Duration myDuration = const Duration(minutes: 0);
  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    stopwatchTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => stopwatchTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(hours: 0));
  }

  void setCountDown() {
    const increaseSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds + increaseSecondsBy;
      if (seconds < 0) {
        stopwatchTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
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
        title: const Text('Timer'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // Step 8
            Text(
              '$hours:$minutes:$seconds',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
            const SizedBox(height: 20),
            // Step 9
            ElevatedButton(
              onPressed: startTimer,
              child: const Text(
                'Start',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            // Step 10
            ElevatedButton(
              onPressed: () {
                if (stopwatchTimer == null || stopwatchTimer!.isActive) {
                  stopTimer();
                }
              },
              child: const Text(
                'Stop',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            // Step 11
            ElevatedButton(
                onPressed: () {
                  resetTimer();
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )),
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

// class _TaskTimerState extends State<TaskTimer> {
//   @override
//   Widget build(BuildContext context) {
//     final arguments = (ModalRoute.of(context)?.settings.arguments ??
//         <String, dynamic>{}) as Map;

//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           PopupMenuButton<int>(
//             itemBuilder: (context) => [
//               // popupmenu item 1
//               PopupMenuItem(
//                 value: 1,
//                 onTap: () {},
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: const [
//                     Text('Edit'),
//                     Icon(
//                       Icons.edit_outlined,
//                       color: Colors.black,
//                     ),
//                   ],
//                 ),
//               ),
//               PopupMenuItem(
//                 value: 2,
//                 onTap: () {},
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: const [
//                     Text('Star'),
//                     Icon(
//                       Icons.star_outlined,
//                       color: Colors.black,
//                     ),
//                   ],
//                 ),
//               ),
//               PopupMenuItem(
//                 value: 3,
//                 onTap: () {},
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: const [
//                     Text('Delete'),
//                     Icon(
//                       Icons.delete_outline,
//                       color: Colors.black,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//         title: const Text('Timer'),
//       ),
//       body: Column(
//         children: [
//           CustomButton(
//             buttonText: "BACK",
//             buttonCta: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
