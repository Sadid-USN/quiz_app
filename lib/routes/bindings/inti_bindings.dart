import 'package:get/get.dart';
import 'package:quizapp/controller/auth_controller.dart';
import 'package:quizapp/controller/theme_controller.dart';
import 'package:quizapp/services/faribase_storage_service.dart';

class IntialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseStorageService());
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
