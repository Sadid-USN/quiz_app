import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/sub_theme_mixin.dart';

const Color bodyDarkTextColor = Colors.white;

class DartkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    ThemeData.dark();
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      primaryColor: startPrimaryColorLight,
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: bodyDarkTextColor,
        displayColor: bodyDarkTextColor,
      ),
    );
  }
}

const Color startPrimaryDarkColor = Color(0XFF380036);
const Color endtPrimaryDarkColor = Color(0XFF0cbaba);

const Color startPrimaryColorLight = Color(0xff2193b0);
const Color endPrimaryColorLight = Color(0XFFffc3a0);

const Color bodyLightTextColor = Color.fromARGB(255, 40, 40, 40);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextTheme().apply(
          bodyColor: bodyLightTextColor,
          displayColor: bodyLightTextColor,
        ));
  }
}
