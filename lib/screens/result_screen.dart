import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/common/custom_app_bar.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';
import 'package:quizapp/controller/result_controller.dart';
import 'package:quizapp/widgets/bg_decoration.dart';
import 'package:quizapp/widgets/cards/answer_card.dart';
import 'package:quizapp/widgets/cards/question_number_card.dart';
import 'package:quizapp/widgets/content_area.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({Key? key}) : super(key: key);
//! 4:22
  static const String routName = '/resultscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgDecoration(
        showGradient: true,
        child: Column(
          children: [
            CustomAppBar(
              leading: const SizedBox(height: 80),
              title: controller.correctAnswerQuestions.toString(),
            ),
            Expanded(
              child: ContetArea(
                addPadding: false,
                child: Column(
                  children: [
                    Lottie.asset(
                      AppAssets.cupwinning,
                      height: 100,
                    ),
                    Text(
                      'Congratulation',
                      style: headerText,
                    ),
                    Text(
                      controller.points,
                      style: smallText,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Tab bellow questions numbers to view answers',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: GridView.builder(
                          itemCount: controller.allQuestions.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 75,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (_, index) {
                            final qustions = controller.allQuestions[index];

                            AnswerStatus status = AnswerStatus.notanswered;
                            final selectedAnswer = qustions.selectedAnswer;
                            final correctAnswer = qustions.correctAnswer;
                            if (selectedAnswer == correctAnswer) {
                              status = AnswerStatus.correct;
                            } else if (qustions.selectedAnswer == null) {
                              status = AnswerStatus.wrong;
                            } else {
                              status = AnswerStatus.wrong;
                            }

                            return QustionNumberCard(
                                index: index + 1,
                                status: status,
                                onTap: () {
                                  controller.jumpToQuestion(index,
                                      isGoback: false);
                                });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
