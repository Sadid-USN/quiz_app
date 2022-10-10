import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';

bool isSelected = false;
TextStyle cardTitle(context) => TextStyle(
    color: ChangeBrightness.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).textTheme.bodyText1!.color,
    fontSize: 20.0,
    fontWeight: FontWeight.bold);

var qustionText = GoogleFonts.ptSerif(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: onSurfaceTextColor,
);
var answerText =
    GoogleFonts.ptSerif(color: isSelected ? onSurfaceTextColor : null);
var appBarText = GoogleFonts.ptSerif(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
  color: startPrimaryDarkColor,
);
