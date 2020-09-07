import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/constants.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          itemBuilder: (context, index) {
            final task = value.taskList[index];
            final item = value.taskList[index].task;
            return Dismissible(
              background: Container(
                color: kThemeColor,
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              direction: DismissDirection.endToStart,
              key: Key(item),
              onDismissed: (details) {
                value.toggleDelete();
                value.deleteTask(task);
                value.setIndex(index);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('$item deleted!')));
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
