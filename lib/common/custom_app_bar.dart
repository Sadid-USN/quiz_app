import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';
import 'package:quizapp/screens/test_overview_screen.dart';
import 'package:quizapp/widgets/app_circul_button.dart';
import 'package:quizapp/widgets/countdown_timer.dart';

//!
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = "",
    this.showActionIcon = false,
    this.titleWidget,
    this.leading,
    this.onMenuTap,
  }) : super(key: key);

  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: titleWidget == null
                ? Center(
                    child: Text(
                      title,
                      style: appBarText,
                    ),
                  )
                : Center(
                    child: titleWidget,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  Transform.translate(
                    offset: const Offset(14, 0),
                    child: const BackButton(),
                  ),
              if (showActionIcon)
                Transform.translate(
                  offset: const Offset(10, 0),
                  child: AppCirculeButton(
                    // ignore: unnecessary_null_in_if_null_operators
                    onTap: onMenuTap ??
                        () => Get.toNamed(TestOverviewScreen.routName),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SvgPicture.asset(
                        AppAssets.muneLeft,
                        color: Get.isDarkMode
                            ? startPrimaryDarkColor
                            : onSurfaceTextColor,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 100);
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    QuestionsController controller = Get.put(QuestionsController());
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              alignment: Alignment.center,
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1.2, color: Colors.white)),
              child: Obx(
                () => CountDownTimer(
                  time: controller.time.value,
                  color: Colors.white,
                ),
              )),
          Obx(
            () => Text(
              'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
              style: appBarText,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              AppAssets.muneLeft,
              color: Colors.white,
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
