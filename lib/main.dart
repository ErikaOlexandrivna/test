import 'package:flutter/material.dart';

import 'todo_list_screen.dart';

void main() {
  runApp( const Todo());
}


class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const  TodoListScreen(),
    );
  }
}


