import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/question_paper/data_uploader.dart';
import 'package:quizapp/firebase/loading_status.dart';

class DataUploadedScreen extends StatelessWidget {
  DataUploadedScreen({Key? key}) : super(key: key);

  Datauploader controller = Get.put(Datauploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 1:42

        body: Center(
      child: Obx(() => Text(
          controller.loadingStatus.value == LoadingStatus.completed
              ? 'Uploading Complited'
              : 'Uploading...')),
    ));
  }
}
