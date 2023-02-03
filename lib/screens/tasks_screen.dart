// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:todoey_app/components/tasks_list.dart';
import 'package:todoey_app/models/task.dart';
import 'package:todoey_app/screens/add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(title: 'Buy milk'),
    Task(title: 'Buy egg'),
    Task(title: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen((callBackTitle) {
                  setState(() {
                    tasks.add(Task(title: callBackTitle));
                  });

                  Navigator.pop(context);
                }),
              ),
            ),
          );
        },
        //
        backgroundColor: Colors.red,
        //
        child: const Icon(Icons.add),
      ),
      //
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
              //
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      //
                      color: Colors.red,
                      //
                      size: 30,
                    ),
                  ),
                  //
                  const SizedBox(height: 10),
                  //
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      '${tasks.length} Tasks',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                //
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                //
                child: TasksList(tasks),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
