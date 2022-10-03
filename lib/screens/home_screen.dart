import 'package:flutter/material.dart';
import 'package:ten_thousand_hours/widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  static List<String> entries = <String>[
    "Leetcode",
    "DSA",
    "CAT 2",
    "Internships",
    "IIITH"
  ];

  static List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.separated(
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskCard(
                  taskName: entries[index], colorCode: colorCodes[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          )
        ],
      ),
    );
  }
}
