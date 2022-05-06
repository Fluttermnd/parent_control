import 'package:parent_control/scr/model/add_service_model.dart';
import 'package:parent_control/scr/model/task_model.dart';
import 'package:parent_control/scr/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "user.db");
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE register_table('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'name TEXT, '
      'image TEXT, '
      'gender TEXT)',
    );
    await db.execute(
      'CREATE TABLE user_task_table('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'task TEXT, '
      'userId INTEGER)',
    );
    await db.execute(
      'CREATE TABLE add_service_table('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'type INTEGER,'
      'userId INTEGER)',
    );
  }

  Future<int> saveUser(UserModel data) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      "register_table",
      data.toJson(),
    );
    return result;
  }

  Future<int> saveTask(TaskModel data) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      "user_task_table",
      data.toJson(),
    );
    return result;
  }

  Future<int> saveAddService(AddServiceModel data) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      "add_service_table",
      data.toJson(),
    );
    return result;
  }

  Future<List<TaskModel>> getTask(int userId) async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery('SELECT * FROM user_task_table WHERE userId = $userId');
    List<TaskModel> response = <TaskModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = TaskModel(
        id: list[i]["id"],
        task: list[i]["task"],
        userId: list[i]["userId"],
      );
      response.add(items);
    }
    return response;
  }

  Future<List<UserModel>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM register_table');
    List<UserModel> response = <UserModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = UserModel(
        id: list[i]["id"],
        name: list[i]["name"],
        gender: list[i]["gender"],
        image: list[i]["image"],
      );
      response.add(items);
    }
    return response;
  }

  Future<List<AddServiceModel>> getAddService(int userId) async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery('SELECT * FROM add_service_table WHERE userId = $userId');
    List<AddServiceModel> response = <AddServiceModel>[];
    for (int i = 0; i < list.length; i++) {
      var items = AddServiceModel(
        id: list[i]["id"],
        userId: list[i]["userId"],
        type: list[i]["type"],
      );
      response.add(items);
    }
    return response;
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    int result = await dbClient.delete(
      "register_table",
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<int> deleteTask(int id) async {
    var dbClient = await db;
    int result = await dbClient.delete(
      "user_task_table",
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<int> deleteService(int id) async {
    var dbClient = await db;
    int result = await dbClient.delete(
      "add_service_table",
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<int> updateUser(UserModel products) async {
    var dbClient = await db;
    int result = await dbClient.update(
      "register_table",
      products.toJson(),
      where: "id = ?",
      whereArgs: [products.id],
    );
    return result;
  }

  Future<int> updateTask(TaskModel products) async {
    var dbClient = await db;
    int result = await dbClient.update(
      "user_task_table",
      products.toJson(),
      where: "id = ?",
      whereArgs: [products.id],
    );
    return result;
  }

  Future<int> updateService(AddServiceModel products) async {
    var dbClient = await db;
    int result = await dbClient.update(
      "add_service_table",
      products.toJson(),
      where: "id = ?",
      whereArgs: [products.id],
    );
    return result;
  }
}
