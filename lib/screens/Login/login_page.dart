import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/configs/assets/assets_svg.dart';
import 'package:quizapp/configs/themes/app_colors.dart';
import 'package:quizapp/controller/auth_controller.dart';
import 'package:quizapp/functions/validator.dart';
import 'package:quizapp/screens/Login/auth_button.dart';
import 'package:quizapp/screens/Login/sign_up_page.dart';
import 'package:quizapp/screens/home/home_screen.dart';
import 'package:quizapp/widgets/my_field.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({Key? key}) : super(key: key);

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
            key: controller.loginFormstate,
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
                  'Login With Email Or Google',
                  style: TextStyle(
                      color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MyField(
                  controller: controller.loginEmail,
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
                GetBuilder<AuthController>(
                  builder: (controller) => MyField(
                    controller: controller.loginPassword,
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
                      return validator(val!, 5, 32, 'Password');
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                AuthButton(
                  onPressed: () {
                    if (controller.loginFormstate.currentState!.validate()) {
                      controller.signeIn(
                        controller.loginEmail.text,
                        controller.loginPassword.text,
                      );
                      Get.toNamed(HomeScreen.routName);
                    }
                  },
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  title: 'Login',
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(SignUpPage.routeName);
                        controller.clearAllControllers();
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account yet?  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
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
