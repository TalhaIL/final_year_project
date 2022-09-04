import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminApproval extends StatelessWidget {
  const AdminApproval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Approval'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                            '19 MB | 1:50',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
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
                                    musicDetail('Title', 'Aya Lariye'),
                                    musicDetail('Singer', 'Nadeem'),
                                    musicDetail('Writer', 'Haseeb'),
                                    musicDetail('Category', 'Classic'),
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
                    ],
                  ),
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
      ),
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
