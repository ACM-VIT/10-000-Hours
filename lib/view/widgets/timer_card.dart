import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TimerCard extends StatelessWidget {
  final String taskName;
  const TimerCard({required this.taskName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentage = 0.45; //hard coded for now
    bool completion = false;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.orangeAccent),
      margin: const EdgeInsets.all(10),
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'lib/assets/work1.png',
            height: 250,
            fit: BoxFit.fitHeight,
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              taskName,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
          completion
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                      "Hurray you have successfully completed 10000 hours in $taskName"),
                )
              : Container(),
          !completion
              ? Container(
                  color: Colors.blue,
                  padding: EdgeInsets.all(20),
                  child: const Text('TIMER'))
              : Container(),
          !completion
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearPercentIndicator(
                    lineHeight: 20,
                    percent: percentage,
                    // center: const Text("30%"),
                    animation: true,
                    progressColor: Colors.pink,
                    backgroundColor: Colors.blue,
                    barRadius: const Radius.circular(20),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
