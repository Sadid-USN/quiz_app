import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/configs/themes/app_colors.dart';

mixin SubThemeData {
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
        ),
      ),
    );
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: onSurfaceTextColor, size: 40.0);
  }
}
