import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  bool isCompleted;
  @HiveField(3)
  DateTime dateTime;
  TodoModel(
      {required this.title,
      required this.description,
      required this.isCompleted,
      required this.dateTime});
}
