import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/theme.dart';
import 'package:quizapp/generated/l10n.dart';
import 'package:quizapp/widgets/app_circul_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration:  BoxDecoration(
       color: onSurface.withOpacity(0.8),
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
          Text(
            S.of(context).introduction,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
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
