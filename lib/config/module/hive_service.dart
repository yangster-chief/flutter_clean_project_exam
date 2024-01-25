import 'package:flutter_project_exam/datasource/local/model/todo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

///
/// flutter_project_exam
/// File Name: hive_service
/// Created by sujangmac
///
/// Description:
///
class HiveService {
  static const String _todoBox = 'todo';

  static Future<HiveService> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ToDoModelAdapter());

    await Future.wait([
      Hive.openBox<ToDoModel>(_todoBox),
    ]);

    return HiveService();
  }

  Box<ToDoModel> get toDoBox => Hive.box<ToDoModel>(_todoBox);

  void dispose() {
    Hive.close();
  }
}
