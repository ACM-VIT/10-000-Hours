import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';
import 'view/screens/add_task.dart';
import 'view/screens/task_time.dart';

import 'view/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskListProvider(),
    child: MaterialApp(
      title: "10,000 Hours",
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        AddTask.id: (context) => AddTask(),
        TaskTimer.id: (context) => TaskTimer(),
      },
    ),
  ));
}
