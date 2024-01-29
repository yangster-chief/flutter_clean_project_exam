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

  //get all
  List<ToDoModel> getAll() => _hive.toDoBox.values.toList();

  //check is empty
  bool isEmpty() => _hive.toDoBox.isEmpty;

  //get by id
  ToDoModel? getById(String id) => _hive.toDoBox.get(id);

  //clear all
  Future<void> clearAll() => _hive.toDoBox.clear();

  //delete
  Future<void> delete(String id) => _hive.toDoBox.delete(id);

  //save
  void save(ToDoModel toDoModel) => _hive.toDoBox.put(toDoModel.id, toDoModel);

  // save all
  void saveAll(List<ToDoModel> toDoModels) {
    for (var toDoModel in toDoModels) {
      _hive.toDoBox.put(toDoModel.id, toDoModel);
    }
  }

  //update
  void update(ToDoModel toDoModel) =>
      _hive.toDoBox.put(toDoModel.id, toDoModel);
}
