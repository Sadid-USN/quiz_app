import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/controller/auth_controller.dart';
import 'package:quizapp/functions/validator.dart';
import 'package:quizapp/screens/Login/auth_button.dart';
import 'package:quizapp/screens/Login/login_page.dart';
import 'package:quizapp/widgets/my_field.dart';

class SignUpPage extends GetView<AuthController> {
  const SignUpPage({Key? key}) : super(key: key);

  static const String routeName = '/signup';
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
                  height: 100,
                ),
                Lottie.asset(
                  AppAssets.quiz,
                  height: 150,
                  width: 300,
                ),
                const Text(
                  'Sign Up With Email Or Google',
                  style: TextStyle(
                      color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GetBuilder<AuthController>(
                  builder: (controller) => MyField(
                    controller: controller.sginUpEmailController,
                    hintText: 'Email',
                    isNumber: false,
                    label: 'Email',
                    suffixIcon: Icons.mail_outline,
                    validator: (String? val) {
                      return validator(val!, 5, 32, 'email');
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<AuthController>(
                  builder: (controller) => MyField(
                    controller: controller.signUpPasswordController,
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
                      return validator(val!, 5, 32, 'password');
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GetBuilder<AuthController>(
                  builder: (controller) => MyField(
                    controller: controller.confirmPasswordController,
                    onTapIcon: () {
                      controller.showRepeatPassword();
                    },
                    hintText: 'Repeat Password',
                    isNumber: false,
                    label: 'Repeat Password',
                    obscureText: controller.isShowRepeadPassword,
                    suffixIcon: controller.isShowRepeadPassword == false
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    //  controller: controller.loginPassword,
                    validator: (String? val) {
                      return validator(val!, 5, 32, 'confirm');
                    },
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                AuthButton(
                  onPressed: () {
                    if (controller.signUpFormstate.currentState!.validate()) {
                      controller.signeUp(
                          controller.sginUpEmailController.text.trim(),
                          controller.signUpPasswordController.text.trim(),
                          controller.confirmPasswordController.text.trim());
                      controller.clearAllControllers();
                      controller.goToHomePage();
                      // controller.goToHomePage();
                    }
                  },
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  title: 'Sign Up',
                ),
                const SizedBox(
                  height: 16.0,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(LoginPage.routeName);
                    controller.clearAllControllers();
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account?  ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                GestureDetector(
                  onTap: () {
                    controller.signInWithGoogle();
                  },
                  child: SvgPicture.asset(
                    AppAssets.googleSvg,
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
