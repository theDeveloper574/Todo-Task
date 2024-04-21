import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';

import '../app_utils/app_utils.dart';
import '../app_utils/contestants.dart';
import '../model/todo_model.dart';
import '../widgets/format_date_widget.dart';
import '../widgets/text_field_widget.dart';

class EditTodoView extends StatefulWidget {
  final String title;
  final String des;
  final TodoModel todoModel;
  const EditTodoView(
      {Key? key,
      required this.title,
      required this.des,
      required this.todoModel})
      : super(key: key);

  @override
  State<EditTodoView> createState() => _EditTodoViewState();
}

class _EditTodoViewState extends State<EditTodoView> {
  final title = TextEditingController();
  final des = TextEditingController();
  @override
  Widget build(BuildContext context) {
    title.text = widget.title;
    des.text = widget.des;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM yyyy h:mm a').format(now);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.close,
            size: 32,
          ),
        ),
        actions: [
          AppUtils.saveText(onTap: () async {
            if (title.text.isEmpty) {
              AppUtils.showSnackBarFun(context, "Please Enter Todo Title");
            } else if (des.text.isEmpty) {
              AppUtils.showSnackBarFun(
                  context, "Please Enter Todo Description");
            } else {
              widget.todoModel.title = title.text.trim();
              widget.todoModel.description = des.text.trim();
              widget.todoModel.dateTime = DateTime.now();
              await widget.todoModel.save();
              AppUtils.showSnackBarFun(context, "Update Todo Success");
              Navigator.pop(context);
            }
          })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          FormatDateWidget(
            date: "Edited at: $formattedDate",
          ),
          TextFieldWidget(
            focus: true,
            controller: title,
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
            controller: des,
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
}
