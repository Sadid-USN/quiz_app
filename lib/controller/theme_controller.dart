import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';
import 'package:quizapp/configs/themes/theme.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = "isDarkMode";

  bool isDarkMode = false;
  bool loadThemeFromBox() => _box.read(_key) ?? false;

  _saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);

  ThemeMode get themeMode =>
      loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    isDarkMode = loadThemeFromBox();
    _saveTheme(!isDarkMode);
    update();
  }

  ThemeData get themeData {
    bool isDarkMode = loadThemeFromBox();
    return isDarkMode ? Themes.dark : Themes.light;
  }
}
