import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'nunito',
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      backgroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    brightness: Brightness.light);

ThemeData darkTheme = ThemeData(
    fontFamily: 'nunito',
    scaffoldBackgroundColor: const Color(0xff15161a),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      backgroundColor: Color(0xff15161a),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    brightness: Brightness.dark);
