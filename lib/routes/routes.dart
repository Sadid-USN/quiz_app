import 'package:get/get.dart';
import 'package:quizapp/controller/question_paper/qustions_comtroller.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';
import 'package:quizapp/controller/zoom_drawer_controller.dart';
import 'package:quizapp/screens/Login/login_screen.dart';
import 'package:quizapp/screens/answer_check_screen.dart';
import 'package:quizapp/screens/home/home_screen.dart';
import 'package:quizapp/screens/introduction/introduction.dart';
import 'package:quizapp/screens/quiz_screen.dart';
import 'package:quizapp/screens/result_screen.dart';
import 'package:quizapp/screens/splash/splash_screen.dart';
import 'package:quizapp/screens/test_overview_screen.dart';

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
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
            name: HomeScreen.routName,
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(FirebaseStorageController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(
            name: QuizScreen.routeName,
            page: () => const QuizScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionsController());
            })),
        GetPage(
          name: TestOverviewScreen.routName,
          page: () => const TestOverviewScreen(),
        ),
        GetPage(
          name: ResultScreen.routName,
          page: () => const ResultScreen(),
        ),
        GetPage(
          name: AnswerCheckScreen.routName,
          page: () => const AnswerCheckScreen(),
        ),
      ];
}
