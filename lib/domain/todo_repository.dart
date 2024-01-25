import 'package:flutter_project_exam/domain/entity/todo.dart';

///
/// flutter_project_exam
/// File Name: todo_repository
/// Created by sujangmac
///
/// Description:
///
abstract class ToDoRepository {
  Future<List<ToDo>> fetchToDos();
  Future<ToDo> create(ToDo toDo);
  Future<ToDo> update(ToDo toDo);
  Future<void> delete(String id);
  void dispose();
}
