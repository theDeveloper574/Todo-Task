import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/app_utils/theme.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/services/local_storage.dart';
import 'package:todoapp/services/state_managment/theme_provider.dart';
import 'package:todoapp/services/state_managment/todo_provider.dart';
import 'package:todoapp/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');
  String theme = await LocalStorage.getTheme() ?? 'light';
  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final String theme;
  const MyApp({super.key, required this.theme});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(theme),
        ),
        ChangeNotifierProvider<TodoProvider>(
          create: (context) => TodoProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) {
          return GetMaterialApp(
            title: 'To do',
            themeMode: theme.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
