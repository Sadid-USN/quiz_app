import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/controller/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 7:25
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.indigo[400],
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
                Obx(
                  () => controller.user.value == null
                      ? const SizedBox()
                      : Column(
                          children: [
                            Text(
                              controller.user.value!.displayName ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.0,
                                  color: onSurfaceTextColor),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  controller.user.value!.photoURL ?? ''),
                              radius: 40,
                            )
                          ],
                        ),
                ),
                const Spacer(
                  flex: 1,
                ),
                _DrawerButton(
                  color: onSurfaceTextColor,
                  icon: Icons.email_outlined,
                  size: 20,
                  label: 'Email',
                  onPressed: () {
                    controller.email();
                  },
                ),
                _DrawerButton(
                  color: Colors.red,
                  icon: FontAwesomeIcons.instagram,
                  size: 20,
                  label: 'instagram',
                  onPressed: () {
                    controller.instagramm();
                  },
                ),
                _DrawerButton(
                  color: Colors.blue,
                  icon: FontAwesomeIcons.facebook,
                  size: 20,
                  label: 'facebook',
                  onPressed: () {
                    controller.facebook();
                  },
                ),
                _DrawerButton(
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
                _DrawerButton(
                  color: onSurfaceTextColor,
                  icon: Icons.logout_outlined,
                  size: 20,
                  label: 'Выйти из аккаунта',
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

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {Key? key,
      required this.icon,
      required this.size,
      required this.label,
      required this.color,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final Color color;
  final double? size;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: size,
          color: color,
        ),
        label: Text(
          label,
          style: const TextStyle(color: onSurfaceTextColor),
        ));
  }
}
