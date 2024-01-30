import 'package:flutter_project_exam/domain/entity/todo.dart';
import 'package:flutter_project_exam/domain/usecase/create_todo_usecase.dart';
import 'package:flutter_project_exam/domain/usecase/get_todo_list_usecase.dart';
import 'package:flutter_project_exam/domain/usecase/update_todo_usecase.dart';
import 'package:flutter_project_exam/injector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

///
/// flutter_project_exam
/// File Name: todo_list_notifier
/// Created by sujangmac
///
/// Description:
///

part 'todo_list_notifier.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<ToDo>> build() async {
    final getList = locator<GetToDoListUseCase>();
    final data = await getList(true, onError: (error) {
      state = AsyncError(error, StackTrace.empty);
    });
    return data;
  }

  void fetchTodoList(bool forceUpdate) async {
    final getList = locator<GetToDoListUseCase>();

    final data = await getList(forceUpdate, onError: (error) {
      state = AsyncError(error, StackTrace.empty);
    });

    state = AsyncData(data);
  }

  void createTodo(String text) async {
    final create = locator<CreateToDoUseCase>();

    await create(text, onError: (error) {
      state = AsyncError(error, StackTrace.empty);
    });

    final getList = locator<GetToDoListUseCase>();

    final data = await getList(false, onError: (error) {
      state = AsyncError(error, StackTrace.empty);
    });
    state = AsyncData(data);
  }

  void updateTodo(String id) async {
    final update = locator<UpdateToDoUseCase>();

    await update(id, onError: (error) {
      state = AsyncError(error, StackTrace.empty);
    });

    final getList = locator<GetToDoListUseCase>();

    final data = await getList(false, onError: (error) {
      state = AsyncError(error, StackTrace.empty);
    });
    state = AsyncData(data);
  }
}
