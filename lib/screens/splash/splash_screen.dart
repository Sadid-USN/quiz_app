import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1:48
      backgroundColor: const Color(0xff191928),
      body: Container(
        decoration: BoxDecoration(
          gradient: toggleMode(),
        ),
        alignment: Alignment.center,
        child: Lottie.asset(
          width: 300,
          height: 300,
          'assets/lotties/quiz.json',
        ),

        //  Image.asset(
        //   'assets/images/splashbook.png',
        //   height: 200,
        //   width: 200,
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
