import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/models/calc_time.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final time = CalcTime();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CalcTime(dayNo: DateTime.now().weekday, monthNo: DateTime.now().month);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 95.0),
        child: FloatingActionButton(
          backgroundColor: kThemeColor,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskList(),
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 10.0),
                child: Container(
                  height: 100.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${time.day},',
                                  style: TextStyle(
                                      // color: Color(0xFF606AFA),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0),
                                ),
                                TextSpan(
                                  text: '  ${DateTime.now().day}th',
                                  style: TextStyle(
                                    // color: Color(0xFF606AFA),
                                    fontSize: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${Provider.of<Data>(context).taskListLength} Tasks',
                            style: TextStyle(
                              color: Color(0xFFB7B8D2),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${time.month}',
                            style: TextStyle(
                                color: Color(0xFFB7B8D2),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
