import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/components/task_tile.dart';
import 'package:todoey_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];

            return TaskTile(
              title: task.title,
              isChecked: task.isDone,
              callback: (_) => taskData.updateTask(task),
              atLongPress: () => taskData.deleteTask(task),
            );
          },
        );
      },
    );
  }
}
