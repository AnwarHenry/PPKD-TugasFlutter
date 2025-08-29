// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

// shared_preference.dart
class PreferenceHandler {
  static const String loginKey = "login";
  static const String tokenKey = "token";

  static Future<void> saveLogin() async {
    // Tambahkan return type Future<void>
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginKey, true);
  }

  static Future<void> saveToken(String token) async {
    // Tambahkan return type Future<void>
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  static Future<bool?> getLogin() async {
    // Tambahkan return type Future<bool?>
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loginKey);
  }

  static Future<String?> getToken() async {
    // Tambahkan return type Future<String?>
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  static Future<void> removeLogin() async {
    // Tambahkan return type Future<void>
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(loginKey);
  }

  static Future<void> removeToken() async {
    // Tambahkan return type Future<void>
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }
}
