import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';
import 'package:quizapp/configs/themes/theme.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';

bool isSelected = false;



var qustionText = GoogleFonts.ptSerif(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: onSurface,
);
var answerText = GoogleFonts.ptSerif(
  color: isSelected ? onSurface : null,
);
var appBarText = GoogleFonts.ptSerif(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  color: Get.isDarkMode ? startPrimaryDarkColor : onSurface,
);
var friendsText = GoogleFonts.varta(
  fontWeight: FontWeight.normal,
  fontSize: 14.0,
  color: Get.isDarkMode ? startPrimaryDarkColor : onSurface,
);
var headerText = GoogleFonts.ptSerif(
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
  color: Get.isDarkMode ? Colors.white : Colors.cyan,
);
var smallText = GoogleFonts.ptSerif(
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
  color: Get.isDarkMode ? Colors.white : Colors.cyan,
);
