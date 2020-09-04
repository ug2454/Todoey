import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Provider.of<Data>(context).taskList.length,
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      itemBuilder: (context, index) {
        return TasksTile(
            task: Provider.of<Data>(context).taskList[index].task,
            isChecked: Provider.of<Data>(context).taskList[index].isCompleted,
            checkboxCallback: (checkboxState) {
              setState(() {
                Provider.of<Data>(context).taskList[index].toggle();
              });
            });
      },
    );
  }
}
