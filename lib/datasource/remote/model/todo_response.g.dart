// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoResponse _$ToDoResponseFromJson(Map<String, dynamic> json) => ToDoResponse(
      id: json['_id'] as String,
      text: json['text'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$ToDoResponseToJson(ToDoResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'done': instance.done,
    };
