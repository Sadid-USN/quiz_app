import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/common/custom_app_bar.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';
import 'package:quizapp/screens/Login/auth_button.dart';
import 'package:quizapp/screens/quiz_screen.dart';
import 'package:quizapp/widgets/bg_decoration.dart';
import 'package:quizapp/widgets/cards/answer_card.dart';
import 'package:quizapp/widgets/cards/question_number_card.dart';
import 'package:quizapp/widgets/content_area.dart';
import 'package:quizapp/widgets/countdown_timer.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({Key? key}) : super(key: key);

  static const String routName = '/testoverview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              Get.toNamed(QuizScreen.routeName);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
        ),
        title: controller.checkCompletedTest,
      ),
      body: BgDecoration(
        showGradient: true,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              ContetArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CountDownTimer(
                            color: ChangeBrightness.isDarkMode()
                                ? Theme.of(context).textTheme.bodyText1!.color
                                : Theme.of(context).primaryColor,
                            time: ' ',
                          ),
                          Obx(() => Text(
                                '${controller.time} Remaining',
                                style: appBarText,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Expanded(
                      child: GridView.builder(
                          itemCount: controller.allQuestions.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 75,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            AnswerStatus? answerStatus;
                            if (controller.allQuestions[index].selectedAnswer !=
                                null) {
                              answerStatus = AnswerStatus.answered;
                            }

                            return QustionNumberCard(
                              index: index + 1,
                              status: answerStatus,
                              onTap: () {
                                controller.jumpToQuestion(
                                  index,
                                );
                              },
                            );
                          }),
                    ),
                    AuthButton(
                      title: 'Completed',
                      width: 200,
                      height: 40,
                      onPressed: () {
                        controller.completed();
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2 * 0.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
