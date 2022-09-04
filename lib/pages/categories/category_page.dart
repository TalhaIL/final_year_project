import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbeat/pages/Music/music_page.dart';
import 'package:playbeat/pages/categories/drawer.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: appBar(),
        body: TabBarView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => MusicScreen());
                      },
                      child: musicContainer(
                        categoryName: 'Pop',
                        imageUrl: 'assets/images/categories/pop.jpg',
                      ),
                    ),
                    musicContainer(
                      categoryName: 'Rock',
                      imageUrl: 'assets/images/categories/rock.jpg',
                    ),
                    musicContainer(
                      categoryName: 'Hip Hop',
                      imageUrl: 'assets/images/categories/hiphop.jpg',
                    ),
                    musicContainer(
                      categoryName: 'Electronic',
                      imageUrl: 'assets/images/categories/electronic.jpg',
                    ),
                    musicContainer(
                      categoryName: 'Classic',
                      imageUrl: 'assets/images/categories/classic.jpg',
                    ),
                  ],
                ),
              ),
            ),
            const Center(
              child: Text('All'),
            )
          ],
        ),
      ),
    );
  }

  // Drawer drawer() {
  //   return Drawer(
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 154,
  //           width: double.infinity,
  //           color: Colors.deepPurple,
  //           child: Padding(
  //             padding: const EdgeInsets.only(left: 10.0, bottom: 15),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 iconWithText(
  //                     icon: Icons.music_note,
  //                     iconSize: 35,
  //                     text: 'Play the Beat',
  //                     fontSize: 30,
  //                     fontWeight: FontWeight.bold),
  //                 const SizedBox(
  //                   height: 15,
  //                 ),
  //                 iconWithText(
  //                   icon: Icons.person,
  //                   iconSize: 22,
  //                   text: 'Muhammad Talha Ilyas',
  //                   fontSize: 16,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(
  //             horizontal: 10.0,
  //           ),
  //           child: Column(
  //             children: const [
  //               DrawerItem(
  //                 icon: Icons.privacy_tip_outlined,
  //                 text: 'Privacy Policy',
  //               ),
  //               DrawerItem(
  //                 icon: Icons.info_outline,
  //                 text: 'About',
  //               ),
  //               DrawerItem(
  //                 icon: Icons.logout,
  //                 text: 'Logout',
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

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
          icon: const Icon(Icons.notifications),
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
          Tab(text: 'Categories'),
          Tab(
            text: 'All',
          ),
        ],
      ),
    );
  }

  Column musicContainer(
      {required String categoryName, required String imageUrl}) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.black,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
            ),
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

//   Row iconWithText({
//     required IconData icon,
//     double? iconSize,
//     required String text,
//     double? fontSize,
//     FontWeight? fontWeight,
//   }) {
//     return Row(
//       children: [
//         Icon(
//           icon,
//           size: iconSize,
//           color: Colors.white,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Text(
//           text,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: fontSize,
//             fontWeight: fontWeight,
//           ),
//         )
//       ],
//     );
//   }
}
