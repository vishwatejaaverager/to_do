class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String description;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'createdTime': createdTime,
      'title': title,
      'description': description,
      'isDone': isDone
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        createdTime: map['createdTime'],
        title: map['title'],
        description: map['description'],
        isDone: map['isDone']);
  }
}
