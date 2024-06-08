import 'package:flutter/foundation.dart';

class Todo {
  String title;
  DateTime dueDate;

  Todo({
    required this.title,
    required this.dueDate,
  });
}

class TodoList extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
