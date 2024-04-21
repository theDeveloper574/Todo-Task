import 'package:flutter/material.dart';

Color greyColr = Colors.grey;
Color whiteColr = Colors.white;
Color defaultColor = const Color(0xff8815AD);
String penIcon = 'asset/pen.png';
String splashImg = 'asset/lunch.png';
String noTask = 'asset/no-task-found.json';
List<Color> tileBorColor = [
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.cyan,
  Colors.pink,
  Colors.teal,
  Colors.brown,
  Colors.indigo, // Indigo color
  Colors.deepOrange, // Deep orange color
  Colors.amber, // Amber color
  Colors.lightBlue, // Light blue color
  Colors.deepPurple, // Deep purple color
  Colors.lime, // Lime color
  Colors.grey, // Grey color
  Colors.black,
];

enum FilterOptions {
  all,
  completed,
  pending,
}
