import 'package:hive/hive.dart';
import 'package:todoapp/model/todo_model.dart';

class Boxes {
  static Box<TodoModel> getTodoData() => Hive.box<TodoModel>('todos');
  static deleteTodo(TodoModel todoModel) async {
    await todoModel.delete();
  }
}
