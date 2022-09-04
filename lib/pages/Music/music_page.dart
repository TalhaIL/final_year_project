import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbeat/Controllers/upload_controller.dart';

class MusicScreen extends StatelessWidget {
  MusicScreen({Key? key}) : super(key: key);
  final uploadController = Get.put(UploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: ListView.builder(
            itemCount: uploadController.musicFiles.length,
            itemBuilder: ((context, index) => InkWell(
                  onTap: () {
                    uploadController.openFile(index);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 70,
                                  width: 100,
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/SongsImages/ayaLariye.jpg'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Aya Lariye',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Nadeem Baig',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      '19 MB | 1:25',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                        child: Divider(
                          thickness: 0.7,
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
