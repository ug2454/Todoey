class Task {
  final String task;
  bool isCompleted;
  bool isDelete;
  final time;

  Task({this.task, this.isCompleted = false, this.isDelete = false, this.time});

  void toggle() {
    isCompleted = !isCompleted;
  }

  bool toggleDelete() {
    isDelete = !isDelete;
    return isDelete;
  }
}
