import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditTaskName extends StatefulWidget {
  static String id = "EditTask";
  const EditTaskName({super.key});

  @override
  State<EditTaskName> createState() => _EditTaskNameState();
}

class _EditTaskNameState extends State<EditTaskName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 44, 16, 16),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Previous Task',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter your new Task'),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(370, 46)),
                    onPressed: () {},
                    child: const Text('Update')),
              ],
            ),
          ),
          height: 200,
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color.fromARGB(255, 184, 184, 184))),
        ),
      ),
    );
  }
}
