import 'package:flutter/material.dart';
import 'package:to_do/features/todo/todo_controller/todo_controller.dart';
import 'package:to_do/features/todo/todo_repository/todo_provider.dart';
import 'package:to_do/features/todo/widgets/todo_form_widget.dart';
import 'package:to_do/model/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTodoDialogWidget extends ConsumerStatefulWidget {
  const AddTodoDialogWidget({super.key});

  @override
  ConsumerState<AddTodoDialogWidget> createState() =>
      _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends ConsumerState<AddTodoDialogWidget> {
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          Text(
            'Add Todo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: 8,
          ),
          TodoFormWidget(
              onChangedTitle: (title) => setState(() => this.title),
              onChangedDescription: (description) =>
                  setState(() => this.description),
              onSavedTodo: addTodo)
        ],
      ),
    );
  }

  void addTodo() {
    final todo = Todo(
        createdTime: DateTime.now(), title: title, description: description,isDone: false);

    Navigator.of(context).pop();
  }
}
