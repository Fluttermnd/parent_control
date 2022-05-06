
import 'package:parent_control/scr/model/add_service_model.dart';
import 'package:rxdart/rxdart.dart';

import '../database/database_helper.dart';

class AddServiceBloc {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final _fitchAddService = PublishSubject<List<AddServiceModel>>();

  Stream<List<AddServiceModel>> get getService => _fitchAddService.stream;

  allService(int id) async {
    List<AddServiceModel> response = await _databaseHelper.getAddService(id);
    _fitchAddService.sink.add(response);
  }

  Future<int> saveService(AddServiceModel data) async {
    int k = await _databaseHelper.saveAddService(data);
    allService(data.userId);
    return k;
  }

  updateService(AddServiceModel data) async {
    int k = await _databaseHelper.updateService(data);
    allService(data.userId);
  }

  deleteService(int id, int userId) async {
    int k = await _databaseHelper.deleteService(id);
    allService(userId);
  }
}

final serviceBloc = AddServiceBloc();
