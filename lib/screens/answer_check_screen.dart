import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/common/custom_app_bar.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  static const String routName = '/answerChaeckScreen';
  const AnswerCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Row(),
    );
  }
}
