import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';
import 'package:ten_thousand_hours/providers/timer_provider.dart';
import 'view/screens/add_task.dart';
import 'view/screens/timer_screen.dart';

import 'view/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => TaskListProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => TimerProvider(),
      )
    ],
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
