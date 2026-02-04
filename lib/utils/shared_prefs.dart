import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const _key = 'isLoggedIn';

  static Future<void> setLogin(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, status);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
