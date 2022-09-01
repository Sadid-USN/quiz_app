import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizapp/firebase/refrences.dart';
import 'package:quizapp/widgets/dialogs/dialog_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value;
    });
    goToIntroductionScreen();
  }

  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: authAccount.idToken,
          accessToken: authAccount.accessToken,
        );

        await _auth.signInWithCredential(credential);
        await saveUser(account);
      }
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRef.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  void showLoginDialog() {
    Get.dialog(
      Dialogs.startDialog(onTap: () {
        Get.back();
        //Navigate to LoginPage
      }),
      barrierDismissible: false,
    );
  }

  bool isLogged() {
    return _auth.currentUser != null;
  }

  void goToIntroductionScreen() {
    Get.offAllNamed('/introduction');
  }
}
