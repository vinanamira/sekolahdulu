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

  Todo({
    required this.uuid,
    required this.title,
    required this.description,
    required this.dueDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      uuid: json['uuid'],
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
    );
  }

  @override
  String toString() {
    return 'Todo{uuid: $uuid, title: $title, description: $description, dueDate: $dueDate}';
  }
}

