import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.taskListLength,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
          itemBuilder: (context, index) {
            final task = value.taskList[index];
            return GestureDetector(
              onLongPressStart: (details) {
                value.deleteTask(task);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.lightBlueAccent,
                    content: Text(
                      'Item is deleted!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              child: TasksTile(
                  task: task.task,
                  isChecked: task.isCompleted,
                  checkboxCallback: (checkboxState) {
                    value.toggle(task);
                  }),
            );
          },
        );
      },
    );
  }
}
