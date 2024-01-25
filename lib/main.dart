import 'package:flutter/material.dart';
import 'package:flutter_application/screens/initial_screen.dart';

import 'data/task_inherited.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}