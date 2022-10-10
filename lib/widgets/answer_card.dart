import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const AnswerCard({
    Key? key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        borderRadius: ChangeBrightness.cardBorderRadius,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
              borderRadius: ChangeBrightness.cardBorderRadius,
              color: isSelected
                  ? answerSelectedColor()
                  : Theme.of(context).canvasColor,
              border: Border.all(
                  color: isSelected
                      ? answerSelectedColor()
                      : answerBorderColor())),
          child: Text(
            answer,
            style: answerText,
          ),
        ));
  }
}
