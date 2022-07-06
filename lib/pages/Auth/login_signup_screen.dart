import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resuableComponents/Buttons/round_button.dart';
import '../../resuableComponents/InputFields/rounded_password_field.dart';
import '../../resuableComponents/InputFields/rounded_text_field.dart';

class AuthScreen extends StatefulWidget {
  final bool isSignup;
  const AuthScreen({Key? key, required this.isSignup}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isVisible = false;
  bool isConfirmPassword = false;
  late bool isLogin = !widget.isSignup;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 236, 247),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
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
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      isVisible: isVisible,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (!isLogin)
                      RoundedPasswordField(
                        icon: const Icon(Icons.lock),
                        hintText: 'Confirm your password',
                        onChanged: (value) {
                          log(value);
                        },
                        onPressed: () {
                          setState(() {
                            isConfirmPassword = !isConfirmPassword;
                          });
                        },
                        isVisible: isConfirmPassword,
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
                      isLogin: isLogin,
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (isLogin)
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                            text: "Dont have an account  ",
                            style: TextStyle(fontSize: 17, color: Colors.black),
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
                                fontSize: 19, color: Colors.blue),
                          )
                        ]),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
