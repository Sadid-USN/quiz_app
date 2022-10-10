import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

Color answerSelectedColor() => ChangeBrightness.isDarkMode()
    ? Theme.of(Get.context!).cardColor.withOpacity(0.5)
    : Theme.of(Get.context!).focusColor;

Color answerBorderColor() => ChangeBrightness.isDarkMode()
    ? const Color.fromARGB(255, 239, 29, 151)
    : const Color.fromARGB(255, 221, 221, 221);
