class TaskModel {
  TaskModel({
    this.id = 0,
    required this.task,
    required this.userId,
  });

  int id;
  String task;
  int userId;

  Map<String, dynamic> toJson() => {
        "task": task,
        "userId": userId,
      };
}
