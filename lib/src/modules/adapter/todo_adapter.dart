import 'package:hive/hive.dart';
part 'todo_adapter.g.dart';

@HiveType(typeId: 1)
class TodoItem {
  @HiveField(0)
  final String title;
  @HiveField(1, defaultValue: false)
  late final bool isCompleted;

  TodoItem({required this.title,required this.isCompleted});
}