import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';
import 'package:quizapp/firebase/loading_status.dart';
import 'package:quizapp/firebase/refrences.dart';
import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/screens/home/home_screen.dart';
import 'package:quizapp/screens/result_screen.dart';

//! 3:15
class QuestionsController extends GetxController {
  final loadingSatatus = LoadingStatus.loading.obs;
  late QuestionModel questionModel;
  final allQuestions = <Questions>[];
  final questionIndex = 0.obs;

  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;

  Rxn<Questions> currentQuestion = Rxn<Questions>();

  //! Timer
  Timer? _timer;
  int remainSeconds = 1;
  final time = '00.00'.obs;

  @override
  void onReady() {
    super.onReady();

    // ignore: no_leading_underscores_for_local_identifiers
    final _questionModel = Get.arguments as QuestionModel;
    loadData(_questionModel);
    print('.......On Readt......');

    update();
  }

  Future<void> loadData(QuestionModel questionPaper) async {
    questionModel = questionPaper;
    loadingSatatus.value = LoadingStatus.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery = await questionRF
          .doc(questionModel.id)
          .collection('Quizquestions')
          .get();
      final questions = questionQuery.docs
          .map((questionSnapshot) => Questions.fromSnapshot(questionSnapshot))
          .toList();
      questionPaper.questions = questions;
      // ignore: no_leading_underscores_for_local_identifiers
      for (Questions _questions in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionRF
                .doc(questionPaper.id)
                .collection('Quizquestions')
                .doc(_questions.id)
                .collection('answers')
                .get();

        final answers = answersQuery.docs
            .map((answerSnapshot) => Answers.fromSnapshot(answerSnapshot))
            .toList();

        _questions.answers = answers;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    if (questionPaper.questions != null &&
        questionPaper.questions!.isNotEmpty) {
      allQuestions.assignAll(questionPaper.questions!);
      currentQuestion.value = questionPaper.questions![0];
      _startTimer(questionPaper.timeSeconds);
      print('.........START TIMER........');
      loadingSatatus.value = LoadingStatus.completed;
    } else {
      loadingSatatus.value = LoadingStatus.error;
    }
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answer_list']);
  }

  String get checkCompletedTest {
    final answered = allQuestions
        .where((element) => element.selectedAnswer != null)
        .toList()
        .length;
    return '$answered out of ${allQuestions.length} answered';
  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length - 1) return;
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void prevQuestion() {
    if (questionIndex.value <= 0) return;
    questionIndex.value--;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void jumpToQuestion(int index, {bool isGoback = true}) {
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];

    if (isGoback) {
      Get.back();
    }
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainSeconds ~/ 60;
        int seconds = remainSeconds % 60;
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
      }
    });
  }

  void completed() {
    _timer!.cancel();
    Get.offAndToNamed(ResultScreen.routName);
  }

  void tryAgain() {
    Get.find<FirebaseStorageController>().navigateToQuestions(
        context: Get.context!, paper: questionModel, tryAgain: true);
  }

  void navigateToHome() {
    _timer!.cancel();
    Get.offNamedUntil(HomeScreen.routName, (route) => false);
  }
}
