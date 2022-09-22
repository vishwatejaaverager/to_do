import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/todo/todo_repository/todo_provider.dart';
import 'package:to_do/model/todo_model.dart';

final todoControllerProvider = Provider((ref) {
  final todoRepo = ref.watch(todoProvider);
  return TodoController(todosRepository: todoRepo, providerRef: ref);
});

class TodoController {
  final TodosRepository todosRepository;
  final ProviderRef providerRef;

  TodoController({required this.todosRepository, required this.providerRef});

  void addTodo(Todo todo) {
    return todosRepository.addTodo(todo);
  }

  List<Todo> allTodos() {
    return todosRepository.todos;
  }

  void saveUserDataToFirebase(
    BuildContext context,
    String title,
    String description,
    bool isDone,
  ) {
    return todosRepository.saveTodoToFirebase(
        title: title,
        description: description,
        isDone: isDone,
        context: context);
  }
}
