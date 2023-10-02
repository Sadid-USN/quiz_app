import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quizapp/common/custom_app_bar.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/configs/themes/theme.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';
import 'package:quizapp/screens/result_screen.dart';
import 'package:quizapp/widgets/bg_decoration.dart';
import 'package:quizapp/widgets/cards/answer_card.dart';
import 'package:quizapp/widgets/content_area.dart';

//! 5:30
class AnswerCheckScreen extends GetView<QuestionsController> {
  static const String routName = '/answerChaeckScreen';
  const AnswerCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
              onPressed: () {
                Get.toNamed(ResultScreen.routName);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
              )),
        ),
        showActionIcon: false,
        titleWidget: Obx(
          () => Text(
            'Q ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
            style: appBarText,
          ),
        ),
        onMenuTap: () {},
      ),
      body: BgDecoration(
        showGradient: false,
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ContetArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          Text(
                            controller.currentQuestion.value!.question,
                            style: appBarText,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<QuestionsController>(
                              id: "answer_review_list",
                              builder: (_) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length,
                                  separatorBuilder: (_, index) =>
                                      const SizedBox(
                                    height: 10.0,
                                  ),
                                  itemBuilder: (_, index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];
                                    final selectedAnswer = controller
                                        .currentQuestion.value!.selectedAnswer;
                                    final correctAnswer = controller
                                        .currentQuestion.value!.correctAnswer;

                                    final String answersText =
                                        '${answer.identifier}. ${answer.answer}';
                                    if (correctAnswer == selectedAnswer &&
                                        answer.identifier == selectedAnswer) {
                                      //correct answer
                                      return CorrerctAnswer(
                                          answer: answersText);
                                    } else if (selectedAnswer == null) {
                                      return NotAnswered(
                                        notanswered: answersText,
                                      );
                                      // not selected answer
                                    } else if (correctAnswer !=
                                            selectedAnswer &&
                                        answer.identifier == selectedAnswer) {
                                      //! wrong answer
                                      return WrongAnswer(
                                        wrongAnswer: answersText,
                                      );
                                    } else if (correctAnswer ==
                                        answer.identifier) {
                                      //correct answer
                                      return CorrerctAnswer(
                                        answer: answersText,
                                      );
                                    }
                                    return AnswerCard(
                                      answer: answersText,
                                      onTap: () {},
                                      isSelected: false,
                                    );
                                  },
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CorrerctAnswer extends StatelessWidget {
  final String answer;
  const CorrerctAnswer({
    Key? key,
    required this.answer,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2, color: onSurface)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        answer,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  final String wrongAnswer;
  const WrongAnswer({
    Key? key,
    required this.wrongAnswer,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2, color: onSurface)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        wrongAnswer,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotAnswered extends StatelessWidget {
  final String notanswered;
  const NotAnswered({
    Key? key,
    required this.notanswered,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2, color: onSurface)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        notanswered,
        style: const TextStyle(
          color: onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
