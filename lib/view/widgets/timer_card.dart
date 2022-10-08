import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TimerCard extends StatelessWidget {
  final String taskName, hours, minutes, seconds;
  const TimerCard(
      {required this.taskName,
      required this.hours,
      required this.minutes,
      required this.seconds,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentageCompletion = (double.parse(minutes)/ 60).remainder(1);
    bool completion = (percentageCompletion > 0.98  ? false : true);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.orangeAccent),
      margin: const EdgeInsets.all(10),
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'lib/assets/work1.png',
            height: 250,
            fit: BoxFit.fitHeight,
          ),
          Text(
            '$hours:$minutes:$seconds',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
          ),

          !completion
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                      "Hurray you have successfully completed 1 hour of $taskName",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),),
                )
              : Container(),

           // per hour progress
           Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearPercentIndicator(
                    lineHeight: 20,
                    percent: percentageCompletion,
                    // center: const Text("30%"),
                    center: Text(
                        '${(percentageCompletion * 100).toStringAsPrecision(2)}%'),
                    // animation: true,
                    progressColor: Colors.pink,
                    backgroundColor: Colors.blue,
                    barRadius: const Radius.circular(20),
                  ),
                )
        ],
      ),
    );
  }
}
