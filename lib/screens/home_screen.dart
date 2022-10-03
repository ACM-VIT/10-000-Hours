import 'package:flutter/material.dart';
import 'package:ten_thousand_hours/widgets/custom_button.dart';
import 'package:ten_thousand_hours/widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";
  static List<String> entries = <String>[
    "Leetcode",
    "DSA",
    "CAT 2",
    "FATS",
    "HACKTOBERFEST",
    "C2C",
    "MORE RANDOM",
    "SOMETHING RANDOM",
    "SOMETHING RANDOM",
    "SOMETHING RANDOM",
    "SOMETHING RANDOM",
    "SOMETHING RANDOM",
  ];

  static List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("10-000 Hours"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Print(index),
                      child: TaskCard(
                          taskName: entries[index],
                          colorCode: colorCodes[index % 6]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ),
              CustomButton(buttonText: "add new skill", buttonCta: () {}),
            ],
          ),
        ));
  }

  Print(int index) {
    print(index);
  }
}
