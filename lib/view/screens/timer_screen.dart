import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/timer_provider.dart';
import '../widgets/custom_button.dart';

class TaskTimer extends StatelessWidget {
  static String id = "TaskTimer";
  String clockState = "START";

  TaskTimer({Key? key}) : super(key: key);

  Timer? stopwatchTimer;

  Duration myDuration = const Duration(minutes: 0);

  startTimer(TimerProvider provider) {
    stopwatchTimer = Timer.periodic(
        const Duration(seconds: 1), (_) => setCountDown(provider));
  }

  void stopTimer(TimerProvider provider) {
    stopwatchTimer!.cancel();N
  }

  void resetTimer(TimerProvider provider) {
    provider.updateTimer(0, 0, 0);
    stopTimer(provider);
  }

  void setCountDown(TimerProvider provider) {
    const increaseSecondsBy = 1;

    final seconds = myDuration.inSeconds + increaseSecondsBy;

    if (seconds < 0) {
      stopwatchTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
      provider.updateTimer(
          myDuration.inHours,
          myDuration.inMinutes.remainder(60),
          myDuration.inSeconds.remainder(60));
    }
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration.inHours);
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

            const SizedBox(height: 20),
            // Start Button
            Consumer<TimerProvider>(builder: ((context, provider, child) {
              return Column(
                children: [
                  Text(
                    '${provider.getTime().getHour()}:${provider.getTime().getMinutes()}:${provider.getTime().getSeconds()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                  ElevatedButton(
                    onPressed: startTimer(provider),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (stopwatchTimer == null || stopwatchTimer!.isActive) {
                        provider.updateTimer(int.parse(hours),
                            int.parse(minutes), int.parse(seconds));
                        stopTimer(provider);
                      }
                    },
                    child: const Text(
                      'Stop',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        resetTimer(provider);
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )),
                ],
              );
            })),
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
