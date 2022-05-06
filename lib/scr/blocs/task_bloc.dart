import 'package:rxdart/rxdart.dart';

import '../database/database_helper.dart';
import '../model/task_model.dart';

class TaskBloc {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final _fitchRegister = PublishSubject<List<TaskModel>>();

  Stream<List<TaskModel>> get getTask => _fitchRegister.stream;

  allTask(int id) async {
    List<TaskModel> response = await _databaseHelper.getTask(id);
    _fitchRegister.sink.add(response);
  }

  saveTask(TaskModel data) async {
    await _databaseHelper.saveTask(data);
    allTask(data.userId);
  }

  update(TaskModel data) async {
    int k = await _databaseHelper.updateTask(data);
    allTask(data.userId);
  }

  deleteTask(int id, int userId) async {
    int k = await _databaseHelper.deleteTask(id);
    allTask(userId);
  }
}

final taskBloc = TaskBloc();
