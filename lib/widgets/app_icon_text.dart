import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppIconAndText extends StatelessWidget {
  final Widget text_1;
  final Widget text_2;
  const AppIconAndText({
    Key? key,
    required this.text_1,
    required this.text_2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.quiz_outlined,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.deepOrange,
        ),
        text_1,
        Icon(
          Icons.timer_outlined,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.deepOrange,
        ),
        text_2
      ],
    );
  }
}
