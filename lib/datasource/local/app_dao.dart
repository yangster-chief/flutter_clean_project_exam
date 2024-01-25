import 'package:flutter_project_exam/config/module/hive_service.dart';
import 'package:flutter_project_exam/datasource/local/model/todo_model.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_project_exam
/// File Name: app_dao
/// Created by sujangmac
///
/// Description:
///
@singleton
class AppDao {
  final HiveService _hive;
  const AppDao(this._hive);

  List<ToDoModel> getAll() => _hive.toDoBox.values.toList();
}
