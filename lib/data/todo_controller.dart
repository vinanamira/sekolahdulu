import 'package:sekolahdulu/data/local/todo_db.dart';
import 'package:sekolahdulu/data/local/model/todo.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class TodoController extends GetxController {
  late Box<Todo> todoBox;

  @override
  void onInit() async {
    super.onInit();
    todoBox = TodoDB.todoBox;
  }

  Stream<Todo> getSingleTodo(String uuid) async* {
    yield TodoDB.getTodoByUuid(uuid);
  }

  Future<void> addTodo(Todo todo) async {
    final Todo newTodo = Todo(
      uuid: todo.uuid,
      title: todo.title,
      description: todo.description,
      dueDate: todo.dueDate,
    );

    await TodoDB.insertTodo(newTodo);
  }

  Future<void> updateTodo(int index, Todo todo) async {
    final Todo newTodo = Todo(
      uuid: todo.uuid,
      title: todo.title,
      description: todo.description,
      dueDate: todo.dueDate,
    );

    await TodoDB.updateTodo(index, newTodo);
  }

  Future<void> deleteTodo(int index) async {
    await TodoDB.deleteTodo(index);
  }
}
