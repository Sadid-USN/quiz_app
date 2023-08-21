import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/controller/zoom_drawer_controller.dart';
import 'package:quizapp/generated/l10n.dart';
import 'package:quizapp/screens/home/our_friends_screen.dart';
import 'package:quizapp/widgets/louncher_button.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 7:25
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.deepPurple[400],
      ),
      child: SafeArea(
          child: Stack(
        children: [
          InkWell(
            onTap: controller.toggleDrawer,
            child: const Padding(
              padding: EdgeInsets.only(top: 12.0, left: 16.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16.0, top: MediaQuery.of(context).size.width * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Obx(
                //   () => controller.user.value == null
                //       ? const SizedBox()
                //       :
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(OurFriendsScreen.routName);
                      },
                      child: AvatarGlow(
                        glowColor: Colors.white,
                        endRadius: 60.0,
                        duration: const Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        child: Image.asset(
                          'assets/icons/logo.png',
                          height: 90,
                        ),
                      ),
                    ),

                     Text(
                      S.of(context).ourFriends,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0,
                          color: onSurfaceTextColor),
                    ),
                    // CircleAvatar(
                    //   backgroundImage: NetworkImage(
                    //       controller.user.value!.photoURL ?? ''),
                    //   radius: 40,
                    // ),
                    // const SizedBox(
                    //   height: 16.0,
                    // ),
                    // Text(
                    //   controller.user.value!.displayName ?? '',
                    //   style: const TextStyle(
                    //       fontWeight: FontWeight.w900,
                    //       fontSize: 18.0,
                    //       color: onSurfaceTextColor),
                    // ),
                  ],
                ),

                const Spacer(
                  flex: 1,
                ),
                LouncherButton(
                  color: onSurfaceTextColor,
                  icon: Icons.email_outlined,
                  size: 20,
                  label: 'Email',
                  onPressed: () {
                    controller.email();
                  },
                ),
                LouncherButton(
                  color: Colors.red,
                  icon: FontAwesomeIcons.instagram,
                  size: 20,
                  label: 'instagram',
                  onPressed: () {
                    controller.instagramm();
                  },
                ),
                LouncherButton(
                  color: Colors.blue,
                  icon: FontAwesomeIcons.facebook,
                  size: 20,
                  label: 'facebook',
                  onPressed: () {
                    controller.facebook();
                  },
                ),
                LouncherButton(
                  color: Colors.redAccent,
                  icon: FontAwesomeIcons.youtube,
                  size: 18,
                  label: 'youtube',
                  onPressed: () {
                    controller.youTube();
                  },
                ),
                const Spacer(
                  flex: 2,
                ),
                LouncherButton(
                  color: onSurfaceTextColor,
                  icon: Icons.logout_outlined,
                  size: 20,
                  label: S.of(context).signOut,
                  onPressed: () {
                    controller.signOut();
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
