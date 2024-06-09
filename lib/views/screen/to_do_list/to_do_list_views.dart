import 'dart:developer';
import 'package:assesment2/data/model/todo.dart';
import 'package:assesment2/data/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoController _todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Task List'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: _todoController.todoBox.listenable(),
          builder: (_, box, __) {
            log(_todoController.todoBox.toString(), name: 'todo');

            if (box.isEmpty) {
              return const Center(
                child: Text(
                  'No ToDo :)',
                  style: TextStyle(fontSize: 20),
                ),
              );
            } else {
              return GetBuilder<TodoController>(
                builder: (context) => ListView.builder(
                  itemCount: _todoController.todoBox.length,
                  itemBuilder: (context, index) {
                    var todo = _todoController.todoBox.getAt(index);

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        title: Text(todo!.title,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          'Due: ${todo.dueDate.day}/${todo.dueDate.month}/${todo.dueDate.year}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TodoDetailScreen(
                                todo: todo,
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditTodoScreen(
                isEditing: false,
              ),
            ),
          );
        },
        tooltip: 'Add Daily Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddEditTodoScreen extends StatefulWidget {
  final bool isEditing;
  final Todo? todo;
  final int? index;

  const AddEditTodoScreen({
    super.key,
    required this.isEditing,
    this.index,
    this.todo,
  });

  @override
  State<AddEditTodoScreen> createState() => _AddEditTodoScreenState();
}

class _AddEditTodoScreenState extends State<AddEditTodoScreen> {
  final TodoController _todoController = Get.find();

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime selectedDate;

  var uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    selectedDate = DateTime.now();
  }

  void presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isEditing && widget.todo != null) {
      _titleController.text = widget.todo!.title;
      _descriptionController.text = widget.todo!.description;
      selectedDate = widget.todo!.dueDate;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit Daily Task' : 'Add New Daily Task'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Daily Task Title'),
              controller: _titleController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Daily Task Description'),
              controller: _descriptionController,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Due Date: '),
                Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    presentDatePicker(context);
                  },
                  child: const Text('Pick Date'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('All fields are required'),
                    ),
                  );
                  return;
                }

                if (widget.isEditing) {
                  if (widget.todo != null && widget.index != null) {
                    final oldTodo = widget.todo;

                    final newTodo = Todo(
                      uuid: oldTodo!.uuid,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      dueDate: selectedDate,
                    );

                    _todoController.updateTodo(widget.index!, newTodo);
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                } else {
                  final newTodo = Todo(
                    uuid: uuid.v4(),
                    title: _titleController.text,
                    description: _descriptionController.text,
                    dueDate: selectedDate,
                  );

                  _todoController.addTodo(newTodo);
                  Navigator.pop(context);
                }
              },
              child: Text(widget.isEditing ? 'Save Changes' : 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({
    super.key,
    required this.index,
    required this.todo,
  });

  final int index;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final TodoController _todoController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Task Details'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Title: ${todo.title}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${todo.description}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Due Date: ${todo.dueDate.day}/${todo.dueDate.month}/${todo.dueDate.year}',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEditTodoScreen(
                          isEditing: true,
                          todo: todo,
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _todoController.deleteTodo(index);
                    Navigator.pop(context);
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Daily Task List'),
            ),
          ],
        ),
      ),
    );
  }
}
