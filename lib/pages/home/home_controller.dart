import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbeat/pages/categories/category_page.dart';
import 'package:playbeat/pages/favorite/favorite.dart';
import 'package:playbeat/pages/upload/upload.dart';

class HomeController extends GetxController {
  RxInt index = 1.obs;
  final List<Icon> items = [
    const Icon(
      Icons.home_filled,
      size: 30,
      color: Colors.white,
    ),
    const Icon(
      Icons.add,
      size: 30,
      color: Colors.white,
    ),
    const Icon(
      Icons.favorite,
      size: 30,
      color: Colors.white,
    ),
  ];

  final List<Widget> pages = [
    const CategoryPage(),
    const UploadPage(),
    const FavoritePage(),
  ];
}
