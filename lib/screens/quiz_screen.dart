import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';
import 'package:quizapp/firebase/loading_status.dart';
import 'package:quizapp/screens/result_screen.dart';
import 'package:quizapp/screens/test_overview_screen.dart';
import 'package:quizapp/widgets/cards/answer_card.dart';
import 'package:quizapp/widgets/bg_decoration.dart';
import 'package:quizapp/widgets/countdown_timer.dart';

//!
class QuizScreen extends GetView<QuestionsController> {
  const QuizScreen({Key? key}) : super(key: key);
  static const String routeName = '/quizscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.center,
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1.2, color: Colors.white),
                ),
                child: Obx(
                  () => CountDownTimer(
                    time: controller.time.value,
                    color: Colors.white,
                  ),
                )),
            Obx(
              () => Text(
                'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
                style: appBarText,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(TestOverviewScreen.routName);
              },
              child: SvgPicture.asset(
                AppAssets.muneLeft,
                color: Colors.white,
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
      ),
      body: BgDecoration(
        showGradient: true,
        child: Obx(
          () => SafeArea(
            child: Column(
              children: [
                if (controller.loadingSatatus.value == LoadingStatus.loading)
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2 * 0.5,
                      child: Lottie.asset(
                        AppAssets.loading,
                      ),
                    ),
                  ),
                if (controller.loadingSatatus.value == LoadingStatus.completed)
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        height: MediaQuery.of(context).size.height / 2 * 1.7,
                        decoration: BoxDecoration(
                          color: Colors.brown.withOpacity(0.4),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
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
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.only(top: 30),
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .currentQuestion.value!.answers.length,
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 16.0,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      final answer = controller.currentQuestion
                                          .value!.answers[index];
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
                  ),
                SizedBox(
                  height: 90,
                  child: ColoredBox(
                    color: Colors.brown.withOpacity(0.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          replacement: const SizedBox(
                            height: 50,
                            width: 50,
                          ),
                          visible: controller.isFirstQuestion,
                          child: GestureDetector(
                            onTap: () {
                              controller.prevQuestion();
                            },
                            child: AnimatedContainer(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              duration: const Duration(milliseconds: 300),
                              child: SvgPicture.asset(
                                AppAssets.arrowbeack,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Visibility(
                          replacement: const SizedBox(
                            height: 50,
                            width: 50,
                          ),
                          visible: controller.loadingSatatus.value ==
                              LoadingStatus.completed,
                          child: GestureDetector(
                            onTap: () {
                              controller.isLastQuestion
                                  ? Get.toNamed(ResultScreen.routName)
                                  : controller.nextQuestion();
                            },
                            child: AnimatedContainer(
                              decoration: BoxDecoration(
                                  color: controller.questionIndex.isEven
                                      ? Colors.lightBlue.withOpacity(0.4)
                                      : Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              alignment: Alignment.center,
                              height: 50,
                              width:
                                  MediaQuery.of(context).size.width / 2 * 1.3,
                              duration: const Duration(milliseconds: 200),
                              child: Text(
                                controller.isLastQuestion
                                    ? "Completed"
                                    : "Next",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
