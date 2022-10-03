import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final int colorCode;
  const TaskCard({required this.taskName, required this.colorCode, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      color: Colors.amber[colorCode],
      child: Center(child: Text(taskName)),
    );
  }
}
