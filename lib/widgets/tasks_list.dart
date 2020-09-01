import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> taskList;

  const TasksList({this.taskList});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.taskList.length,
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      itemBuilder: (context, index) {
        return TasksTile(
            task: widget.taskList[index].task,
            isChecked: widget.taskList[index].isCompleted,
            checkboxCallback: (checkboxState) {
              setState(() {
                widget.taskList[index].toggle();
              });
            });
      },
    );
  }
}
