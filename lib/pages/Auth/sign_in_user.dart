import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbeat/Controllers/auth_controller.dart';
import 'package:playbeat/pages/Widgets/round_button.dart';
import 'package:playbeat/pages/Widgets/rounded_password_field.dart';
import 'package:playbeat/pages/Widgets/rounded_text_field.dart';

class AuthScreen extends StatelessWidget {
  final authController = Get.put(AuthController());
  AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          (() => Text(authController.isLogin.value
              ? 'User\'s Login'
              : 'User\'s Signup')),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 236, 247),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: authController.isLogin.value ? 30 : 20),
                  child: Column(
                    children: [
                      const Image(
                        height: 250,
                        image: AssetImage('assets/images/headphone.png'),
                      ),
                      const SizedBox(height: 30),
                      RoundedTextField(
                        icon: const Icon(Icons.person),
                        onChanged: (value) {
                          log(value);
                        },
                        hintText: 'Enter your Email',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RoundedPasswordField(
                        icon: const Icon(Icons.lock),
                        hintText: 'Enter your password',
                        onChanged: (value) {
                          log(value);
                        },
                        onPressed: () {
                          authController.isVisible.value =
                              !authController.isVisible.value;
                        },
                        isVisible: authController.isVisible.value,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (!authController.isLogin.value)
                        Obx(
                          () => RoundedPasswordField(
                            icon: const Icon(Icons.lock),
                            hintText: 'Confirm your password',
                            onChanged: (value) {
                              log(value);
                            },
                            onPressed: () {
                              authController.isConfirmPassword.value =
                                  !authController.isConfirmPassword.value;
                            },
                            isVisible: authController.isConfirmPassword.value,
                          ),
                        ),
                      authController.isLogin.value == true
                          ? const SizedBox(
                              height: 10,
                            )
                          : const SizedBox(
                              height: 40,
                            ),
                      RoundButton(
                        size: size,
                        text: authController.isLogin.value ? 'Login' : 'Signup',
                        onPress: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (authController.isLogin.value)
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "Dont have an account  ",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Register?',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    log('Hello');
                                    authController.isLogin.value = false;
                                  },
                                style: const TextStyle(
                                  fontSize: 19,
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        )
                    ],
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
