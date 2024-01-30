import 'package:flutter_project_exam/datasource/remote/model/todo_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

///
/// async_cache_exam
/// File Name: api_service
/// Created by sujangmac
///
/// Description:
///

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/todo")
  Future<List<ToDoResponse>> getToDos();

  @POST("/todo")
  Future<ToDoResponse> createToDo(@Body() Map<String, String> body);

  @PATCH("/todo/{id}")
  Future<ToDoResponse> updateToDo(@Path('id') String id);
}
