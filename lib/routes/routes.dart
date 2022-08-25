import 'package:get/get.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';
import 'package:quizapp/screens/home/home_screen.dart';
import 'package:quizapp/screens/introduction/introduction.dart';
import 'package:quizapp/screens/splash/splash_screen.dart';

class Routes {
  static List<GetPage> routes() => [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/introduction',
          page: () => const IntroductionScreen(),
        ),
        GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(FirebaseStorageController());
            })),
      ];
}
