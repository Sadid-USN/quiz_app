import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';
import 'package:quizapp/screens/home/menu_screen.dart';
import 'package:quizapp/screens/home/quiz_card.dart';

class HomeScreen extends GetView<FirebaseStorageController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routName = '/home';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.exitDialog,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[400],
        body: GetBuilder<FirebaseStorageController>(
          builder: (_) {
            return ZoomDrawer(
              //  slideWidth: MediaQuery.of(context).size.width * 0.5,
              borderRadius: 20.0,
              showShadow: true,
              controller: _.zoomDrawerController,
              isRtl: false,
              angle: 0.0,
              menuScreen: const MenuScreen(),
              mainScreen: Container(
                decoration: BoxDecoration(
                  gradient: toggleMode(),
                ),
                child: SafeArea(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: ChangeBrightness.mobileScreenPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: controller.toggleDrawer,
                              child: SvgPicture.asset(
                                AppAssets.muneLeft,
                                color: Colors.white,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.bulb,
                                    color: Colors.white,
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'Викторина английского языка',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Lottie.network(
                                      'https://assets10.lottiefiles.com/packages/lf20_szrbrL.json',
                                      height: 45),
                                  const Spacer(),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                'Сделай свою речь живой и естественной',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: ListView.separated(
                              padding: ChangeBrightness.mobileScreenPadding,
                              separatorBuilder: (BuildContext context, index) {
                                return const SizedBox(
                                  height: 0.0,
                                );
                              },
                              itemBuilder: (BuildContext context, index) {
                                return QuizCard(
                                  model: controller.allPapers[index],
                                );
                              },
                              itemCount: controller.allPapers.length,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
