import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizapp/controller/theme_controller.dart';
import 'package:quizapp/generated/l10n.dart';
import 'package:quizapp/lang_storage.dart';
import 'package:quizapp/routes/bindings/inti_bindings.dart';
import 'package:quizapp/routes/routes.dart';
import 'package:quizapp/screens/splash/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // questionRF.get(const GetOptions(source: Source.cache));
  IntialBindings().dependencies();
  runApp(const MyApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());

// FirebaseDatabase.instance.setPersistenceEnabled(true);
// }

//3:09
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    Locale getLocaleCode() {
    final storedCode = languageStorage.read('code');
    if (storedCode != null) {
      return Locale(storedCode);
    } else {
      return WidgetsBinding.instance.platformDispatcher.locale;
    }
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: getLocaleCode(),
        supportedLocales: S.delegate.supportedLocales,
        // home: DataUploadedScreen(),
        home: const SplashScreen(),
        getPages: Routes.routes(),
        title: 'Quiz',
        theme: Get.find<ThemeController>().ligthTheme);
  }
}
