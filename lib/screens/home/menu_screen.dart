import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';

class MenuScreen extends GetView<FirebaseStorageController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.indigo[400],
      ),
      child: SafeArea(
          child: Stack(
        children: [
          Positioned(
            left: 10.0,
            child: IconButton(
              onPressed: () {
                controller.toggleDrawer();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
