import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget(
      {super.key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            SizedBox(
              height: 32,
            ),
            buildDescription(),
            SizedBox(
              height: 32,
            ),
            buildButton()
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      onChanged: onChangedTitle,
      decoration:
          InputDecoration(border: UnderlineInputBorder(), labelText: 'Title'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'This cant be empty';
        }
        return null;
      },
    );
  }

  Widget buildDescription() {
    return TextFormField(
      maxLines: 3,
      initialValue: description,
      onChanged: onChangedDescription,
      decoration:
          InputDecoration(border: UnderlineInputBorder(), labelText: 'Title'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'This cant be empty';
        }
        return null;
      },
    );
  }

  Widget buildButton() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: onSavedTodo,
        child: Text("save"));
  }
}
