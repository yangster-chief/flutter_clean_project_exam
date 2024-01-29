import 'package:flutter_project_exam/core/result.dart';
import 'package:flutter_project_exam/domain/entity/todo.dart';

///
/// flutter_project_exam
/// File Name: todo_repository
/// Created by sujangmac
///
/// Description:
///
abstract class ToDoRepository {
  Future<Result<List<ToDo>>> fetchToDos(bool forceUpdate);
  Future<Result<void>> create(String text);
  Future<Result<void>> update(String id);
  Future<Result<void>> delete(String id);
}
