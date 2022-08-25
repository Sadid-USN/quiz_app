import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quizapp/firebase/refrences.dart';
import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/screens/home/home_screen.dart';
import 'package:quizapp/services/faribase_storage_service.dart';

class FirebaseStorageController extends GetxController {
  // FirebaseStorageController controller = Get.find();

  final allPapers = <QuestionModel>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // List<String> imageName = [
    //   "pazl",
    //   "question",
    // ];
    try {
      // Here we get description from our papers from firebase
      QuerySnapshot<Map<String, dynamic>> data = await questionRF.get();
      final paperList = data.docs
          .map(
            (paper) => QuestionModel.fromSnapshot(paper),
          )
          .toList();
      allPapers.assignAll(paperList);
      //
      for (var paper in paperList) {
        final String? imgUrl =
            //Here based on title name we will get the image name
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.image = imgUrl!;
        allPapers.assignAll(paperList);
        // print(imgUrl);
      }
    } catch (e) {
      print(e);
    }
  }

  gotHomeScreen() {
    Get.to(() => const HomeScreen());
  }
}
