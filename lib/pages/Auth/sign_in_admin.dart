import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:playbeat/pages/Admin/admin_approval_page.dart';
import 'package:playbeat/Controllers/auth_controller.dart';
import 'package:playbeat/pages/Widgets/round_button.dart';
import 'package:playbeat/pages/Widgets/rounded_password_field.dart';
import 'package:playbeat/pages/Widgets/rounded_text_field.dart';

class AdminSignIn extends StatelessWidget {
  final authController = Get.put(AuthController());
  AdminSignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin\'s Login'),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 236, 247),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 25),
                    child: Column(
                      children: [
                        const Image(
                          height: 300,
                          image: AssetImage('assets/images/Admin.png'),
                        ),
                        const SizedBox(height: 30),
                        RoundedTextField(
                          icon: const Icon(Icons.person),
                          onChanged: (value) {
                            log(value);
                          },
                          hintText: 'Enter admin email',
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: 'Required'),
                              EmailValidator(
                                  errorText: 'Please enter a valid email'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RoundedPasswordField(
                          icon: const Icon(Icons.lock),
                          hintText: 'Enter admin password',
                          onChanged: (value) {
                            log(value);
                          },
                          onPressed: () {
                            authController.isVisible.value =
                                !authController.isVisible.value;
                          },
                          isVisible: authController.isVisible.value,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Required'),
                          ]),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RoundButton(
                            size: size,
                            onPress: () {
                              Get.to(() => const AdminApproval());
                            },
                            text: 'Login')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
