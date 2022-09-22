import 'package:flutter/material.dart';
import 'package:to_do/features/todo/todo_screens/add_screen.dart';
import 'package:to_do/features/todo/widgets/todo_list_widget.dart';
import 'package:to_do/features/todo/widgets/todo_widget.dart';



class TodoScreen extends StatefulWidget {
  static const routname = '/todo-screen';
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [TodoListWidget(), Container()];
    return Scaffold(
      appBar: AppBar(
        title: Text("TO-dos"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: ((value) => setState(() {
              selectedIndex = value;
            })),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'Todos'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'completed')
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
         onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
