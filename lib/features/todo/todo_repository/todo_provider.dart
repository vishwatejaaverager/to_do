import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/model/todo_model.dart';

final todoProvider = Provider(((ref) => TodosRepository(
    auth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance)));
//final mypro = StateNotifierProvider((ref) => myNotifier());
//final counterProvider = StateNotifierProvider<todoProvider, int>((ref) => Counter(ref));

class TodosRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firebaseFirestore;

  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'title'),
    Todo(createdTime: DateTime.now(), title: 'title', description: "ok ok ok"),
    Todo(createdTime: DateTime.now(), title: 'ck'),
    Todo(createdTime: DateTime.now(), title: 'che'),
  ];

  TodosRepository({required this.auth, required this.firebaseFirestore});

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void saveTodoToFirebase(
      {Todo todo
      required BuildContext context}) async {
    try {
      String uid = auth.currentUser!.uid;
      var todo = Todo(
          createdTime: DateTime.now(),
          title: todo.title,
          description: description,
          isDone: isDone);

      await firebaseFirestore.collection('users').doc(uid).set(todo.toMap());
    } catch (e) {
      print(e);
    }
  }
}
