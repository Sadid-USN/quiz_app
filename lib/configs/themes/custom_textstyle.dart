import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';

TextStyle cardTitle(context) => TextStyle(
    color: ChangeBrightness.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).textTheme.bodyText1!.color,
    fontSize: 20.0,
    fontWeight: FontWeight.bold);
