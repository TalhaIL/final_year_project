import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playbeat/Utilities/overlays_widgets.dart';
import 'package:playbeat/pages/Categories/category_view.dart';
import 'package:playbeat/pages/Categories/drawer.dart';
import 'package:playbeat/pages/Favorites/favorite_page.dart';
import 'package:playbeat/pages/Music/songs_view.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  Future getData() async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      QuerySnapshot snapshot = await fireStore.collection('categories').get();
      return snapshot.docs;
    } catch (e) {
      errorOverlay(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: appBar(),
        body: TabBarView(
          children: [
            CategoryView(),
            const SongView(
              isAdmin: false,
              isAllSongs: true,
              userUploads: false,
            ),
            const FavoritePage()
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Play Beat',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      bottom: const TabBar(
        indicatorColor: Colors.white,
        padding: EdgeInsets.only(bottom: 10),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 2.5,
        labelStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        labelColor: Colors.white,
        tabs: [
          Tab(text: 'Category'),
          Tab(
            text: 'All',
          ),
          Tab(
            icon: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }

  Column categoryContainer(
      {required String categoryName, required String imageUrl}) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )),
            Positioned(
              top: 15,
              left: 15,
              child: Container(
                height: 30,
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  categoryName,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
