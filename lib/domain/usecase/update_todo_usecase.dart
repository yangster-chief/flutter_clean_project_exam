import 'package:flutter_project_exam/core/result.dart';
import 'package:flutter_project_exam/domain/todo_repository.dart';
import 'package:flutter_project_exam/domain/usecase.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_project_exam
/// File Name: update_todo_usecase
/// Created by sujangmac
///
/// Description:
///
@injectable
class UpdateToDoUseCase implements UseCase<void, String> {
  final ToDoRepository _toDoRepository;

  const UpdateToDoUseCase(this._toDoRepository);

  @override
  Future<void> call(
    String params, {
    required ResultErrorCallback onError,
  }) async {
    final res = await _toDoRepository.update(params);
    if (res is ResultError) {
      onError(res.error!);
    }
  }
}
