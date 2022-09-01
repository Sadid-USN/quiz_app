import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/ui_parameters.dart';

class ContetArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;

  const ContetArea({Key? key, required this.child, this.addPadding = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: const BoxDecoration(color: Colors.black12),
        padding: addPadding
            ? EdgeInsets.only(
                top: mobileScreenPadding,
                left: mobileScreenPadding,
                right: mobileScreenPadding,
              )
            : EdgeInsets.zero,
      ),
    );
  }
}
