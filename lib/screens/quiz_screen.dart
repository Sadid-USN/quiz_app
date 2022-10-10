import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quizapp/common/custom_app_bar.dart';
import 'package:quizapp/common/question_scelton.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';
import 'package:quizapp/firebase/loading_status.dart';
import 'package:quizapp/screens/Login/auth_button.dart';
import 'package:quizapp/widgets/answer_card.dart';
import 'package:quizapp/widgets/bg_decoration.dart';

//!
class QuizScreen extends GetView<QuestionsController> {
  const QuizScreen({Key? key}) : super(key: key);
  static const String routeName = '/quizscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const Text('Timer'),
        showActionIcon: true,
        titleWidget: Obx(
          () => Text(
            'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
            style: appBarText,
          ),
        ),
      ),
      body: BgDecoration(
          showGradient: true,
          child: Obx(() => SafeArea(
                child: Column(
                  children: [
                    if (controller.loadingSatatus.value ==
                        LoadingStatus.loading)
                      const Expanded(
                        child: QuestionScelton(),
                      ),
                    if (controller.loadingSatatus.value ==
                        LoadingStatus.completed)
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  controller.currentQuestion.value!.question,
                                  style: qustionText,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              GetBuilder<QuestionsController>(
                                  id: "answer_list",
                                  builder: (controller) {
                                    return ListView.separated(
                                      padding: const EdgeInsets.only(top: 30),
                                      shrinkWrap: true,
                                      itemCount: controller.currentQuestion
                                          .value!.answers.length,
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          height: 10.0,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        final answer = controller
                                            .currentQuestion
                                            .value!
                                            .answers[index];
                                        return AnswerCard(
                                          answer:
                                              '${answer.identifier}. ${answer.answer}',
                                          onTap: () {
                                            controller.selectedAnswer(
                                                answer.identifier);
                                          },
                                          isSelected: answer.identifier ==
                                              controller.currentQuestion.value!
                                                  .selectedAnswer,
                                        );
                                      },
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 100,
                      child: ColoredBox(
                        color: onSurfaceTextColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: controller.isFirstQuestion,
                              child: GestureDetector(
                                onTap: () {
                                  controller.prevQuestion();
                                },
                                child: Card(
                                  child: SvgPicture.asset(
                                    AppAssets.arrowbeack,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                                replacement: const SizedBox.shrink(),
                                visible: controller.loadingSatatus.value ==
                                    LoadingStatus.completed,
                                child: AuthButton(
                                    onPressed: () {
                                      controller.isLastQuestion
                                          ? const SizedBox()
                                          : controller.nextQuestion();
                                    },
                                    title: controller.isLastQuestion
                                        ? "Completed"
                                        : "Next",
                                    height: 50,
                                    width: MediaQuery.of(context).size.width /
                                        2 *
                                        1.3)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
