import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/theme.dart';

mixin SubThemeData {
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
        ),
      ),
    );
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: onSurface, size: 40.0);
  }
}
