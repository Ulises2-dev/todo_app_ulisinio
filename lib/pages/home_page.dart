import 'package:flutter/material.dart';
import 'package:todo_app_ulisinio/utils/todo_list.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['Leer la documentación oficial', false],
    ['Tomar agua', false],
    ['Hacer mis Commits', false]
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text(
          'ToDo Simple',
          ),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
      ),
      body: ListView.builder(itemCount: toDoList.length, itemBuilder: (BuildContext context, index) {
        return TodoList(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxChanged(index),
        );
      }),
    );
  }
}