import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<bool> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    bool result = await prefs.setString('theme', theme);
    return result;
  }

  static Future<String?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String? themeVal = prefs.getString("theme");
    return themeVal;
  }
}
