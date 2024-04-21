import 'package:flutter/material.dart';
import 'package:todoapp/app_utils/contestants.dart';

class FormatDateWidget extends StatelessWidget {
  final String date;
  const FormatDateWidget({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        date,
        style: TextStyle(
            fontSize: 14.0,
            color: greyColr.withOpacity(0.8),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8),
      ),
    );
  }
}
