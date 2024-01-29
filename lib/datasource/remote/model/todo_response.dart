import 'package:flutter_project_exam/domain/entity/todo.dart';
import 'package:json_annotation/json_annotation.dart';

///
/// flutter_project_exam
/// File Name: todo_response
/// Created by sujangmac
///
/// Description:
///

part 'todo_response.g.dart';

@JsonSerializable()
class ToDoResponse {
  @JsonKey(name: '_id')
  final String id;
  final String text;
  final bool done;

  const ToDoResponse(
      {required this.id, required this.text, required this.done});

  factory ToDoResponse.fromJson(Map<String, dynamic> json) =>
      _$ToDoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoResponseToJson(this);
}

extension ToDoResponseToEntity on ToDoResponse {
  ToDo toEntity() => ToDo(
        id: id,
        text: text,
        done: done,
      );
}

extension ToDoResponseListToEntityList on List<ToDoResponse> {
  List<ToDo> toEntityList() => map((e) => e.toEntity()).toList();
}
