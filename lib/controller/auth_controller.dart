import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizapp/firebase/refrences.dart';
import 'package:quizapp/screens/Login/sign_up_page.dart';
import 'package:quizapp/widgets/dialogs/dialog_widget.dart';

class AuthController extends GetxController {
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  TextEditingController sginUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> signUpFormstate = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormstate = GlobalKey<FormState>();
  bool isShowPassword = true;
  bool isShowRepeadPassword = true;

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  clearAllControllers() {
    sginUpEmailController.clear();
    signUpPasswordController.clear();
    confirmPasswordController.clear();

    loginEmail.clear();
    loginPassword.clear();
  }

  @override
  void dispose() {
    loginEmail.dispose();
    loginPassword.dispose();

    sginUpEmailController.dispose();
    signUpPasswordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  signUpValidator() {
    if (signUpFormstate.currentState!.validate()) {
    } else {
      print('not Valid');
    }
  }

  loginValidator() {
    if (loginFormstate.currentState!.validate()) {
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
    Get.offAllNamed(SignUpPage.routeName);
  }

  void goToIntroductionScreen() {
    Get.offAllNamed('/introduction');
  }

  Future signeIn(
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  // ! create user
  Future signeUp(
    String email,
    String password,
    String confirmPasword,
  ) async {
    if (passwordConfirm(password, confirmPasword)) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      // add user details
      // addUserDetails(firstName.trim(), lastName.trim(),);
    }
  }

  bool passwordConfirm(
    String password,
    String confirmPassword,
  ) {
    if (password.trim() == confirmPassword.trim()) {
      return true;
    } else {
      return false;
    }
  }

  // Future addUserDetails(
  //   String firstName,
  //   String lastName,
  //   int age,
  // ) async {
  //   await FirebaseFirestore.instance.collection('emailUsers').add({
  //     "name": firstName,
  //     "last": lastName,
  //   });
  // }
}
