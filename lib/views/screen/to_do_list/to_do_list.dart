import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class Todo {
  String title;
  String description;
  DateTime dueDate;

  Todo({
    required this.title,
    required this.description,
    required this.dueDate,
  });
}

class TodoList extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void updateTodo(Todo oldTodo, Todo newTodo) {
    int index = _todos.indexOf(oldTodo);
    if (index != -1) {
      _todos[index] = newTodo;
      notifyListeners();
    }
  }
}


class _ToDoListScreenState extends State<ToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoList(),
      child: MaterialApp(
        title: 'To-Do List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const TodoListScreen(),
          '/add': (context) => const AddEditTodoScreen(isEditing: false),
          '/detail': (context) => const TodoDetailScreen(),
          '/edit': (context) => const AddEditTodoScreen(isEditing: true),
        },
      ),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todoList = Provider.of<TodoList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: ListView.builder(
        itemCount: todoList.todos.length,
        itemBuilder: (context, index) {
          var todo = todoList.todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(
              '${todo.dueDate.day}/${todo.dueDate.month}/${todo.dueDate.year}',
            ),
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: todo);
            },
          );
        },
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 125.0, // Adjust as needed
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add');
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

  const AddEditTodoScreen({super.key, required this.isEditing});

  @override
  _AddEditTodoScreenState createState() => _AddEditTodoScreenState();
}

class _AddEditTodoScreenState extends State<AddEditTodoScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.isEditing) {
      Todo todo = ModalRoute.of(context)!.settings.arguments as Todo;
      _titleController.text = todo.title;
      _descriptionController.text = todo.description;
      selectedDate = todo.dueDate;
    }
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
    var todoList = Provider.of<TodoList>(context);

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
                final newTodo = Todo(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  dueDate: selectedDate,
                );
                if (widget.isEditing) {
                  Todo oldTodo =
                      ModalRoute.of(context)!.settings.arguments as Todo;
                  todoList.updateTodo(oldTodo, newTodo);
                } else {
                  todoList.addTodo(newTodo);
                }
                Navigator.pop(context);
              },
              child: Text(widget.isEditing ? 'Simpan Perubahan' : 'Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context)!.settings.arguments as Todo;
    var todoList = Provider.of<TodoList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Judul: ${todo.title}'),
            Text('Deskripsi: ${todo.description}'),
            Text(
              'Tanggal Batas: ${todo.dueDate.day}/${todo.dueDate.month}/${todo.dueDate.year}',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit', arguments: todo);
                  },
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    todoList.deleteTodo(todo);
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
      ),
    );
  }
}
