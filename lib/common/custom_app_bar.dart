import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/custom_textstyle.dart';
import 'package:quizapp/widgets/app_circul_button.dart';

//! 2:40
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
                    onTap: onMenuTap ?? null,
                    child: SvgPicture.asset(
                      AppAssets.muneLeft,
                      color: Colors.black,
                      height: 40,
                      width: 40,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 100);
}
