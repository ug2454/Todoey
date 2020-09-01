class Task {
  final String task;
  bool isCompleted;

  Task({this.task, this.isCompleted = false});

  void toggle() {
    isCompleted = !isCompleted;
  }
}
