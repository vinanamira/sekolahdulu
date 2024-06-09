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
        title: const Text('To-Do List'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: _todoController.todoBox.listenable(),
          builder: (_, box, __) {
            log(_todoController.todoBox.toString(), name: 'todo');

            if (box.isEmpty) {
              return const Center(
                child: Text('No ToDo :)'),
              );
            } else {
              return GetBuilder<TodoController>(
                builder: (context) => ListView.builder(
                  itemCount: _todoController.todoBox.length,
                  itemBuilder: (context, index) {
                    var todo = _todoController.todoBox.getAt(index);

                    return ListTile(
                      title: Text(todo!.title),
                      subtitle: Text(
                        '${todo.dueDate.day}/${todo.dueDate.month}/${todo.dueDate.year}',
                      ),
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
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 125.0, // Adjust as needed
            right: 16.0,
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
              tooltip: 'Tambah Tugas',
              child: const Icon(Icons.add),
            ),
          ),
        ],
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
        title: Text(widget.isEditing ? 'Edit Tugas' : 'Tambah Tugas Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Judul Tugas'),
              controller: _titleController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Deskripsi Tugas'),
              controller: _descriptionController,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Tanggal Batas: '),
                Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    presentDatePicker(context);
                  },
                  child: const Text('Pilih Tanggal'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
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
              child: Text(widget.isEditing ? 'Simpan Perubahan' : 'Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoDetailScreen extends StatefulWidget {
  const TodoDetailScreen({
    super.key,
    required this.index,
    required this.todo,
  });

  final int index;
  final Todo todo;

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  final TodoController _todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<Todo>(
        stream: _todoController.getSingleTodo(widget.todo.uuid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Judul: ${widget.todo.title}'),
                  Text('Deskripsi: ${widget.todo.description}'),
                  Text(
                    'Tanggal Batas: ${widget.todo.dueDate.day}/${widget.todo.dueDate.month}/${widget.todo.dueDate.year}',
                  ),
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
                                todo: widget.todo,
                                index: widget.index,
                              ),
                            ),
                          );
                        },
                        child: const Text('Edit'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          _todoController.deleteTodo(widget.index);
                          Navigator.pop(context);
                        },
                        child: const Text('Hapus'),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Kembali ke Daftar Tugas'),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
