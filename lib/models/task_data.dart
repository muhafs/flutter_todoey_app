import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_app/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Buy milk'),
    Task(title: 'Buy egg'),
    Task(title: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String newTask) {
    _tasks.add(Task(title: newTask));

    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();

    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
