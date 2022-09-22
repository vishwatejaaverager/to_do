import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/todo/todo_controller/todo_controller.dart';
import 'package:to_do/features/todo/todo_repository/todo_provider.dart';
import 'package:to_do/features/todo/widgets/todo_widget.dart';
import 'package:to_do/model/todo_model.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider).allTodos();
    return ListView.separated(
      separatorBuilder: (context, index) => Container(
        height: 8,
      ),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        print(todos.length);
        return TodoWidget(todo: todos[index]);
      },
    );
  }
}
