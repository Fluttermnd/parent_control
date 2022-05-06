import 'package:rxdart/rxdart.dart';

import '../database/database_helper.dart';
import '../model/user_model.dart';

class UserBloc {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final _fitchRegister = PublishSubject<List<UserModel>>();

  Stream<List<UserModel>> get getRegister => _fitchRegister.stream;

  allUser() async {
    List<UserModel> response = await _databaseHelper.getUser();
    _fitchRegister.sink.add(response);
  }

  saveUser(UserModel data) {
    _databaseHelper.saveUser(data);
  }

  update(UserModel data) async {
    int k = await _databaseHelper.updateUser(data);
    if (k > 0) {
      allUser();
    }
  }

  delete(int id) async {
    int k = await _databaseHelper.deleteUser(id);
    if (k > 0) {
      allUser();
    }
  }
}

final userBloc = UserBloc();
