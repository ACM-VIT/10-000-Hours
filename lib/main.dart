
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_thousand_hours/providers/task_list_provider.dart';
import 'package:ten_thousand_hours/providers/timer_provider.dart';
import 'package:ten_thousand_hours/view/screens/edit_taskname.dart';
import 'package:ten_thousand_hours/view/screens/splash_screen.dart';
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
      initialRoute: splashScreen.id,
      routes: {
        
        splashScreen.id: (context) => splashScreen(),
        EditTaskName.id: (context) => EditTaskName(),
        HomeScreen.id: (context) => HomeScreen(),
        AddTask.id: (context) => AddTask(),
        TaskTimer.id: (context) => const TaskTimer(),
      },
    ),
  ));
}
