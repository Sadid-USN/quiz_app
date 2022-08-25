import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';
import 'package:quizapp/screens/home/quiz_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    FirebaseStorageController _controller =
        Get.put(FirebaseStorageController());
    return Scaffold(
        body: Obx(
      () => ListView.separated(
        separatorBuilder: (BuildContext context, index) {
          return const SizedBox(
            height: 0.0,
          );
        },
        itemBuilder: (BuildContext context, index) {
          //  return Center(
          //       child: Lottie.asset('assets/DB/papers/loadingblue.json'));
          return QuizCard(
            model: _controller.allPapers[index],
          );
        },
        itemCount: _controller.allPapers.length,
      ),
    ));
  }
}
