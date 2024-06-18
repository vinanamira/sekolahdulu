import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String uuid;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime dueDate;
  @HiveField(4) // Add the new field here
  bool isCompleted;

  Todo({
    required this.uuid,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false, // Default value
  });

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      uuid: json['uuid'],
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      isCompleted: json['isCompleted'],
    );
  }

  @override
  String toString() {
    return 'Todo{uuid: $uuid, title: $title, description: $description, dueDate: $dueDate, isCompleted: $isCompleted}';
  }
}
