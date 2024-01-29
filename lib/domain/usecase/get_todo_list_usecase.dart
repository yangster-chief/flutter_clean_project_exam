import 'package:flutter_project_exam/core/result.dart';
import 'package:flutter_project_exam/domain/entity/todo.dart';
import 'package:flutter_project_exam/domain/repository/todo_repository.dart';
import 'package:flutter_project_exam/domain/usecase.dart';

///
/// flutter_project_exam
/// File Name: get_todo_list_usecase
/// Created by sujangmac
///
/// Description:
///
class GetToDoListUseCase implements UseCase<List<ToDo>, bool> {
  final ToDoRepository _toDoRepository;

  const GetToDoListUseCase(this._toDoRepository);

  @override
  Future<void> call(
    bool params, {
    required ResultSuccessCallback<List<ToDo>> onSuccess,
    required ResultErrorCallback onError,
  }) async {
    final res = await _toDoRepository.fetchToDos(params);
    if (res is ResultSuccess) {
      onSuccess(res.data!);
    } else {
      onError(res.error!);
    }
  }
}
