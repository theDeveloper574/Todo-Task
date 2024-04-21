import 'package:flutter/material.dart';

import '../app_utils/contestants.dart';

class TextFieldWidget extends StatelessWidget {
  final dynamic maxLines;
  final dynamic maxLength;
  final String hintText;
  final TextStyle hintStyle;
  final TextEditingController controller;
  final bool focus;
  const TextFieldWidget(
      {Key? key,
      required this.maxLines,
      required this.hintText,
      required this.hintStyle,
      required this.maxLength,
      required this.controller,
      required this.focus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
        autofocus: focus,
        controller: controller,
        textInputAction: TextInputAction.next,
        maxLines: maxLines,
        style: const TextStyle(fontSize: 20.0),
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: defaultColor),
          ),
        ),
      ),
    );
  }
}
