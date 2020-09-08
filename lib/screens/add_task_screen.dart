import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskList extends StatefulWidget {
  @override
  _AddTaskListState createState() => _AddTaskListState();
}

class _AddTaskListState extends State<AddTaskList> {
  TimeOfDay _time;
  bool isMinSingle = false;
  String tasktitle;
  bool isAm = false;
  bool isTwelve = false;

  MaterialColor _buttonTextColor = MaterialColor(0xFFF36364, <int, Color>{
    50: Color(0xFFF36364),
    100: Color(0xFFF36364),
    200: Color(0xFFF36364),
    300: Color(0xFFF36364),
    400: Color(0xFFF36364),
    500: Color(0xFFF36364),
    600: Color(0xFFF36364),
    700: Color(0xFFF36364),
    800: Color(0xFFF36364),
    900: Color(0xFFF36364),
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textcontroller = TextEditingController();
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
            ),
            TextField(
              // controller: textcontroller,
              onChanged: (value) {
                tasktitle = value;
              },
              autofocus: true,
              cursorColor: Colors.lightBlueAccent,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                ),
                border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Select Time:'),
                FlatButton(
                  onPressed: () async {
                    TimeOfDay time = await showTimePicker(
                      context: context,
                      initialTime: _time,
                      builder: (context, child) {
                        return Theme(
                            data: ThemeData(
                              primaryColor: Color(0xFFF36364),
                              accentColor: Color(0xFFF36364),
                              primarySwatch: _buttonTextColor,
                            ),
                            child: MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: false),
                                child: child));
                      },
                    );
                    if (time != null) {
                      setState(() {
                        dynamic minutes = time.minute;

                        print(minutes);
                        if (minutes >= 0 && minutes <= 9) {
                          isMinSingle = true;
                        } else
                          isMinSingle = false;
                        print(time.hour);
                        if (time.hour >= 0 && time.hour < 12) {
                          isAm = true;
                        } else
                          isAm = false;

                        if (time.hour == 0 || time.hour == 12) {
                          isTwelve = true;
                        } else
                          isTwelve = false;
                        _time = time.replacing(
                            hour: isTwelve ? 12 : time.hourOfPeriod);
                      });
                    }
                  },
                  child: isMinSingle
                      ? Text(
                          '${_time.hour}:0${_time.minute}',
                        )
                      : Text('${_time.hour}:${_time.minute}'),
                ),
              ],
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<Data>(context, listen: false).addTask(
                    tasktitle,
                    isMinSingle
                        ? Text(
                            '${_time.hour}:0${_time.minute} ${isAm ? "AM" : "PM"}')
                        : Text(
                            '${_time.hour}:${_time.minute} ${isAm ? "AM" : "PM"}'));
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
