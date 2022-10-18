import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/sub_theme_mixin.dart';

const Color bodyDarkTextColor = Colors.white;
const Color startPrimaryDarkColor = Color.fromARGB(255, 0, 0, 0);
const Color endtPrimaryDarkColor = Color(0XFF0cbaba);

const Color startPrimaryColorLight = Color(0xff2193b0);
Color answerselectedColor = Colors.cyan.withOpacity(0.3);
const Color greenPrimaryColorLight = Color.fromARGB(255, 130, 189, 127);
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
        bodyColor: startPrimaryDarkColor,
        displayColor: endPrimaryColorLight,
      ),
    );
  }
}

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: greenPrimaryColorLight,
        iconTheme: getIconTheme(),
        textTheme: getTextTheme().apply(
          bodyColor: bodyLightTextColor,
          displayColor: endPrimaryColorLight,
        ));
  }
}
