import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';

const onSurfaceTextColor = Colors.white;

const lightGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    startPrimaryColorLight,
    endPrimaryColorLight,
  ],
);

const darkGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    startPrimaryDarkColor,
    endtPrimaryDarkColor,
  ],
);

LinearGradient toggleMode() =>
    ChangeBrightness.isDarkMode() ? darkGradient : lightGradient;

Color coustomScaffoldColor(BuildContext context) =>
    ChangeBrightness.isDarkMode()
        ? const Color(0xff2e3c62)
        : const Color.fromARGB(255, 240, 237, 255);
