import 'package:flutter/material.dart';
import 'package:to_do/model/todo_model.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return buildTodo(context);
  }

  Widget buildTodo(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Colors.blueAccent,
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (_) {
                
              },
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title),
                todo.description.isNotEmpty
                    ? Text(todo.description)
                    : Container()
              ],
            )),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
