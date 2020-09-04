class Task {
  final String task;
  bool isCompleted;
  bool isDelete;

  Task({this.task, this.isCompleted = false, this.isDelete = false});

  void toggle() {
    isCompleted = !isCompleted;
  }

  bool toggleDelete() {
    isDelete = !isDelete;
    return isDelete;
  }
}
