import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/widgets/app_circul_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: toggleMode(),
      ),
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
          ),
          const SizedBox(
            height: 40.0,
          ),
          const Text(
            'This quiz will help you expand your horizons of knowledge to a new level, choose a quiz from the category that interests you.',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: onSurfaceTextColor,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          AppCirculeButton(
              onTap: () {
                Get.offNamed('home');
              },
              child: const Icon(
                Icons.arrow_forward,
                size: 35.0,
              ))
        ],
      ),
    ));
  }
}
