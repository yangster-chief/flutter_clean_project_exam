import 'package:flutter_project_exam/domain/entity/todo.dart';
import 'package:hive/hive.dart';

///
/// flutter_project_exam
/// File Name: todo_model
/// Created by sujangmac
///
/// Description:
///

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class ToDoModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final bool done;

  const ToDoModel({required this.id, required this.text, required this.done});
}

extension ToDoModelToEntity on ToDoModel {
  ToDo toEntity() => ToDo(
        id: id,
        text: text,
        done: done,
      );
}

extension ToDoModelListToEntityList on List<ToDoModel> {
  List<ToDo> toEntityList() => map((e) => e.toEntity()).toList();
}
