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
