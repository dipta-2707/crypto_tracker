import 'package:shared_preferences/shared_preferences.dart';

class AppSharePref {
  static Future<int> getIntData(String key) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(key) ?? 5;
  }

  static Future<void> putIntData(String key, int value) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }
}
