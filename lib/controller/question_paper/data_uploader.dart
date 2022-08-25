import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizapp/firebase/loading_status.dart';
import 'package:quizapp/firebase/refrences.dart';
import 'package:quizapp/models/question_model.dart';

class Datauploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; // this is 0 value

    final firbaseStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    //json.decode Parses the string and returns the resulting Json object.
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    //
    final papersInAssets = manifestMap.keys
        .where(
          (path) =>
              path.startsWith('assets/DB/papers') && path.contains('.json'),
        )
        .toList();

    List<QuestionModel> questionModel = [];

    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionModel
          .add(QuestionModel.fromJson(json.decode(stringPaperContent)));
    }

    // print('Items number ${questionModel[0].description}');
    var batch = firbaseStore.batch();

    for (var paper in questionModel) {
      batch.set(questionRF.doc(paper.id), {
        "title": paper.title,
        "image": paper.image,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count":
            paper.questions == null ? 0 : paper.questions!.length,
      });
      for (var questions in paper.questions!) {
        final questionPath =
            questionRef(id: paper.id, questionID: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer,
        });

        for (var answer in questions.answers) {
          batch.set(questionPath.collection("answers").doc(answer.identifier),
              {"identifier": answer.identifier, "answer": answer.answer});
        }
      }
    }

    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
