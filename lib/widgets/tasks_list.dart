import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      children: [
        TasksTile(),
        TasksTile(),
        TasksTile(),
        TasksTile(),
        TasksTile(),
        TasksTile(),
        TasksTile(),
        TasksTile(),
        TasksTile(),
        TasksTile(),
        TasksTile(),
        TasksTile(),
      ],
    );
  }
}
