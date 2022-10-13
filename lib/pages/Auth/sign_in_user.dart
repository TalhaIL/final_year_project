import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbeat/Controllers/auth_controller.dart';
import 'package:playbeat/Utilities/input_valiators.dart';
import 'package:playbeat/pages/Widgets/round_button.dart';
import 'package:playbeat/pages/Widgets/rounded_password_field.dart';
import 'package:playbeat/pages/Widgets/rounded_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'User\'s Login' : 'User\'s Signup'),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 236, 247),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 35, vertical: isLogin ? 30 : 20),
                  child: Column(
                    children: [
                      const Image(
                        height: 250,
                        image: AssetImage('assets/images/headphone.png'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RoundedTextField(
                        controller: emailController,
                        icon: const Icon(Icons.person),
                        onChanged: (value) {
                          log(value);
                        },
                        hintText: 'Enter your Email',
                        validator: emailValidator,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RoundedPasswordField(
                        controller: passwordController,
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
                        validator: passwordValidator,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (!isLogin)
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
                            validator: (value) =>
                                confirmPasswordValidator.validateMatch(
                                    value.toString(), passwordController.text),
                          ),
                        ),
                      isLogin == true
                          ? const SizedBox(
                              height: 10,
                            )
                          : const SizedBox(
                              height: 40,
                            ),
                      RoundButton(
                        size: size,
                        text: isLogin ? 'Login' : 'Signup',
                        onPress: () {
                          if (_formkey.currentState!.validate()) {
                            isLogin
                                ? AuthController.instance.login(
                                    emailController.text.trim(),
                                    passwordController.text,
                                  )
                                : AuthController.instance.register(
                                    emailController.text.trim(),
                                    passwordController.text,
                                  );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (isLogin)
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
                                    setState(() {
                                      isLogin = false;
                                    });
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
