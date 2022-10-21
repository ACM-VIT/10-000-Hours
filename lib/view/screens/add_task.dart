import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/data/task_data.dart';
import 'package:ten_thousand_hours/data/timer_data.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';
import 'package:ten_thousand_hours/view/widgets/custom_button.dart';

class AddTask extends StatelessWidget {
  static String id = "AddTask";
  final TimerData timerData = TimerData(0, 0, 0);
  final TextEditingController taskNameController = TextEditingController();
  AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(15),
              child: Center(
            child: TextFormField(
              controller: taskNameController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter task name',
                labelStyle: TextStyle(
                  color: Colors.indigo,
                ),
              ),
            ),
          )),

          Container(

            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
              Consumer<TaskListProvider>(builder: (context, provider, child) {
                return ElevatedButton(
                  child: Text('Save',style: TextStyle(fontSize: 18),),
                  style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))) ),
                  onPressed: () {
                    provider.onAddTask(TaskData(timerData, taskNameController.text),context);
                    Navigator.pop(context);
                  },
                );
              }),

            const SizedBox(
              height: 10,
            ),

            ElevatedButton(
                  child: Text("Back",style: TextStyle(fontSize: 18),),
                  style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))) ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ]),
          ),
        ],
      ),
    );
  }
}
