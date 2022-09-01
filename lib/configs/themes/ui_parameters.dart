import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 8.0;
const double _cardBorderRadius = 10.0;
double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;

class ChangeBrightness {
  //
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);
  //

  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }
}
