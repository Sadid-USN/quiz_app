import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quizapp/firebase/loading_status.dart';
import 'package:quizapp/firebase/refrences.dart';
import 'package:quizapp/models/question_model.dart';

class QuestionsController extends GetxController {
  final loadingSatatus = LoadingStatus.loading.obs;
  late QuestionModel questionModel;
  final allQuestions = <Questions>[];
  final questionIndex = 0.obs;

  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;

  Rxn<Questions> currentQuestion = Rxn<Questions>();

  @override
  void onReady() {
    super.onReady();

    // ignore: no_leading_underscores_for_local_identifiers
    final _questionModel = Get.arguments as QuestionModel;
    loadData(_questionModel);
    print(_questionModel.id);

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
        if (questionPaper.questions != null &&
            questionPaper.questions!.isNotEmpty) {
          allQuestions.assignAll(questionPaper.questions!);
          currentQuestion.value = questionPaper.questions![0];
          print(questionPaper.questions![0].question);
          loadingSatatus.value = LoadingStatus.completed;
        } else {
          loadingSatatus.value = LoadingStatus.error;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void selectedAnswer(String? answer) {
    // currentQuestion.value!.selectedAnswer = answer;
    update(['answer_list']);
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
}
