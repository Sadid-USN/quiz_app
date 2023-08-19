import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/controller/auth_controller.dart';
import 'package:quizapp/firebase/refrences.dart';
import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/screens/home/home_screen.dart';
import 'package:quizapp/screens/quiz_screen.dart';
import 'package:quizapp/services/faribase_storage_service.dart';

class FirebaseStorageController extends GetxController {
  //FirebaseStorageController controller = Get.put(FirebaseStorageController());
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
    getAllPapers();

    super.onReady();
  }

  Future<bool> exitDialog() {
    Get.defaultDialog(
      buttonColor: Colors.transparent,
      // contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      textConfirm: 'Exit',
      confirmTextColor: Colors.indigo,
      onConfirm: () {
        SystemNavigator.pop();
      },

      onCancel: () {},
      title: "",
      middleText: "Are you sure you want to go out?",
      backgroundColor: onSurfaceTextColor,
      titleStyle: const TextStyle(color: Colors.indigo),
      middleTextStyle: const TextStyle(color: Colors.indigo),
    );
    return Future.value(true);
  }

  toggleDrawer() {
    print("Drawer Toggled");
    zoomDrawerController.toggle?.call();
    update();
  }

  final allPapers = <QuestionModel>[].obs;

  Future<void> getAllPapers() async {
    try {
      // Here we get description from our papers from firebase
      QuerySnapshot<Map<String, dynamic>> data = await questionRF.get();
      final paperList = data.docs
          .map(
            (paper) => QuestionModel.fromSnapshot(paper),
          )
          .toList();
      allPapers.assignAll(paperList);
      //
      for (var paper in paperList) {
        final String? imgUrl =
            //Here based on title name we will get the image name
            await Get.find<FirebaseStorageService>().getImage(paper.image);
        // paper.image = imgUrl!;
        allPapers.assignAll(paperList);

        // print(imgUrl);
      }
    } catch (e) {
      print(e);
    }
  }

  gotHomeScreen() {
    Get.to(() => const HomeScreen());
  }

  void navigateToQuestions(
      {required QuestionModel paper,
      bool tryAgain = false,
      required BuildContext context}) {
    AuthController authController = Get.find();
    if (authController.isLogged()) {
      if (tryAgain) {
        Get.back();

        Get.toNamed(QuizScreen.routeName,
            arguments: paper, preventDuplicates: false);
      } else {
        print('Logged in');
        Get.toNamed(QuizScreen.routeName, arguments: paper);
      }
    } else {
      print(paper.title);
      authController.showLoginDialog(context);
    }
  }
}
