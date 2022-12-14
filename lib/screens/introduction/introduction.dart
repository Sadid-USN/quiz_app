import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
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
          Lottie.asset(AppAssets.star, height: 40),
          const SizedBox(
            height: 50.0,
            width: 50.0,
          ),
          const Text(
            'Learn English like native speakers so that your speech is beautiful, expressive and natural. The QuizEn app contains most common phrases by taking it you will raise your English to a new level.',
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
              child: Lottie.asset(
                AppAssets.arrowR,
                height: 90,
                width: 90,
              ))
        ],
      ),
    ));
  }
}
