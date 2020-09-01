import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String task;
  final checkboxCallback;

  const TasksTile({this.isChecked, this.task, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
