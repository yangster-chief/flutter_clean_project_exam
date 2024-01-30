import 'package:flutter/material.dart';
import 'package:flutter_project_exam/domain/entity/todo.dart';
import 'package:flutter_project_exam/screen/riverpod/todo_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// flutter_project_exam
/// File Name: my_home_page
/// Created by sujangmac
///
/// Description:
///

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  void _addNewTodo() async {
    final text = await _showAddToDoDialog();
    if (text != null && text.isNotEmpty) {
      ref.read(todoListProvider.notifier).createTodo(text);
    }
  }

  void _toggleToDoStatus(ToDo toDo) {
    ref.read(todoListProvider.notifier).updateTodo(toDo.id);
  }

  Future<String?> _showAddToDoDialog() {
    TextEditingController controller = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New ToDo'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter ToDo text here'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('Add')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('ToDo List')),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.read(todoListProvider.notifier).fetchTodoList(true);
          },
          child: ref.watch(todoListProvider).when(
                data: (data) => ListView(
                  children: data
                      .map(
                        (toDo) => ToDoItem(toDo,
                            onChecked: () => _toggleToDoStatus(toDo)),
                      )
                      .toList(),
                ),
                error: (error, stack) => Text('Error: $error'),
                loading: () => const CircularProgressIndicator(),
              ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addNewTodo,
          tooltip: 'Add ToDo',
          child: const Icon(Icons.add),
        ),
      );
}

class ToDoItem extends StatelessWidget {
  final ToDo toDo;
  final VoidCallback onChecked; // Callback for when the item is checked
  const ToDoItem(this.toDo, {super.key, required this.onChecked});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(toDo.text),
        leading: Checkbox(
          value: toDo.done,
          onChanged: (bool? value) => onChecked(),
        ),
      );
}
