import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';

class CountDownTimer extends StatelessWidget {
  final Color? color;
  final String time;
  const CountDownTimer({
    Key? key,
    this.color,
    required this.time,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Lottie.asset(
          AppAssets.alarm,
          height: 20,
          frameRate: FrameRate.max,
        ),
        Text(
          time,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
