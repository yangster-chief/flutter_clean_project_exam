import 'package:flutter_project_exam/core/result.dart';
import 'package:flutter_project_exam/domain/entity/todo.dart';
import 'package:flutter_project_exam/domain/todo_repository.dart';
import 'package:flutter_project_exam/domain/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_project_exam
/// File Name: get_todo_list_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class GetToDoListUseCase implements UseCase<List<ToDo>, bool> {
  final ToDoRepository _toDoRepository;

  const GetToDoListUseCase(this._toDoRepository);

  @override
  Future<List<ToDo>> call(
    bool params, {
    required ResultErrorCallback onError,
  }) async {
    final res = await _toDoRepository.fetchToDos(params);
    if (res is ResultError) {
      onError(res.error!);
    }
    return res.data ?? [];
  }
}
