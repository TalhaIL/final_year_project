import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbeat/pages/Categories/category_page.dart';
import 'package:playbeat/pages/Favorite/favorites_page.dart';
import 'package:playbeat/pages/Upload/upload.dart';

class HomeController extends GetxController {
  RxBool isAllSongsPage = true.obs;
  RxInt index = 0.obs;
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
