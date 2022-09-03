import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/auth_controller.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  Future<void> _lounch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }

  void email() {
    final Uri emailLauncher = Uri(
      scheme: 'Darul-asar',
      path: 'ulamuyaman@gmail.com',
    );
    //  _lounch(emailLauncher.toString());
    _lounch('https://mail.google.com/mail/u/0/#inbox');
  }

  void instagramm() {
    _lounch('https://www.instagram.com/darul_asar/');
  }

  void facebook() {
    _lounch('https://www.facebook.com/profile.php?id=100004607717199');
  }

  toggleDrawer() {
    Get.find<FirebaseStorageController>().toggleDrawer();
  }

  void youTube() {
    _lounch('https://www.youtube.com/channel/UCR2bhAQKRXDmE4v_rDVNOrA');
  }

  void signIn() {}

  void signOut() {
    Get.find<AuthController>().signOut();
  }
}
