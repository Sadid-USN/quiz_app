import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;
  @override
  void onInit() {
    initThemeData();
    super.onInit();
  }

  initThemeData() {
    _darkTheme = DartkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get dartkTheme => _darkTheme;
  ThemeData get ligthTheme => _lightTheme;
}
