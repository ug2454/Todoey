import 'package:flutter/widgets.dart';
import 'package:todoey_flutter/models/task.dart';

class Data extends ChangeNotifier{
  List<Task> taskList = [
    Task(task: 'Buy milk'),
    Task(task: 'Buy eggs'),
  ];

  
}