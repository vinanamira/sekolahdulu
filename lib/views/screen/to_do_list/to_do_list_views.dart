import 'dart:developer';
import 'package:sekolahdulu/data/local/model/todo.dart';
import 'package:sekolahdulu/data/todo_controller.dart';
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        flexibleSpace: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 40.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Vina',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '17 y.o / 12th Grade',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/profile-pict.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(
                'Daily Task List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Stack(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _todoController.todoBox.listenable(),
                    builder: (_, box, __) {
                      log(_todoController.todoBox.toString(), name: 'todo');
                      if (box.isEmpty) {
                        return const Center(
                          child: Text(
                            'No Task :)',
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      } else {
                        // Sorting todoBox based on dueDate
                        var sortedTodos = _todoController.todoBox.values
                            .toList()
                          ..sort((a, b) => a.dueDate.compareTo(b.dueDate));

                        return GetBuilder<TodoController>(
                          builder: (context) => ListView.builder(
                            itemCount: sortedTodos.length,
                            itemBuilder: (context, index) {
                              var todo = sortedTodos[index];

                              return Card(
                                color: const Color.fromARGB(255, 243, 233, 248),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 16.0,
                                ),
                                child: ListTile(
                                  title: Text(
                                    todo.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
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
                  Padding(
                    padding:
                      const EdgeInsets.only(right: 36.0, bottom: 135.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
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
                        backgroundColor: const Color.fromARGB(255, 243, 233, 248),
                        child: const Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
        title:
            Text(widget.isEditing ? 'Edit Daily Task' : 'Add New Daily Task'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Colors.white,
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
              decoration:
                  const InputDecoration(labelText: 'Daily Task Description'),
              controller: _descriptionController,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Due Date: '),
                Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
    final TodoController todoController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Task Details'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Title: ${todo.title}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Description: ${todo.description}',
                style: const TextStyle(fontSize: 18),
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
                      todoController.deleteTodo(index);
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
      ),
    );
  }
}
