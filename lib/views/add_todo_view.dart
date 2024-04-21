import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_utils/app_utils.dart';
import 'package:todoapp/widgets/text_field_widget.dart';

import '../app_utils/contestants.dart';
import '../model/todo_model.dart';
import '../services/state_managment/todo_provider.dart';
import '../widgets/format_date_widget.dart';

class AddTodoView extends StatefulWidget {
  const AddTodoView({Key? key}) : super(key: key);

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final titleCon = TextEditingController();
  final descCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM yyyy h:mm a').format(now);
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppUtils.saveText(onTap: () {
            if (titleCon.text.isEmpty) {
              AppUtils.showSnackBarFun(context, "Please Enter Todo Title");
            } else if (descCon.text.isEmpty) {
              AppUtils.showSnackBarFun(
                  context, "Please Enter Todo Description");
            } else {
              addTodo();
            }
          })
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          FormatDateWidget(
            date: formattedDate,
          ),
          TextFieldWidget(
            focus: true,
            controller: titleCon,
            hintText: "Title",
            maxLength: 20,
            hintStyle: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w800,
                color: greyColr,
                letterSpacing: 1.1),
            maxLines: null,
          ),
          TextFieldWidget(
            focus: false,
            controller: descCon,
            hintText: "Write your Note here...",
            maxLength: null,
            hintStyle: TextStyle(
                fontSize: 18.0, color: greyColr, fontWeight: FontWeight.w700),
            maxLines: null,
          ),
        ],
      ),
    );
  }

  void addTodo() {
    final provider = Provider.of<TodoProvider>(context, listen: false);
    final model = TodoModel(
      dateTime: DateTime.now(),
      title: titleCon.text.trim(),
      description: descCon.text.trim(),
      isCompleted: false,
    );
    provider.addTodo(model);
    titleCon.clear();
    descCon.clear();
    AppUtils.showSnackBarFun(context, "Todo Added Success");
    Navigator.pop(context);
  }
}
