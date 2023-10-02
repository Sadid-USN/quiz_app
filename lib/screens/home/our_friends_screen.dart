import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/configs/themes/theme.dart';
import 'package:quizapp/controller/zoom_drawer_controller.dart';
import 'package:quizapp/screens/home/home_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class OurFriendsScreen extends GetView<MyZoomDrawerController> {
  const OurFriendsScreen({Key? key}) : super(key: key);

  static const String routName = '/ourfirends';

  void initPlayer() {
    controller.initYoutubePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller.controller),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: onSurface,
          appBar: AppBar(
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Get.toNamed(HomeScreen.routName);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text(
              'JSENG',
              style: appBarText,
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      player,
                      IconButton(
                        onPressed: () {
                          controller.controller.load(YoutubePlayer.convertUrlToId(
                              'https://www.youtube.com/watch?v=VSp6idDyUqU')!);
                        },
                        icon: const Icon(
                          Icons.skip_next,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'English Teachers Olim&Tahmina. Learn English easily with us.',
                    style: appBarText,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Column(
                        children: [
                          Lottie.network(
                              'https://assets9.lottiefiles.com/packages/lf20_2ks3pjua.json',
                              height: 55),
                          const Text(
                            '@_jseng',
                            style: TextStyle(
                                color: onSurface, fontSize: 14),
                          ),
                        ],
                      ),
                      onTap: () {
                        controller.jsengInstagram();
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: [
                          Lottie.network(
                              'https://assets7.lottiefiles.com/packages/lf20_qyft5az6.json',
                              height: 55),
                          const Text(
                            'JSENG',
                            style: TextStyle(
                                color: onSurface, fontSize: 14),
                          ),
                        ],
                      ),
                      onTap: () {
                        controller.jsengYoutube();
                      },
                    ),

                    GestureDetector(
                      child: Column(
                        children: [
                          Lottie.network(
                              'https://assets10.lottiefiles.com/packages/lf20_389fbekn.json',
                              height: 55),
                          const Text(
                            'jseng_tg',
                            style: TextStyle(
                                color: onSurface, fontSize: 14),
                          ),
                        ],
                      ),
                      onTap: () {
                        controller.jsengTelegram();
                      },
                    ),

                    // LouncherButton(
                    //   isPadding: false,
                    //   color: Colors.white,
                    //   icon: FontAwesomeIcons.telegram,
                    //   size: 40,
                    //   label: 'jseng_tg',
                    //   onPressed: () {
                    //     controller.jsengTelegram();
                    //   },
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Полезные ссылки для изучения английского языка.',
                    style: appBarText,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.behaEng();
                          },
                          child: AvatarGlow(
                            glowColor: Colors.white,
                            endRadius: 60.0,
                            duration: const Duration(milliseconds: 2000),
                            repeat: true,
                            showTwoGlows: true,
                            repeatPauseDuration:
                                const Duration(milliseconds: 100),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Image.asset(
                                'assets/images/beha.png',
                                height: 60,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'beha_en',
                          style: friendsText,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.zabonomuz();
                          },
                          child: AvatarGlow(
                            glowColor: Colors.white,
                            endRadius: 60.0,
                            duration: const Duration(milliseconds: 2000),
                            repeat: true,
                            showTwoGlows: true,
                            repeatPauseDuration:
                                const Duration(milliseconds: 100),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.asset(
                                  'assets/images/zabon.png',
                                  height: 60,
                                )),
                          ),
                        ),
                        Text(
                          'zabonomuz',
                          style: friendsText,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.salmon();
                          },
                          child: AvatarGlow(
                            glowColor: Colors.white,
                            endRadius: 60.0,
                            duration: const Duration(milliseconds: 2000),
                            repeat: true,
                            showTwoGlows: true,
                            repeatPauseDuration:
                                const Duration(milliseconds: 100),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Image.asset(
                                'assets/images/salmon.png',
                                height: 60,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'salmon.olmon',
                          style: friendsText,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
