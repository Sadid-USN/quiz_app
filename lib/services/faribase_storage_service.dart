import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quizapp/firebase/refrences.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imageName) async {
    if (imageName == null) {
      return null;
    }
    try {
      var urlRef = firbaseStorage
          .child('quizimages')
          .child("${imageName.toLowerCase()}.png");

      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (error) {
      return null;
    }
  }
}
