import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/controller/question_paper/storage_controller.dart';
import 'package:quizapp/functions/validator.dart';
import 'package:quizapp/screens/Login/auth_button.dart';
import 'package:quizapp/widgets/my_field.dart';

class LoginScreen extends GetView<FirebaseStorageController> {
  const LoginScreen({Key? key}) : super(key: key);

  // signUp() {
  //   if (signUpFormstate.currentState!.validate()) {
  //     Get.offNamed(AppRouteNames.verifySignUp);
  //     print('Validate');
  //   } else {
  //     print('not Valid');
  //   }
  // }
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          gradient: toggleMode(),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: controller.signUpFormstate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                Lottie.asset(
                  AppAssets.quiz,
                  height: 150,
                  width: 300,
                ),
                const Text(
                  'Login with Email or Google',
                  style: TextStyle(
                      color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MyField(
                  //controller: controller.loginEmail,
                  hintText: 'Email',
                  isNumber: false,
                  label: 'Email',
                  suffixIcon: Icons.mail_outline,
                  validator: (String? val) {
                    return validator(val!, 5, 32, 'email');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<FirebaseStorageController>(
                  builder: (controller) => MyField(
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    hintText: 'Password',
                    isNumber: false,
                    label: 'Password',
                    obscureText: controller.isShowPassword,
                    suffixIcon: controller.isShowPassword == false
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    //  controller: controller.loginPassword,
                    validator: (String? val) {
                      return validator(val!, 5, 32, 'email');
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GetBuilder<FirebaseStorageController>(
                  builder: (controller) => MyField(
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    hintText: 'Password',
                    isNumber: false,
                    label: 'Password',
                    obscureText: controller.isShowPassword,
                    suffixIcon: controller.isShowPassword == false
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    //  controller: controller.loginPassword,
                    validator: (String? val) {
                      return validator(val!, 5, 32, 'email');
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                AuthButton(
                  onPressed: () {
                    controller.signUp();
                  },
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  text: 'Sign Up',
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppAssets.googleSvg,
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
