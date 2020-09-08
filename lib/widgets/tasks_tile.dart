import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String task;
  final checkboxCallback;
  final time;

  const TasksTile(
      {this.isChecked, this.task, this.checkboxCallback, this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: kThemeColor,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            task,
            style: TextStyle(
                color: isChecked ? Colors.grey : Colors.black,
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ],
      ),
      trailing: time,
    );
  }
}
