import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/sub_theme_mixin.dart';

const Color bodyDarkTextColor = Colors.white;
const Color startPrimaryDarkColor = Color(0XFF380036);
const Color endtPrimaryDarkColor = Color(0XFF0cbaba);

const Color startPrimaryColorLight = Color(0xff2193b0);
const Color endPrimaryColorLight = Color.fromARGB(255, 255, 154, 104);
Color displayColor = Colors.grey[200]!;

const Color bodyLightTextColor = Color.fromARGB(255, 19, 17, 37);

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

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: displayColor,
        iconTheme: getIconTheme(),
        textTheme: getTextTheme().apply(
          bodyColor: bodyLightTextColor,
          displayColor: displayColor,
        ));
  }
}
