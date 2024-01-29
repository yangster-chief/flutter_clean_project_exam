import 'dart:async';

import 'package:flutter_project_exam/core/result.dart';
import 'package:flutter_project_exam/datasource/local/app_dao.dart';
import 'package:flutter_project_exam/datasource/local/model/todo_model.dart';
import 'package:flutter_project_exam/datasource/remote/api_service.dart';
import 'package:flutter_project_exam/datasource/remote/model/todo_response.dart';
import 'package:flutter_project_exam/domain/dto/create_todo.dart';
import 'package:flutter_project_exam/domain/entity/todo.dart';
import 'package:flutter_project_exam/domain/repository/todo_repository.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_project_exam
/// File Name: todo_repository_impl
/// Created by sujangmac
///
/// Description:
///

@Singleton(as: ToDoRepository)
class ToDoRepositoryImpl implements ToDoRepository {
  final ApiService _apiService;
  final AppDao _appDao;

  const ToDoRepositoryImpl(this._apiService, this._appDao);

  @override
  Future<Result<List<ToDo>>> fetchToDos(bool forceUpdate) => executeSafe(
        () async {
          if (forceUpdate || _appDao.isEmpty()) {
            final res = await _apiService.getToDos();
            final toDos = res.toEntityList();
            _appDao.clearAll();
            _appDao.saveAll(toDos.toModelList());
            return toDos;
          } else {
            final cachedToDos = _appDao.getAll();
            return cachedToDos.toEntityList();
          }
        },
      );

  @override
  Future<Result<void>> create(String text) => executeSafe(
        () async {
          final res = await _apiService.createToDo(CreateToDo(text: text));
          final newTodo = res.toEntity();
          _appDao.save(newTodo.toModel());
        },
      );

  @override
  Future<Result<void>> update(String id) => executeSafe(
        () async {
          final res = await _apiService.updateToDo(id);
          final updatedTodo = res.toEntity();
          _appDao.update(updatedTodo.toModel());
        },
      );

  @override
  Future<Result<void>> delete(String id) => executeSafe(
        () async {
          await _apiService.delete(id);
          _appDao.delete(id);
        },
      );
}
