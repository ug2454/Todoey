import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> taskList;

  const TasksList({this.taskList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: taskList.length,
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      itemBuilder: (context, index) {
        return TasksTile(
            task: taskList[index].task,
            isChecked: taskList[index].isCompleted,
            checkboxCallback: (checkboxState) {
              // setState(() {
              //   tasks[index].toggle();
              // });
            });
      },
    );
  }
}
