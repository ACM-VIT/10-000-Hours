import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final int colorCode;
  const TaskCard({required this.taskName, required this.colorCode, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.blue[colorCode],
      child: Center(
          child: Text(
        taskName,
        style: const TextStyle(color: Colors.white, fontSize: 22),
      )),
    );
  }
}
