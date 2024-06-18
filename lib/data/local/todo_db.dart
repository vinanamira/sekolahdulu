import 'package:sekolahdulu/data/local/model/todo.dart';
import 'package:hive/hive.dart';

class TodoDB {
  static Box<Todo> todoBox = Hive.box<Todo>('todo_box');

  static Future<void> init() async {
    await Hive.openBox<Todo>('todo_box');
  }

  static Future<List<Todo>> getAllTodo() async => todoBox.values.toList();

  static Todo getTodoByUuid(String uuid) =>
      todoBox.values.toList().firstWhere((e) => e.uuid == uuid);

  static Future<void> insertTodo(Todo todo) async {
    await todoBox.add(todo);
  }

  static Future<void> updateTodo(
    int index,
    Todo todo,
  ) async {
    await todoBox.putAt(index, todo);
  }

  static Future<void> deleteTodo(int index) async {
    await todoBox.deleteAt(index);
  }
}
