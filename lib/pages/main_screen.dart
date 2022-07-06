import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbeat/pages/Auth/login_signup_screen.dart';
import 'package:playbeat/pages/home/home_page.dart';
import 'package:playbeat/resuableComponents/Buttons/round_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 236, 247),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                const Image(
                  height: 350,
                  image: AssetImage('assets/images/mic_drop.png'),
                ),
                Positioned(
                  right: 0,
                  top: 10,
                  child: TextButton(
                    onPressed: () {
                      Get.to(HomePage());
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: const [
                  Text(
                    'Listen your',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'favorite songs here',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Explore your favorite songs here and you have a chance to make your song viral',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 151, 149, 166),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundButton(
                  size: size,
                  isLogin: true,
                  onPress: () {
                    Get.to(
                      const AuthScreen(isSignup: false),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundButton(
                  size: size,
                  isLogin: false,
                  onPress: () {
                    Get.to(
                      const AuthScreen(isSignup: true),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}