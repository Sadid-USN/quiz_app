import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizapp/firebase/refrences.dart';
import 'package:quizapp/screens/Login/login_screen.dart';
import 'package:quizapp/widgets/dialogs/dialog_widget.dart';

class AuthController extends GetxController {
  late TextEditingController loginEmail;
  late TextEditingController loginPassword;

  GlobalKey<FormState> signUpFormstate = GlobalKey<FormState>();
  bool isShowPassword = true;
  bool isShowRepeadPassword = true;

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  signUpValidator() {
    if (signUpFormstate.currentState!.validate()) {
      print('Validate');
    } else {
      print('not Valid');
    }
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  showRepeatPassword() {
    isShowRepeadPassword = isShowRepeadPassword == true ? false : true;
    update();
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
        goToHomeScreen();
      } else {
        goToHomePage();
      }
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  goToHomeScreen() {
    Get.toNamed('home');
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRef.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  Future<void> signOut() async {
    print('***SIGN OUT***');

    try {
      await _auth.signOut();
      goToHomePage();
    } on FirebaseAuthException catch (error) {
      print(error.message);
    }
  }

  void goToHomePage() {
    Get.offAllNamed('home');
  }

  void showLoginDialog(BuildContext context) {
    Get.dialog(
      Dialogs.startDialog(
        onTap: () {
          Get.back();
          goToLoginScreen();
        },
        cancel: () {
          Navigator.of(context).pop();
        },
      ),
      barrierDismissible: false,
    );
  }

  bool isLogged() {
    return _auth.currentUser != null;
  }

  void goToLoginScreen() {
    Get.toNamed(LoginScreen.routeName);
  }

  void goToIntroductionScreen() {
    Get.offAllNamed('/introduction');
  }
}
