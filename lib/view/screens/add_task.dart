import 'package:flutter/material.dart';
import 'package:ten_thousand_hours/view/widgets/custom_button.dart';

class AddTask extends StatelessWidget {
  static String id = "AddTask";
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                icon: Icon(Icons.add_card),
                hintText: 'Enter task name',
                labelStyle: TextStyle(
                  color: Color(0xFF6200EE),
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButton(buttonText: "Save", buttonCta: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButton(buttonText: "Back", buttonCta: () {}),
          ),
          const SizedBox(
            height: 25,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
