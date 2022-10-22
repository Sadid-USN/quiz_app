import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/auth_controller.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';
import 'package:quizapp/firebase/refrences.dart';

extension ResultControllerExtension on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnswerQuestions {
    return '$correctQuestionCount correct answers out of ${allQuestions.length}';
  }

  String get points {
    var points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionModel.timeSeconds - remainSeconds) /
        questionModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveTestReuslts() async {
    var batch = fireStore.batch();
    User? user = Get.find<AuthController>().getUser();
    if (user == null) return;
    batch.set(
        userRef
            .doc(user.email)
            .collection('myrecent_tests')
            .doc(questionModel.id),
        {
          "points": points,
          "correct_answer": "$correctQuestionCount/${allQuestions.length}",
          "question_id": questionModel.id,
          "time": questionModel.timeSeconds - remainSeconds,
        });
    batch.commit();
    navigateToHome();
  }
}
