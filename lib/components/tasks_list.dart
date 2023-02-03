import 'package:flutter/material.dart';
import 'package:todoey_app/components/task_tile.dart';
import 'package:todoey_app/models/task.dart';

class TasksList extends StatefulWidget {
  const TasksList(
    this.tasks, {
    Key? key,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
            title: widget.tasks[index].title,
            isChecked: widget.tasks[index].isDone,
            callback: (newVal) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            });
      },
    );
  }
}
