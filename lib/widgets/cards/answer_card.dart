import 'package:animate_icons/animate_icons.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';

enum AnswerStatus {
  correct,
  wrong,
  answered,
  notanswered,
}

class AnswerCard extends StatelessWidget {
  QuestionsController controller = Get.put(QuestionsController());
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  AnswerCard({
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
                  : Theme.of(context).cardColor,
              border: Border.all(
                  color: isSelected
                      ? answerSelectedColor()
                      : answerBorderColor())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  answer,
                  style: isSelected ? appBarText : null,
                ),
              ),
              AnimateIcons(
                startIcon: Icons.copy,
                endIcon: Icons.copy,
                controller: controller.animateIconController,
                size: 25.0,
                onStartIconPress: () {
                  FlutterClipboard.copy(answer);

                  return true;
                },
                onEndIconPress: () {
                  return true;
                },
                duration: const Duration(milliseconds: 250),
                startIconColor: Colors.white,
                endIconColor: Colors.white,
                clockwise: false,
              ),
            ],
          ),
        ));
  }
}
