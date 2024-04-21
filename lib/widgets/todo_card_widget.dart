import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todoapp/model/todo_model.dart';

import '../app_utils/app_utils.dart';
import '../app_utils/contestants.dart';
import '../views/edit_todo_view.dart';

class TodoListTile extends StatefulWidget {
  final TodoModel todo;
  const TodoListTile({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoListTile> createState() => _TodoListTileState();
}

class _TodoListTileState extends State<TodoListTile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            widget.todo.delete();
            AppUtils.showSnackBarFun(context, "Todo Deleted Success.");
          },
          backgroundColor: defaultColor,
          icon: Icons.delete,
          label: 'Delete',
        ),
        SlidableAction(
          onPressed: (context) {
            Get.to(
              () => EditTodoView(
                todoModel: widget.todo,
                title: widget.todo.title,
                des: widget.todo.description,
              ),
            );
          },
          backgroundColor: Colors.black,
          icon: Icons.edit,
          label: 'Update',
        ),
      ]),
      child: ListTile(
        title: Text(
          widget.todo.title,
          style: TextStyle(
              decoration: widget.todo.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontSize: 18.0,
              fontFamily: 'nunito-bold',
              letterSpacing: 0.2),
        ),
        subtitle: Text(
          widget.todo.description,
          style: const TextStyle(
            fontSize: 14.8,
          ),
        ),
        trailing: Checkbox(
          value: widget.todo.isCompleted,
          onChanged: (value) {
            widget.todo.isCompleted = value!;
            if (widget.todo.isCompleted) {
              AppUtils.showSnackBarFun(context, "Todo Completed Success.");
            }
            widget.todo.save();
          },
        ),
      ),
    );
  }
}
