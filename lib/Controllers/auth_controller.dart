import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:playbeat/Utilities/overlays_widgets.dart';
import 'package:playbeat/pages/Home/home_page.dart';
import 'package:playbeat/pages/main_screen.dart';

class AuthController extends GetxController {
  static const admin = 'admin';
  RxBool isVisible = false.obs;
  RxBool isConfirmPassword = true.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _intialScreen);
  }

  _intialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const MainScreen());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  Future<void> register(String email, String password) async {
    try {
      loadingOverlay("Signing up");
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      Get.back();
      errorOverlay(e.message.toString());
      log(e.message.toString());
    } catch (e) {
      Get.back();
      log(e.toString());
      errorOverlay(e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      loadingOverlay('Logging in');
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.back();
      errorOverlay(e.message.toString());
      log(e.message.toString());
    }
  }

  Future<bool> adminLogin(String email, String password) async {
    try {
      loadingOverlay('Authenticating');
      final result = await firestore.collection(admin).doc('adminLogin').get();
      String adminEmail = result.get('adminEmail');
      String adminPassword = result.get('adminPassword');

      if (adminEmail != email) {
        Get.back();
        errorOverlay('Email id is incorrect');
        return false;
      } else if (adminPassword != password) {
        Get.back();
        errorOverlay('Password is incorrect');
        return false;
      } else if (adminEmail == email && adminPassword == password) {
        Get.back();
        return true;
      } else {
        Get.back();
        errorOverlay('Something went wrong');
        return false;
      }
    } catch (e) {
      Get.back();
      errorOverlay(e.toString());
      return false;
    }
  }

  void logout() {
    auth.signOut();
  }
}
