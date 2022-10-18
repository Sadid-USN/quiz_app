import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';

extension ResultControllerExtension on QuestionsController {
  int get correctQuestionCount =>
      allQuestions
          .where((element) => element.selectedAnswer == element.correctAnswer)
          .toList()
          .length +
      1;

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
}
