import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';
import 'package:quizapp/controller/auth_controller.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';
import 'package:quizapp/controller/theme_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  late YoutubePlayerController controller;


    ThemeController get themeController => Get.find<ThemeController>();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    initYoutubePlayer();
    super.onReady();
  }

  void initYoutubePlayer() {
    String url = 'https://youtu.be/RDELGWBQRJU';
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          loop: false,
          autoPlay: true,
        ));
  }

  @override
  void dispose() {
    controller.pause();
    controller.dispose();
    super.dispose();
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

  void jsengInstagram() {
    _lounch('https://www.instagram.com/_jseng/');
  }

  void jsengYoutube() {
    _lounch('https://www.youtube.com/channel/UCU15ILVF8onmrmMXwRJqjHg');
  }

  void jsengTelegram() {
    _lounch('https://t.me/jseng_tg');
  }

  void behaEng() {
    _lounch('https://www.instagram.com/beha_en/');
  }

  void zabonomuz() {
    _lounch('https://www.instagram.com/zabonomuz/');
  }

  void salmon() {
    _lounch('https://www.instagram.com/salmon.olmon/');
  }
}
