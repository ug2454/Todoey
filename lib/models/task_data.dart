import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:todoey_flutter/models/task.dart';

class Data extends ChangeNotifier {
  bool isCompleted = false;

  List<Task> _taskList = [
    Task(task: 'Buy milk'),
    Task(task: 'Buy eggs'),
    Task(task: 'Buy bread'),
  ];

  int get taskListLength => _taskList.length;

  void addTask(String newTask) {
    _taskList.add(Task(task: newTask));
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }

  void toggle(Task task) {
    task.toggle();
    notifyListeners();
  }

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);
}
