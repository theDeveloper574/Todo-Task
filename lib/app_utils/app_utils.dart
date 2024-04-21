import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../services/state_managment/theme_provider.dart';
import 'contestants.dart';

class AppUtils {
  //home app bar name and change app theme
  static AppBar homeAppBar(Widget widget) {
    return AppBar(
      elevation: 0.0,
      title: const Text(
        "Todos",
        style:
            TextStyle(fontWeight: FontWeight.w700, fontFamily: 'nunito-bold'),
      ),
      actions: [
        Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                value.toggleTheme();
              },
              padding: const EdgeInsets.all(0),
              icon: (value.themeMode == ThemeMode.light)
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            );
          },
        ),
        widget,
      ],
    );
  }

  //make floating action button
  static FloatingActionButton actionButton({required Function() onTap}) {
    return FloatingActionButton(
      backgroundColor: defaultColor,
      onPressed: onTap,
      shape: const CircleBorder(),
      child: Image.asset(
        penIcon,
        scale: 24,
        color: whiteColr,
      ),
    );
  }

  //show save and edit button
  static Widget saveText({required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Text(
          "Save",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: defaultColor,
              letterSpacing: 0.7),
        ),
      ),
    );
  }

  //show snack bar
  static showSnackBarFun(context, text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    SnackBar snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      backgroundColor: defaultColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //no task found
  static Widget noTaskImage(context) {
    return Lottie.asset(noTask, fit: BoxFit.fitWidth);
  }

  //show time and date difference
  static String showTodoTime(DateTime timestamp) {
    try {
      DateTime now = DateTime.now();
      DateTime dateTime = timestamp;
      // Calculate the difference in days
      int differenceInDays = now.difference(dateTime).inDays;

      String formattedDateTime;
      if (differenceInDays == 0) {
        // Display time in AM/PM format
        formattedDateTime = DateFormat.jm().format(dateTime);
      } else {
        // Display the date in "dd/MM/yyyy" format
        formattedDateTime = DateFormat('d MMM').format(dateTime);
        formattedDateTime = '$differenceInDays';
      }
      return formattedDateTime;
    } catch (e) {
      if (kDebugMode) {
        print("Error formatting date and time: $e");
      }
      return 'Error formatting date and time';
    }
  }
}
