import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';
import 'package:quizapp/configs/themes/theme.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';

import 'package:quizapp/widgets/cards/answer_card.dart';

//!
class QustionNumberCard extends StatelessWidget {
  const QustionNumberCard({
    Key? key,
    required this.index,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final AnswerStatus? status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color bgColor = Theme.of(context).primaryColor;
    switch (status) {
      case AnswerStatus.answered:
        bgColor =
            Get.isDarkMode ? Theme.of(context).cardColor : onSurface;
        break;

      case AnswerStatus.correct:
        onSecondary;
        break;

      case AnswerStatus.wrong:
        bgColor = onSecondary;
        break;
      case AnswerStatus.notanswered:
        bgColor = Get.isDarkMode
            ? onSurface.withOpacity(0.3)
            : onSurface;
        break;

      default:
        bgColor = Theme.of(context).cardColor.withOpacity(
              0.3,
            );
    }
    return InkWell(
      onTap: onTap,
      borderRadius: ChangeBrightness.cardBorderRadius,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: ChangeBrightness.cardBorderRadius,
        ),
        child: Center(
          child: Text(
            "$index",
            style: TextStyle(
              color: status == AnswerStatus.notanswered
                  ? startPrimaryDarkColor
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
