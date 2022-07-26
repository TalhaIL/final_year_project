import 'dart:developer';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbeat/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.put(HomeController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Obx(
        () {
          return homeController.pages[homeController.index.value];
        },
      ),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.deepPurple,
          animationDuration: const Duration(milliseconds: 250),
          height: 55,
          onTap: (index) {
            homeController.index.value = index;
            log(index.toString());
            log(homeController.index.toString());
          },
          items: homeController.items,
          index: homeController.index.value,
        ),
      ),
    );
  }
}
