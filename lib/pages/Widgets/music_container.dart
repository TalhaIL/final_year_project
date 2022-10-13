import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicContainer extends StatelessWidget {
  final String? category;
  final String? writer;
  final Timestamp? uploadedDate;
  final String? imageUrl;
  final String? singer;
  final String? title;
  final bool isAdmin;

  const MusicContainer(
      {required this.isAdmin,
      super.key,
      this.imageUrl,
      this.singer,
      this.title,
      this.category,
      this.writer,
      this.uploadedDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height: 80,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    // decoration: BoxDecoration(
                    //     border: Border.all(width: 2),
                    //     borderRadius: const BorderRadius.all(
                    //       Radius.circular(25),
                    //     )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: imageUrl.toString(),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        singer.toString(),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  isAdmin
                      ? IconButton(
                          onPressed: () {
                            Get.bottomSheet(
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(35),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Details',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      musicDetail('Title', title.toString()),
                                      musicDetail('Singer', singer.toString()),
                                      musicDetail('Writer', writer.toString()),
                                      musicDetail(
                                          'Category', category.toString()),
                                      musicDetail('Uploaded Date',
                                          uploadedDate.toString()),
                                      musicDetail('Size', '15 MB'),
                                      musicDetail('Length time', '1:25'),
                                      musicDetail('Uploaded by',
                                          'ilyastalha84@gmail.com'),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      customMaterialButton(
                                        'Disapprove',
                                        Colors.red,
                                        () {},
                                        const BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      customMaterialButton(
                                        'Approve',
                                        Colors.deepPurple,
                                        () {},
                                        const BorderRadius.vertical(
                                          bottom: Radius.circular(20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                              isDismissible: true,
                              enableDrag: false,
                            );
                          },
                          icon: const Icon(Icons.more_vert),
                        )
                      : Container()
                  // : const Padding(
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: 10, vertical: 10),
                  //     child: Icon(Icons.favorite_outline),
                  //   )
                ],
              ),
            ],
          ),
        ),
        // const SizedBox(
        //   height: 5,
        // ),
        // const Divider(
        //   thickness: 0.5,
        // ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  MaterialButton customMaterialButton(
      String text, Color color, void Function()? onPress, BorderRadius border) {
    return MaterialButton(
      height: 40,
      minWidth: 120,
      color: color,
      onPressed: onPress,
      shape: RoundedRectangleBorder(borderRadius: border),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Column musicDetail(String key, String value) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$key : ',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                value,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
