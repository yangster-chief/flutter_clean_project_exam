import 'dart:async';

import 'package:flutter_project_exam/datasource/local/app_dao.dart';
import 'package:flutter_project_exam/datasource/local/model/todo_model.dart';
import 'package:flutter_project_exam/datasource/remote/api_service.dart';
import 'package:flutter_project_exam/domain/entity/todo.dart';
import 'package:flutter_project_exam/domain/todo_repository.dart';
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
  final _toDosController = StreamController<List<ToDo>>();

  ToDoRepositoryImpl(this._apiService, this._appDao);

  Stream<List<ToDo>> get toDosStream => _toDosController.stream;

  void _emitCachedData() {
    final cachedToDos = _appDao.getAll();
    _toDosController.add(cachedToDos.toEntityList());
  }

  @override
  Future<ToDo> create(ToDo toDo) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<List<ToDo>> fetchToDos() {
    // TODO: implement fetchToDos
    throw UnimplementedError();
  }

  @override
  Future<ToDo> update(ToDo toDo) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
