import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/auth_controller.dart';
import 'package:quizapp/firebase/refrences.dart';
import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/screens/home/home_screen.dart';
import 'package:quizapp/services/faribase_storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

class FirebaseStorageController extends GetxController {
  //FirebaseStorageController controller = Get.put(FirebaseStorageController());
  final zoomDrawerController = ZoomDrawerController();
  GlobalKey<FormState> signUpFormstate = GlobalKey<FormState>();
  // late TextEditingController loginEmail;
  // late TextEditingController loginPassword;
  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  signUp() {
    if (signUpFormstate.currentState!.validate()) {
      print('Validate');
    } else {
      print('not Valid');
    }
  }

  @override
  void onReady() {
    getAllPapers();

    super.onReady();
  }

  toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {}

  void signIn() {}
  void website() {}

  void email() {
    final Uri emailLauncher = Uri(
      scheme: 'Darul-asar',
      path: 'ulamuyaman@gmail.com',
    );
    _lounch(emailLauncher.toString());
  }

  Future<void> _lounch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }

  final allPapers = <QuestionModel>[].obs;

  Future<void> getAllPapers() async {
    // List<String> imageName = [
    //   "pazl",
    //   "question",
    // ];
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
      {required QuestionModel paper, bool tryAgain = false}) {
    AuthController authController = Get.find();
    if (authController.isLogged()) {
      if (tryAgain) {
        Get.back();
        Get.offNamed('');
      } else {
        Get.toNamed('');
      }
    } else {
      print(paper.title);
      authController.showLoginDialog();
    }
  }
}
